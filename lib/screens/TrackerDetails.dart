import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Trackerdetails extends StatefulWidget {
  const Trackerdetails({super.key, required this.task});

  final dynamic task;
  @override
  State<Trackerdetails> createState() => _TrackerdetailsState();
}

class _TrackerdetailsState extends State<Trackerdetails> {
  final statuses = [
    1, 4, 0, 3
  ];
  int controller = 0;
  double progress = 0;
  String date = "";
  double rating = 0;
  int numOfStars = 5;
  final commentController = TextEditingController();

  Future<void> getProgress()async{
    try{
      final body = {
        "task_id" : "1"
      };

      final response = await http.get(Uri.https("cornadarchitecturaldraughting.co.za", "/api_test/script.php/task", body));
      final j = jsonDecode(response.body);

      int index = statuses.indexOf(int.parse(j["status"]));
      controller = index;
      progress = controller * 30;
      date = j["date_created"];
    }
    catch(error){
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initDataMembers();

  }

  void initDataMembers(){
    int index = statuses.indexOf(int.parse(widget.task["status"]));

    controller = index;
    progress = controller * 30;
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.grey,
          ),

        ),
        middle: const Text('TRACKING PROGRESS'),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: h * 0.01, horizontal: w * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/tracking.jpg"
                        ),
                        fit: BoxFit.fill
                    )
                ),
              ),
              SizedBox(height: h * 0.01,),
              Text(
                'Date : ${widget.task['date_created']}',
                style: const TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'futura',
                    fontWeight: FontWeight.w100
                ),
              ),
              SizedBox(height: h * 0.01,),
              Row(
                children: [
                  SizedBox(
                    height: h * 0.4,
                    width: w * 0.1,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(
                          height: h * 0.38,
                          child: Padding(
                            padding: EdgeInsets.only(top: h * 0.01),
                            child: FAProgressBar(
                              backgroundColor: CupertinoColors.inactiveGray,
                              direction: Axis.vertical,
                              verticalDirection: VerticalDirection.down,
                              maxValue: 90,
                              currentValue: progress,
                              size: w * 0.005,
                              changeProgressColor: const Color.fromRGBO(
                                  255, 0, 0, 1),
                              progressColor: const Color.fromRGBO(255, 0, 0, 1),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            progressCircle(0),
                            SizedBox(height: h * 0.1,),
                            progressCircle(1),
                            SizedBox(height: h * 0.1,),
                            overDue(),
                            SizedBox(height: h * 0.1,),
                            progressCircle(3),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.005,),
                        trackTitle('PENDING', h, 0),
                        SizedBox(height: h * 0.105,),
                        trackTitle('AWAITING COLLECTION', h, 1),
                        SizedBox(height: h * 0.105,),
                        overdueTitle('OVERDUE COLLECTION', h),
                        SizedBox(height: h * 0.105,),
                        trackTitle('COLLECTED', h, 3),
                      ],
                    ),

                  )
                ],
              ),
              SizedBox(
                height: h * 0.05,
              ),
              controller == 3 ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rate The Work',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'futura',
                        color: CupertinoColors.black,
                        decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Center(
                    child: StarRating(
                      rating: rating,
                      starCount: numOfStars,
                      size: w * 0.1,
                      color: const Color.fromRGBO(255, 0, 0, 1),
                      allowHalfRating: true,
                      onRatingChanged: (rating) =>
                          setState(() {
                            this.rating = rating;
                          }),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  CupertinoTextField(
                    controller: commentController,
                    maxLines: 3,
                    style: const TextStyle(
                        fontFamily: 'futura',
                        fontSize: 15
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 49, 49, 1),
                              Color.fromRGBO(246, 144, 78, 1)
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                        )
                    ),
                    child: CupertinoButton(
                      onPressed: () {

                      },
                      child: const Text(
                        'Submit Comment',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'vaground'
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  : Container(),
              SizedBox(height: h * 0.07,)
            ],
          ),
        ),
      ),
    );
  }

  Widget progressCircle(int index){
    return Icon(
      Icons.circle_rounded,
      color: controller >= index ?
        const Color.fromRGBO(255, 0, 0, 1)
        : CupertinoColors.inactiveGray
    );
  }

  Widget overDue(){
    return Icon(
        Icons.circle_rounded,
        color: controller == 2 ?
        const Color.fromRGBO(255, 0, 0, 1)
            : CupertinoColors.inactiveGray
    );
  }
  Widget trackTitle(String title, double h, int index){
    return SizedBox(
      height: h * 0.02,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          decoration: TextDecoration.none,
          color: controller >= index ? CupertinoColors.black
            : CupertinoColors.inactiveGray,
          fontFamily: 'futura'
        ),
      ),
    );
  }

  Widget overdueTitle(String title, double h){
    return SizedBox(
      height: h * 0.02,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.none,
            color: controller == 2 ? CupertinoColors.black
                : CupertinoColors.inactiveGray,
            fontFamily: 'futura'
        ),
      ),
    );
  }
}
