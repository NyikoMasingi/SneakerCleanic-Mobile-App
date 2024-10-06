import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sneakercleanic/screens/HomeScreen.dart';
import 'package:sneakercleanic/screens/authentication/ForgotPasswordScreen.dart';
import 'package:sneakercleanic/screens/authentication/SignupScreen.dart';
import '../../widgets/BannerWidget.dart';


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
        CupertinoPageScaffold(
          resizeToAvoidBottomInset: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.38,
                  child: Padding(
                    padding: EdgeInsets.only(top:h*0.05),
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              scale: 8,
                              image: AssetImage(
                                  'assets/logo.png'
                              )
                          ),
                        color: CupertinoColors.inactiveGray,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  height: h* 0.1,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Step into Freshness',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            decoration: TextDecoration.none
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.15,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(50)),
                              border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(255, 80, 80 ,1),
                              )
                          ),
                          child: CupertinoListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(255, 80, 80 ,0.5),
                            ),
                            title: CupertinoTextField(
                              decoration: const BoxDecoration(),
                              controller: phoneNumberEditingController,
                              placeholder: "Email or Phone",
                              maxLength: 10,
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.02,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              width: 2,
                              color: const Color.fromRGBO(255, 80, 80 ,1),
                            )
                          ),
                          child: CupertinoListTile(
                            leading: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(255, 80, 80 ,0.5),
                            ),
                            title: CupertinoTextField(
                              decoration: const BoxDecoration(),
                              controller: passEditingController,
                              placeholder: "Password",
                              obscureText: true,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: h * 0.04,),
                Container(
                  height: h * 0.34,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(189, 7, 7, 1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ForgotPasswordScreen())
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.01,),
                        SizedBox(
                          width: w * 0.7,
                          height: h * 0.06,
                          child: CupertinoButton(
                            color: Colors.white,
                            onPressed: (){
                              userLogin(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.02,),
                        const Text(
                          'or',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 18
                          ),
                        ),
                        SizedBox(height: h * 0.02,),
                        SizedBox(
                          width: w * 0.7,
                          height: h * 0.06,
                          child: CupertinoButton(
                            color: CupertinoColors.inactiveGray,
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Signupscreen())
                              );
                            },
                            child: const Text(
                              'Create an account',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if(_isLoading)
          Center(
            child: Container(
              width: w,
              height: h,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5)
              ),
              child: const CupertinoActivityIndicator(
                color: Colors.white,
              ),
            ),
          )
      ],
    );
  }

  void userLogin(BuildContext context) async{
    setState(() {
      _isLoading = true;
    });

    String phoneNumber = phoneNumberEditingController.text.trim();
    String password = passEditingController.text.trim();

    if(phoneNumber.isEmpty && password.isEmpty) {
      Bannerwidget().showErrorBanner(
          context, "Fields cannot be empty");
    }
    else{
      try{
        String api = "https://cornadarchitecturaldraughting.co.za/api_test/script.php/login";
        String cred;
        (phoneNumber.contains("@")) ? cred = "email" : cred = "phone_number";
        Map<String, String> requestBody = {
          cred : phoneNumber,
          "password": password
        };

        final response = await http.post(Uri.parse(api),
          headers: {
            "Content-Type": "application/json", // Make sure the request is JSON
          }, body: jsonEncode(requestBody));

        final decodedResponse = jsonDecode(response.body);
        setState(() {
          _isLoading = false;
        });
        if(decodedResponse['results']['name'] != ''){
          setState(() {
            _isValid = true;
          });
          checkValid();
        }
        else{
          Bannerwidget().showErrorBanner(context,"Please double check your phone number and password");
        }

      }catch(e){
        setState(() {
          _isLoading = false;
        });
        Bannerwidget().showErrorBanner(context,"Please double check your phone number and password");
      }
    }

  }

  void checkValid(){
    if(_isValid){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    }
  }


  
  
}



