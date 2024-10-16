import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class OffersPage extends StatelessWidget {
  List<String> imgList = [];
  OffersPage({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    // final List<String> imgList = [
    //   'assets/offer1.jpg',
    //   'assets/offer2.jpg',
    //   'assets/offer3.jpg',
    //   'assets/offer4.jpg',
    //   'assets/offer5.jpg'
    // ];

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Height of the AppBar
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40.0), // Curving bottom left corner
              bottomRight: Radius.circular(40.0), // Curving bottom right corner
            ),
            child: AppBar(
              title: Text(
                "Offers",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 107, 103, 68),
            ),
          )),
          drawer: DrawerToAll(),
      body: ListView.builder(
          itemCount: imgList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(5, 5),
                      spreadRadius: 0,
                      blurRadius: 8),
                ]),
                child: Image.asset(imgList[index]),
              ),
            );
          }),
    );
  }
}
