import 'package:flutter/cupertino.dart';




class TrackerTest extends StatefulWidget {
  const TrackerTest({super.key});

  @override
  State<TrackerTest> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerTest> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle:  Text('Progress Tracker'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.10),
            buildProgressItem('Pending', isComplete: true),
            SizedBox(height: h * 0.10),
            buildProgressItem('Washing', isComplete: true),
            SizedBox(height: h * 0.10),
            buildProgressItem('Drying'),
            SizedBox(height: h * 0.10),
            buildProgressItem('Ready for collection')
          ],
        ),
      ),
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

