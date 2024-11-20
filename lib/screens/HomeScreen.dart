import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/components/Contact.dart';
import 'package:sneakercleanic/components/Dashboard.dart';
import 'package:sneakercleanic/components/Profile.dart';
import 'package:sneakercleanic/components/Rate.dart';
import 'package:sneakercleanic/components/Track.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const Dashboard(),
      const TrackScreen(),
      RateScreen(),
      const ContactScreen(),
      const ProfileScreen(),
    ];
    double w = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
        child: Stack(
          children: [
            tabs[_currentIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bottomNavIcon(0, CupertinoIcons.house_fill, "Dashboard"),
                      _bottomNavIcon(1, CupertinoIcons.compass, "Track"),
                      _bottomNavIcon(2, CupertinoIcons.heart, "Rate Service"),
                      _bottomNavIcon(3, Icons.comment, "Contact Us"),
                      _bottomNavIcon(4, CupertinoIcons.person, "Profile"),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }

  Widget _bottomNavIcon(int index, IconData iconData, String label){
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Container(
        width: _currentIndex == index ? w * 0.35 : w * 0.13,
        decoration: BoxDecoration(
            gradient: _currentIndex == index
                ? const LinearGradient(
              colors: [Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(246,144,78,1)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(25))
        ),
        child:  Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                height: h * 0.05,
                width: w * 0.1,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    iconData,
                    color: _currentIndex == index ? const Color.fromRGBO(255, 144, 76, 1)
                        : Colors.black,
                    size: 25,
                  ),
                  onPressed: (){_onItemTapped(index);},
                ),
              ),
            ),
            _currentIndex == index ? Text(
              label,
              style: const TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontFamily: 'futura',
                  fontWeight: FontWeight.bold
              ),
            )
                : Text('')
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}