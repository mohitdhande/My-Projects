import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Help",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 172, 189, 199),
              ))),
              drawer: DrawerToAll(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Customer Care:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 70,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.call),
                  Text(
                    ' +91 1234567891',
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
