import 'package:flutter/cupertino.dart';
import '../../widgets/BannerWidget.dart';




class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(189, 7, 7, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.55,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Icon(
                    CupertinoIcons.lock_fill,
                    size: h * 0.1,
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Text(
                    "Forgot",
                    style: TextStyle(
                      fontSize: 36,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    "Password?",
                    style: TextStyle(
                      fontSize: 30,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Text(
                    "No worries, we'll send you",
                    style: TextStyle(
                      fontSize: 18,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Text(
                    "reset instructions",
                    style: TextStyle(
                      fontSize: 18,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.45,
              decoration: const BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.05, horizontal: w * 0.1),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: const Padding(
                        padding: EdgeInsets.only(left:8.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              color: CupertinoColors.label
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Container(
                      decoration : BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(255, 80, 80 ,1),
                          width: 2
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(50))
                      ) ,
                      child: const CupertinoListTile(
                        leading : Icon(
                          CupertinoIcons.mail,
                          color: Color.fromRGBO(255, 80, 80 ,0.5),
                        ),
                        title: CupertinoTextField(
                          decoration: BoxDecoration(),

                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SizedBox(
                      width: w * 0.8,
                      child: CupertinoButton(
                        onPressed: (){
                          resetPassword(context);
                        },
                        color: const Color.fromRGBO(189, 7, 7, 1),
                        child: const Text(
                            'Reset Password'
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    CupertinoButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Back to login',
                            style: TextStyle(
                              color: CupertinoColors.label
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          const Icon(
                            CupertinoIcons.back,
                            color: Color.fromRGBO(189, 7, 7, 1),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  resetPassword(BuildContext context){
    Bannerwidget().showErrorBanner(context, "Oops", "Method not implemented yet");
  }
}
