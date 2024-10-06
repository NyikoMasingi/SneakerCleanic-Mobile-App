import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  late int status;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getTask(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        else if(snapshot.hasError){
          return Center(
            child: Text("An error has occurred: ${snapshot.error}"),
          );
        }
        else{
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text("Task Tracker"),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  SizedBox(height: h * 0.10,),
                  taskDetails(snapshot.data!['task'],snapshot.data!['date_created'],snapshot.data!['items']),
                  SizedBox(height: h * 0.10,),
                  buildProgressItem("Received", isComplete: true),
                  SizedBox(height: h * 0.10,),
                  buildProgressItem("Washing", isComplete: int.parse(snapshot.data!['status']) >= 1),
                  SizedBox(height: h * 0.10,),
                  buildProgressItem("Drying", isComplete: int.parse(snapshot.data!['status']) >= 2),
                  SizedBox(height: h * 0.10,),
                  buildProgressItem("Ready for Collection", isComplete: int.parse(snapshot.data!['status']) == 3),
                ],
              ),
            ),
          );
        }
      }
    );
  }

  Future<Map<dynamic, dynamic>> getTask()async{
    try{
      String url = "https://cornadarchitecturaldraughting.co.za/api_test/script.php/task?task_id=1";
      final response = await http.get(Uri.parse(url));
      //print("Reponse from API: ${jsonDecode(response.body)}");
      if(response.statusCode == 200){
        Map<dynamic, dynamic> task = jsonDecode(response.body);
        return task;
      }
    }
    catch(e){

    }
    return HashMap();
  }

  Widget taskDetails(String title, String dateCreated, String items){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 24,
            color: CupertinoColors.label
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Date: ${dateCreated.substring(0,10)}",
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: CupertinoColors.label
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Number of items: $items ",
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 18,
              color: CupertinoColors.label
          ),
        ),
      ],
    );
  }

  Widget buildProgressItem(String title, {bool isComplete = false}){
    return Row(
      children: [
        Icon(
          isComplete ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.circle,
          color: isComplete? CupertinoColors.activeGreen : CupertinoColors.inactiveGray,
        ),
        const SizedBox( width: 18.0,),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18,
                color: isComplete? CupertinoColors.black:  CupertinoColors.inactiveGray,
                decoration: TextDecoration.none
            ),
          ),
        )
      ],
    );
  }
}
