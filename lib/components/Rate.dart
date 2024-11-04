import 'package:flutter/cupertino.dart';



class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    Widget ratingDetail(String title, double rating){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Row(
          children: [
            SizedBox(
              width: w * 0.1,
              child: Icon(
                CupertinoIcons.person_crop_circle,
                size: 40,
              ),
            ),
            SizedBox(
              width: w * 0.6,
              child: Column(
                children: [
                  Text(
                    title
                  )
                ],
              ),
            )
          ],
        ),
      );
    }


    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: h * 0.45,
            decoration: const BoxDecoration(
              color: CupertinoColors.activeOrange,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
            ),
            child: Stack(
              children: [
                Container(
                  height: h * 0.3,
                  decoration: const BoxDecoration(
                    color: CupertinoColors.activeBlue,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25))
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: h * 0.15, right: w * 0.075),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemRed,
                        borderRadius: BorderRadius.all(Radius.circular(h * 0.1))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.05),
                        child: const Icon(
                          CupertinoIcons.suit_heart_fill,
                          color: CupertinoColors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: w * 0.5,
                    child: Padding(
                      padding : EdgeInsets.only(left: w * 0.05,bottom: h * 0.02),
                      child: const Text(
                        'RATE OUR SERVICE',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 36,
                          decoration: TextDecoration.none,
                          fontFamily: 'vaground'
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.025, horizontal: w * 0.05),
            child: const Text(
              "HAVEN'T TRIED US YET, RE ZAME RO IMPRESSE.",
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'vaground',
                fontWeight: FontWeight.w100,
                color: CupertinoColors.black,
                decoration: TextDecoration.none
              ),
            ),
          ),
          Center(
            child: Container(
              width: w * 0.9,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: CupertinoColors.black))
              ),
            ),
          ),
          ratingDetail("Nyiko Masingi", 3.5),
          ratingDetail("Yinhla Makamu", 3),
          ratingDetail("Lesego Gumede", 5),
        ],
      ),
    );
  }
}
