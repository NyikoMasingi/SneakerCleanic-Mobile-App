import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/widgets/BannerWidget.dart';






class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {

  final emailEditingController = TextEditingController();
  final nameEditingController = TextEditingController();
  final numberEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  bool tnp = false;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.33,
              width: w,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(189, 7, 7, 1),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.05),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let's",
                      style: TextStyle(
                        color: CupertinoColors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                        fontSize: 34
                      ),
                    ),
                    Text(
                      "Create",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 38
                      ),
                    ),
                    Text(
                      "Your",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 38
                      ),
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          color: CupertinoColors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 38
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.02,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: w * 0.1),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromRGBO(255, 80, 80, 1),
                        width: 2
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.person_alt,
                        color: Color.fromRGBO(255, 80, 80, 0.5),
                      ),
                      title: CupertinoTextField(
                        controller: nameEditingController,
                        decoration: const BoxDecoration(),
                        placeholder: "Full Name",
                      ),

                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(255, 80, 80, 1),
                            width: 2
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.mail_solid,
                        color: Color.fromRGBO(255, 80, 80, 0.5),
                      ),
                      title: CupertinoTextField(
                        controller: emailEditingController,
                        decoration: const BoxDecoration(),
                        placeholder: "Email",
                      ),

                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(255, 80, 80, 1),
                            width: 2
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.phone_circle,
                        color: Color.fromRGBO(255, 80, 80, 0.5),
                      ),
                      title: CupertinoTextField(
                        controller: numberEditingController,
                        decoration: const BoxDecoration(),
                        placeholder: "Cellphone Number",
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(255, 80, 80, 1),
                            width: 2
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.padlock_solid,
                        color: Color.fromRGBO(255, 80, 80, 0.5),
                      ),
                      title: CupertinoTextField(
                        controller: passwordEditingController,
                        decoration: const BoxDecoration(),
                        placeholder: "Password",
                        obscureText: true,
                      ),

                    ),
                  ),
                  SizedBox(height: h * 0.02,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(255, 80, 80, 1),
                            width: 2
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: CupertinoListTile(
                      leading: const Icon(
                        CupertinoIcons.lock_fill,
                        color: Color.fromRGBO(255, 80, 80, 0.5),
                      ),
                      title: CupertinoTextField(
                        controller: confirmPasswordEditingController,
                        decoration: const BoxDecoration(),
                        placeholder: "Confirm Password",
                        obscureText: true,
                      ),

                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Row(
                    children: [
                      CupertinoCheckbox(
                        onChanged: (val)=>{
                          setState(() {
                            tnp = val!;
                          })
                        },
                        value: tnp,
                      ),
                      const Text(
                        'I agree to the',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                          color: Colors.black
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Bannerwidget().showErrorBanner(context, "Terms & Privacy", "terms and conditions here");
                        },
                        child: const Text(
                          'Terms & Privacy',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                             color: Colors.black
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: h * 0.01,),
                  Container(
                    width: w * 0.8,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: CupertinoButton(
                      onPressed: (){
                        createCustomer(context);
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Have an account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }



  void createCustomer(BuildContext context){
    if(nameEditingController.text.isEmpty){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that name is filled in");
    }
    else if(emailEditingController.text.isEmpty){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that email is filled in");
    }
    else if(numberEditingController.text.isEmpty){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that cellphone number is filled in");
    }
    else if(passwordEditingController.text.isEmpty){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that password is filled in");
    }
    else if(confirmPasswordEditingController.text.isEmpty){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that confirm password is filled in");
    }
    else if(passwordEditingController.text != confirmPasswordEditingController.text){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that password and confirm password match");
    }
    else if(!tnp){
      Bannerwidget().showErrorBanner(context, "Error", "Please ensure that you accepted terms before proceeding");
    }
    else{
      Bannerwidget().showErrorBanner(context, "Success", "Account should be created here but isn't implemented yet");
    }
  }
}







