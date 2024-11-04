import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/widgets/BannerWidget.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.only(bottom: h * 0.06),
        child: Column(
          children: [
            Container(
              height: h * 0.12,
              width: w,
              decoration: const BoxDecoration(
                //color: CupertinoColors.black,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(255, 50, 49, 1),Color.fromRGBO(255, 143, 76, 1),
                  ],
                  begin: Alignment.centerLeft
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.03),
                child: const Text(
                  'PROFILE',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: 'futura',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: CupertinoColors.white
                  ),
                ),
              ),
            ),
            SizedBox(
              //height: h * 0.20,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.02),
                child: Column(
                  children: [
                    Icon(
                      CupertinoIcons.person_alt,
                      size: h * 0.2,
                    ),
                    const Text(
                      "YINHLA MAKAMU",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'futura',
                          //fontWeight: FontWeight.w100,
                          color: Colors.black,
                          decoration: TextDecoration.none
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Text(
                      "yinhlamakamu@gmail.com",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'futura',
                        fontWeight: FontWeight.w100,
                        color: Colors.black,
                        decoration: TextDecoration.none
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: w,
              height: h * 0.05,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 145, 77, 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.05),
                child: const Text(
                  'General Settings',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: CupertinoColors.black,
                    fontSize: 20,
                    fontFamily: 'vaground',
                    fontWeight: FontWeight.w100
                  ),
                ),
              ),
            ),
            SizedBox(
              //height: h * 0.15,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.02),
                child: Column(
                  children: [
                    listContent(Icons.key, "Change Email",(){
                      Bannerwidget().showSuccessBanner(context, "Change Email", (){
                        Navigator.of(context).pop();
                      });
                    }),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    listContent(Icons.key, "Change Password", (){
                      Bannerwidget().showSuccessBanner(context, "Change password", (){
                        Navigator.of(context).pop();
                      });
                    }),
                  ],
                ),
              ),
            ),
            Container(
              width: w,
              height: h * 0.05,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 145, 77, 1),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.05),
                child: const Text(
                  'Information',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: CupertinoColors.black,
                      fontSize: 20,
                      fontFamily: 'vaground',
                      fontWeight: FontWeight.w100
                  ),
                ),
              ),
            ),

            SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.02),
                child: Column(
                  children: [
                    listContent(Icons.phone_android_rounded, "About App", (){}),

                    listContent(Icons.file_open, "Terms & Conditions", (){}),

                    listContent(CupertinoIcons.checkmark_shield_fill, "Privacy Policy", (){}),

                    listContent(Icons.share, "Share This App", (){}),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listContent (IconData leading, String title, void Function() func){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: CupertinoListTile(
        onTap: (){
          func();
        },
        leading: Icon(
          leading,
          color: CupertinoColors.inactiveGray,
          size: 28,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'futura'
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: CupertinoColors.inactiveGray,
        ),
      ),
    );
  }
}
