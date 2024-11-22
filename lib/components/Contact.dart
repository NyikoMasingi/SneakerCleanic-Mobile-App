import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakercleanic/widgets/BannerWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: h * 0.225,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 49, 49, 1), Color.fromRGBO(255, 143, 76 , 1)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight
              ),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: h * 0.05,),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: w * 0.05),
                      child: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'YINHLA MAKAMU',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w100,
                            fontFamily: 'vaground',
                            color: CupertinoColors.white,
                            decoration: TextDecoration.none
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: h * 0.02,),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: h * 0.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/contact.png',
                      ),
                      fit: BoxFit.contain
                    )
                  ),
                )
              ],
            ),
          ),
      
          Padding(
            padding: EdgeInsets.only(bottom: h * 0.01, top: h * 0.02),
            child: const Text(
              'CONTACT US',
              style: TextStyle(
                fontSize: 30,
                color: CupertinoColors.black,
                fontFamily: 'vaground',
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none
              ),
            ),
          ),
          Container(
            width: w,
            alignment: Alignment.center,
            child: const Text(
              'You are always welcome to get in touch with us',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontFamily: 'futura',
                fontSize: 18,
                color: CupertinoColors.black,
                decoration: TextDecoration.none,
      
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.1, vertical: h * 0.05),
            child: Column(
              children: [
                CupertinoTextField(
                  controller: firstNameController,
                  placeholder: "First Name",
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 145, 77, 1),))
                  ),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'futura',
                      fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: h * 0.05,),
                CupertinoTextField(
                  controller: lastNameController,
                  placeholder: "LastName",
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 145, 77, 1),))
                  ),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'futura',
                      fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: h * 0.05,),
                CupertinoTextField(
                  controller: emailController,
                  placeholder: "Email Address",
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 145, 77, 1),))
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'futura',
                    fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: h * 0.05,),
                CupertinoTextField(
                  controller: messageController,
                  placeholder: "Message",
                  maxLines: 3,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(255, 145, 77, 1),))
                  ),
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'futura',
                      fontWeight: FontWeight.w100
                  ),
                ),
                SizedBox(height: h * 0.075,),
                Container(
                  width: w * 0.9,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 145, 77, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: CupertinoButton(
                    onPressed: (){
                      sendForm();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: CupertinoColors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.01,),
                contactDetails(w)
              ],
            ),
          ),
      
        ],
      ),
    );
  }

  Widget contacts(IconData contactIcon, String title){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            contactIcon,
            color: const Color.fromRGBO(255, 145, 77, 1),
          ),
          const SizedBox(width: 10,),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: CupertinoColors.black,
              decoration: TextDecoration.none,
              fontFamily: 'futura',
              fontWeight: FontWeight.w100
            ),
          )
        ],
      ),
    );
  }

  void sendForm(){
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();

    if(firstName.isEmpty || lastName.isEmpty || email.isEmpty){
      Bannerwidget().showErrorBanner(context, "Please fill in all fields");
    }
    else{
      // send out form
    }
  }

  Widget contactDetails(double w){
    List<ContactDetail> contacts = [
      ContactDetail("Mabopane", "068 299 5933", "Mabopane Square | Shop 15a, 1908 Lucas Mangoepe RD"),
      ContactDetail("Soshanguve", "069 795 8899", "Thorntree Plaza | Shop 208, Hebron Rd, Soshanguve – VV"),
      ContactDetail("Mamelodi", "069 795 8899", "Mamelodi Square | Shop 208, Hebron Rd, Soshanguve – VV"),
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio : 16/9,
        autoPlay: true,
        viewportFraction: 0.8,
      ),
      items : contacts.map((cont){
        return Builder(
          builder: (BuildContext context){
            return SizedBox(
              width: w,
              child: Padding(
                padding: EdgeInsets.only(right: w * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cont.place,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'futura',
                        color: CupertinoColors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w100
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      cont.address,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'futura',
                          color: CupertinoColors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w100
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            CupertinoIcons.phone_circle,
                            size: 16,
                          ),
                        ),
                        Text(
                          cont.contact,
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'futura',
                              color: CupertinoColors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w100
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            CupertinoIcons.mail,
                            size: 16,
                          ),
                        ),
                        Text(
                          "info@sneakercleanic.co.za",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'futura',
                              color: CupertinoColors.black,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w100
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList()
    );
  }

}

class ContactDetail{
  String place;
  String contact;
  String address;

  ContactDetail(this.place, this.contact, this.address);
}
