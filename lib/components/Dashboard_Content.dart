import 'dart:async'; // For StreamController
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/Entity/Service.dart'; // Assuming this holds SneakerService model

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  int _filter = 0;
  final StreamController<List<SneakerService>> _streamController = StreamController<List<SneakerService>>();

  @override
  void initState() {
    super.initState();
    // Emit the initial full list
    _streamController.sink.add(listOfServices);
  }

  @override
  void dispose() {
    _streamController.close(); // Close the stream when the widget is disposed
    super.dispose();
  }

  Stream<List<SneakerService>> getProducts() {
    return _streamController.stream;
  }

  void filterServices(int filterIndex) {
    List<SneakerService> filteredServices;

    switch (filterIndex) {
      case 0:
        filteredServices = listOfServices;
        break;
      case 1:
        filteredServices = listOfServices.where((service) => service.type == 'Laundromat').toList();
        break;
      case 2:
        filteredServices = listOfServices.where((service) => service.type == 'Waxing').toList();
        break;
      case 3:
        filteredServices = listOfServices.where((service) => service.type == 'Repairs').toList();
        break;
      case 4:
        filteredServices = listOfServices.where((service) => service.type == 'Restore').toList();
        break;
      case 5:
        filteredServices = listOfServices.where((service) => service.type == 'Other').toList();
        break;
      default:
        filteredServices = listOfServices;
    }
    // Emit the filtered list
    _streamController.sink.add(filteredServices);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return StreamBuilder<List<SneakerService>>(
        stream: getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.025),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shopnav(0, "All", w),
                      shopnav(1, "Laundromat", w),
                      shopnav(2, "Waxing", w),
                      shopnav(3, "Repairs", w),
                      shopnav(4, "Restore", w),
                      shopnav(5, "Other", w)
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: h * 0.8,
                      minHeight: h * 0.1,
                      maxWidth: w
                  ),
                  child: contentGrid(snapshot.data!, h, w), // Use the filtered data from the stream
                )
              ],
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        });
  }

  Widget shopnav(int index, String label, double w) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _filter = index;
          filterServices(_filter);
        });
         // Filter the services when a new option is selected
      },
      child: Container(
        width: w * 0.14,
        height: w * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: _filter == index
                ? const LinearGradient(colors: [
              Color.fromRGBO(255, 49, 49, 1),
              Color.fromRGBO(246, 144, 78, 1)
            ])
                : null,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: _filter == index ? Colors.white : Colors.grey)),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 8,
              fontFamily: 'futura',
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              color: _filter == index ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget contentGrid(List<SneakerService> filteredServices, double h, double w) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: w * 0.05,
            mainAxisSpacing: h * 0.02,
            childAspectRatio: 0.9,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return listCard(h, filteredServices[index]);
            },
            childCount: filteredServices.length,
          ),
        ),
      ],
    );
  }



  Widget listCard(double h, SneakerService service) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: h * 0.17,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(service.picture),
                  fit: BoxFit.fill
              )
          ),
        ),
        SizedBox(height: h * 0.01,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              service.title,
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontFamily: 'futura',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none),
            ),
            Text(
              'R${service.price}',
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  fontFamily: 'futura',
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
        Text(
          service.type,
          style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'futura',
              fontWeight: FontWeight.w100,
              decoration: TextDecoration.none),
        ),
      ],
    );
  }
}
