import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class TrackOrdersPage extends StatelessWidget {
  const TrackOrdersPage({super.key});

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
                  "Track Orders",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 202, 235, 235),
              ))),
              drawer: DrawerToAll(),
      body: Center(
        child: Text('Currently you have no Orders to track !!'),
      ),
    );
  }
}
