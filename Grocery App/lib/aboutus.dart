import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
                  "About Us",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 197, 157, 114),
              ))),
              drawer: DrawerToAll(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset('assets/aboutus.png'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'About Us Welcome to Grocy, your trusted partner for a hassle-free grocery shopping experience. Established in 2024, our goal is to bring fresh and quality groceries right to your doorstep, saving you time and effort. At Grocy, we believe grocery shopping should be easy, affordable, and reliable. Our mission is to deliver a wide range of products, from daily essentials to fresh produce, all while ensuring the highest quality standards. Whether you’re preparing a family dinner or stocking up on household items, we’ve got you covered. What sets us apart? Our commitment to convenience, quality, and customer satisfaction. We work closely with local farmers and suppliers to bring you the freshest products. Our user-friendly app allows you to browse, shop, and schedule deliveries in just a few clicks, giving you more time to focus on what matters. As we continue to grow, we remain dedicated to improving our service and expanding our product range. We strive to become your go-to grocery app, ensuring a delightful shopping experience every time. Thank you for choosing Grocy. We’re excited to be a part of your journey to healthier and more convenient living.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
