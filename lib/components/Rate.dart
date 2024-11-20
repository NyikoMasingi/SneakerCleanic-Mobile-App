import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';



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
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.0075),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: w * 0.1,
              child: const Icon(
                CupertinoIcons.person_crop_circle,
                size: 40,
              ),
            ),
            SizedBox(
              width: w * 0.78,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 14,
                            color: CupertinoColors.black,
                            decoration: TextDecoration.none,
                            fontFamily: 'vaground',
                            fontWeight: FontWeight.w100
                        ),
                      ),
                      StarRating(
                        rating: rating,
                        size: w * 0.04,
                        allowHalfRating: true,
                        color: const Color.fromRGBO(255, 49, 49, 1),
                      )
                    ],
                  ),
                  //SizedBox(height: h * 0.001,),
                  const Text(
                    'User Comment Will be here',
                    style: TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.black,
                        decoration: TextDecoration.none,
                        fontFamily: 'futura',
                        fontWeight: FontWeight.w100
                    ),
                  ),
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
              //color: Color.fromRGBO(224, 118, 52, 1),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(246,144,78,1)
                ]
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
            ),
            child: Stack(
              children: [
                Container(
                  height: h * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/rate.jpg'
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: h * 0.15, right: w * 0.075),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 66, 90, 1),
                        borderRadius: BorderRadius.all(Radius.circular(h * 0.1))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(w * 0.03),
                        child: const Icon(
                          CupertinoIcons.suit_heart_fill,
                          color: CupertinoColors.white,
                          size: 40,
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
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: CupertinoColors.black))
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.015, horizontal: w * 0.05),
              child: const Text(
                'Rating',
                style: TextStyle(
                  color: CupertinoColors.black,
                  decoration: TextDecoration.none,
                  fontFamily: 'vaground',
                  fontWeight: FontWeight.w100,
                  fontSize: 22
                ),
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
