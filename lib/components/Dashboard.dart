import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/Entity/Customer.dart';
import 'package:sneakercleanic/components/Dashboard_Content.dart';



Future<Customer> getCustomer() async{
  Customer _customer = Customer(1, 0123456789, "Yinhla Makamu", "");

  return _customer;
}


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int filter = 0;
  final PageController _pageController = PageController();
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCustomer(),
        builder: (context, snapshot){
          double w = MediaQuery.of(context).size.width;
          double h = MediaQuery.of(context).size.height;

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
          else if(snapshot.connectionState == ConnectionState.none){
            return const Center(
              child: Text(
                  'Something went wrong'
              ),
            );
          }
          else{
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: w,
                    height: h * 0.25,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(246,144,78,1)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: h * 0.05, left: w * 0.05, right: w * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome back,',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'futura',
                                decoration: TextDecoration.none,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: h * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'futura',
                                    decoration: TextDecoration.none,
                                    color: Colors.white
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(
                                  CupertinoIcons.bell_solid,
                                  color: Colors.white,
                                ),
                                style: IconButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(255, 144, 76, 1)
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: h * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: h * 0.05,
                                width: w * 0.75,
                                child: CupertinoTextField(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(25)),
                                    color: Colors.white,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                  placeholder: "Search Here",
                                  prefix : Padding(
                                    padding: EdgeInsets.only(left: w * 0.02),
                                    child: const Icon(
                                      CupertinoIcons.search,
                                      color: Colors.grey,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: w * 0.1,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.filter_list,
                                    color: Colors.white,
                                  ),
                                  color: Colors.black,
                                  style: IconButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(255, 144, 76, 1)
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.01,),
                  Padding(
                    padding: EdgeInsets.all(w * 0.03),
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.2,
                          decoration: const BoxDecoration(
                              gradient: RadialGradient(colors: [
                                Colors.red, Colors.deepOrangeAccent
                              ]),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/homesneaker.png',
                                ),
                                fit: BoxFit.fitWidth
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25))
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'SNEAKER CLEANIC',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'futura',
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(height: h * 0.02),
                                const Text(
                                  'ONE STOP SHOP FOR ALL YOUR SNEAKER NEEDS',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'futura',
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                      color: Colors.white
                                  ),
                                ),
                                SizedBox(height: h * 0.02),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: w * 0.6,
                                      child: const Text(
                                        'THE #1 SNEAKER CLEANING BRAND \nTHAT PROVIDES VALUE FOR MONEY',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'futura',
                                            decoration: TextDecoration.none,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: w * 0.25,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(246,144,78,1)
                                              ]
                                          ),
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.white,
                                          )
                                      ),
                                      child: CupertinoButton(
                                        onPressed: (){},
                                        child: const Text(
                                          'Shop Now',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'vaground',
                                              decoration: TextDecoration.none,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: h * 0.075),
                          child: const DashboardContent(),
                        ),
              
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }
    );
  }

  Widget details(){
    return Container();
  }
}
