import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/screens/TrackerDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {

  Future <List<dynamic>> getTasks()async{
    List<dynamic> tasks = [];
    try{
      final body = {
        "project_id" : "1"
      };
      final response = await http.get(Uri.https("cornadarchitecturaldraughting.co.za", "/api_test/script.php/tasks", body));

      tasks = jsonDecode(response.body);

      print(tasks.length);

    }catch(error){
      print(error);
    }
    return tasks;
  }


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Widget tasksTiles(){
      List x = [1,2,3,4];

      x.map((task) =>{

      });

      return Column(
        children: [

        ],
      );
    }

    return FutureBuilder(
      future: getTasks(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CupertinoActivityIndicator(

            ),
          );
        }
        else if(snapshot.hasError){
          return const Column(
            children: [
              SizedBox(height: 350,),
              Icon(
                Icons.error,
                size: 46,
                color: CupertinoColors.systemRed,
              ),
              SizedBox(height: 50,),
              Center(
                child: Text(
                  'Sorry Something went wrong',
                  style: TextStyle(
                    fontFamily: 'futura',
                    fontSize: 24,
                    decoration: TextDecoration.none,
                    color: CupertinoColors.black,
                  ),
                ),
              ),
            ],
          );
        }
        else{
          return Column(
            children: [
              Container(
                height: h * 0.1,
                width: w,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(246,144,78,1)
                    ]
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: h * 0.02),
                  child: const Text(
                    'Track Your Orders',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: CupertinoColors.white,
                      decoration: TextDecoration.none,
                      fontFamily: 'futura'
                    ),
                  ),
                ),

              ),
              snapshot.data!.isNotEmpty ?
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      child: SizedBox(
                        width: w * 0.9,
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.01),
                              child: CupertinoListTile(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Trackerdetails(task : snapshot.data![index]))
                                  );
                                },
                                title: Text(
                                  '${snapshot.data![index]['date_created']}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'futura',
                                  ),
                                ),
                                trailing: Icon(
                                  snapshot.data![index]['status'] == '0' ?
                                    CupertinoIcons.exclamationmark_triangle_fill
                                    : CupertinoIcons.checkmark_alt_circle_fill,
                                  color: snapshot.data![index]['status'] == '3' ?
                                    CupertinoColors.activeGreen
                                    : snapshot.data![index]['status'] == '0' ?
                                      CupertinoColors.systemYellow
                                      : CupertinoColors.inactiveGray,
                                ),
                                //backgroundColor: CupertinoColors.activeOrange,
                              ),
                            );
                          },
                        )
                      ),
                    ),
                  )
                  : SizedBox(
                child: Padding(
                  padding: EdgeInsets.only(top : h * 0.05),
                  child: const Text(
                    'No orders to display yet',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'futura',
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),

              SizedBox(height: h * 0.1,)
            ],
          );
        }
      }
    );
  }
}
