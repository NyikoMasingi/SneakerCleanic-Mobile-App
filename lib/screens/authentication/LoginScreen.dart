
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sneakercleanic/screens/HomeScreen.dart';
import 'package:sneakercleanic/screens/TrackerScreen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberEditingController = TextEditingController();
  final passEditingController = TextEditingController();
  bool _isLoading = false;
  bool _isValid = false;



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          //appBar: CupertinoNavigationBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CupertinoTextField(
                  controller: phoneNumberEditingController,
                  placeholder: "Phone Number",
                  maxLength: 10,
                ),
                SizedBox(height: h * 0.03,),
                CupertinoTextField(
                  controller: passEditingController,
                  placeholder: "Password",
                  obscureText: true,
                ),
                SizedBox(height: h * 0.03,),
                CupertinoButton(
                  color: Colors.blue,
                  onPressed: (){
                    userLogin(context);

                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        if(_isLoading)
          Container(
            height: h,
            width: w,
            color: Colors.black.withOpacity(0.5),
            child: const CupertinoActivityIndicator(),
          )
      ],
    );
  }


  void userLogin(BuildContext context) async{
    setState(() {
      _isLoading = true;
    });

    //await Future.delayed(const Duration(seconds: 3));
    String phoneNumber = phoneNumberEditingController.text.trim();
    String password = passEditingController.text.trim();

    if(phoneNumber.isEmpty && password.isEmpty){
      showErrorBanner("ERROR" ,"Fields cannot be empty");
    }
    else{
      try{
        final response = await http.get(Uri.parse("https://cornadarchitecturaldraughting.co.za/api_test/script.php?phone_number=$phoneNumber"));
        if(response.statusCode == 200){
          //List<dynamic> users = jsonDecode(response.body);
          Map<dynamic, dynamic> user = jsonDecode(response.body);

          if(user["password"] == password){
            setState(() {
              _isValid = true;
            });
            checkValid();
          }
          else{
            showErrorBanner("Invalid Credentials" ,"Please double check your phone number and password");
          }
        }
      }
      catch(e){
        showErrorBanner("Invalid Credentials" ,"Please double check your phone number and password");
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void checkValid(){
    if(_isValid){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => TrackerScreen())
      );
    }
  }

  showErrorBanner(String title,  String message){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],

          );
        }
    );
  }
  
  
}



