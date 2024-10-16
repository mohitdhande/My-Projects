import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class Notify extends StatelessWidget {
  const Notify({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 1;
    Color cardColor() {
      if (counter == 1) {
        counter = 2;
        return const Color.fromRGBO(250, 232, 232, 1);
      } else if (counter == 2) {
        counter = 3;
        return const Color.fromRGBO(232, 237, 250, 1);
      } else {
        counter = 1;
        return const Color.fromRGBO(250, 249, 232, 1);
      }
    }

    List<String> msgs = [
      'Hey ! Grocery sale is Live',
      'Diwali oferrs are starting from 13th Oct',
      'There is 50% off on package food',
      'Buy groceries with SBI Credit card to get 10% off'
    ];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Height of the AppBar
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0), // Curving bottom left corner
                bottomRight:
                    Radius.circular(40.0), // Curving bottom right corner
              ),
              child: AppBar(
                title: Text(
                  "Notifications",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 194, 225, 163),
              ))),
              drawer: DrawerToAll(),
      body: ListView.builder(
          itemCount: msgs.length,
          itemBuilder: (counter, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: cardColor(),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          offset: Offset(5, 5),
                          spreadRadius: 0,
                          blurRadius: 8)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    msgs[index],
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
