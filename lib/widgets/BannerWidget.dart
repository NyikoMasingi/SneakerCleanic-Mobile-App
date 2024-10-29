import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Bannerwidget{
  showErrorBanner(BuildContext context, String message){
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context){
          double w = MediaQuery.of(context).size.width;
          double h = MediaQuery.of(context).size.height;
          return AlertDialog(
            //backgroundColor: const Color.fromRGBO(189, 7, 7, 1),
            title: SizedBox(
              height: h * 0.12,
              width: w,
              child: Icon(
                CupertinoIcons.exclamationmark_triangle,
                color: const Color.fromRGBO(189, 7, 7, 1),
                size: h * 0.1,
              ),
            ),
            content: Padding(
              padding: EdgeInsets.only(left: w * 0.01, right: w * 0.01),
              child: Container(
                height: h * 0.075,
                constraints: BoxConstraints(
                  maxHeight: h * 0.1,
                ),
                width: w,
                alignment: Alignment.topCenter,
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                  ),
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: h * 0.05,
                  width: w * 0.5,
                  alignment: Alignment.center,

                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(189, 7, 7, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              )
            ],

          );
        }
    );
  }

  showSuccessBanner(BuildContext context, String message, void Function() function){
    showCupertinoDialog(
      context : context,
      builder : (BuildContext context){
        double w = MediaQuery.of(context).size.width;
        double h = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: SizedBox(
            height: h * 0.1,
            child: Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: CupertinoColors.activeGreen,
              size: h * 0.1,
            ),
          ),
          content: Container(
            height: h * 0.05,
            constraints: BoxConstraints(
              maxHeight: h * 0.1,
            ),
            width: w,
            alignment: Alignment.topCenter,
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 16
              ),
            ),

          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: function,
              child: Container(
                width: w * 0.5,
                height: h * 0.05,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: CupertinoColors.activeGreen,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        );
      }
    );
  }

  showTerms(BuildContext context){
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context){
        double w = MediaQuery.of(context).size.width;
        double h = MediaQuery.of(context).size.height;
        return AlertDialog(
          title: const SizedBox(
            child: Text(
              'Sneaker Cleanic - Terms and Conditions',
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ),
          content: SizedBox(
            height: h * 0.5,
            width: w,
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Personal Information',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'We collect your email address, phone number, and name to provide notifications about the status of your sneaker cleaning services. Your personal details will not be used for any purpose other than those stated in this application.',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '2. Use of the App',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'The app allows you to:\n'
                        '-  Receive real-time notifications when your sneakers are ready for pick-up.\n'
                        '-  Track the status of your orders.\n'
                        'You agree to use this app responsibly and not engage in any illegal activities through the platform.',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),


                  Text(
                    '3. Data Protection and Privacy',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'We take your privacy seriously. All personal data collected will be protected in accordance with applicable laws and will not be shared with third parties. You can contact us anytime to request the deletion or update of your personal data.',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),


                  Text(
                    '4. Notifications',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'By using this app, you consent to receiving notifications about your sneaker cleaning services, including when they are ready for pick-up.',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '5. Modifications',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'We reserve the right to modify or terminate any part of the app, its features, or the Terms and Conditions at any time without notice.',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '6. Liability',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'Sneaker Cleanic is not responsible for any damages arising from the use of this app. The app is provided on an "as-is" basis.',
                    style: TextStyle(
                        fontSize: 12
                    ),
                  ),
                  Text(
                    '7. Governing Law',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'These Terms and Conditions are governed by the laws of South Africa. Any disputes related to the app will be handled in accordance with these laws.',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                width: w * 0.3,
                height: h * 0.03,
                decoration: const BoxDecoration(
                  color: CupertinoColors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10
                  ),
                ),
              ),
            )
          ],
        );
      });
  }
}