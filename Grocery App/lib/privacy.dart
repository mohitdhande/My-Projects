import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

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
                  "Privacy",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 161, 144, 224),
              ))),
              drawer: DrawerToAll(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/privacy.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Information We Collect We collect personal information such as your name, delivery address, email, and payment details when you use our grocery app. This information is essential for processing your orders and delivering products to your address. How We Use Your InformationWe use your data to fulfill your orders, provide customer service, and improve the app experience. We may also use your contact information to send you promotions and updates. Data SecurityWe use encryption and secure servers to protect your personal data. While we strive to ensure the security of your information, no method of transmission over the internet is 100% secure.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
