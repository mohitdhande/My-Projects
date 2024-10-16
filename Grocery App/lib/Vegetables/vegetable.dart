import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Categories/Widgets/categories.dart';
import 'package:mohit_bloc_1/Vegetables/bloc/vegeies_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class Vegetablelist extends StatefulWidget {
  const Vegetablelist({super.key});

  @override
  _VegetablelistState createState() => _VegetablelistState();
}

class _VegetablelistState extends State<Vegetablelist> {
  // Sample vegetable data
  static List<Map<String, dynamic>> vegies = [
    {'name': 'Tomatoes', 'price': '80', 'imageurl': 'assets/Tomatoes.png'},
    {'name': 'Okra', 'price': '40', 'imageurl': 'assets/Okra.png'},
    {'name': 'Broccoli', 'price': '70', 'imageurl': 'assets/broccoli.png'},
    {'name': 'Carrots', 'price': '50', 'imageurl': 'assets/Carrots.png'},
    {'name': 'Cabbage', 'price': '30', 'imageurl': 'assets/cabbage.png'}
  ];

  // A list to track the "heartClicked" state for each item
  List<bool> heartClicked = List<bool>.filled(vegies.length, false);
  List<bool> bagClicked = List<bool>.filled(vegies.length, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              child: AppBar(
                title: Text(
                  "Vegetables",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 138, 142, 225),
                actions: [
                  IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishList()));
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartList()));
                      },
                      icon: Icon(Icons.shopping_bag_outlined)),
                ],
              ))),
      drawer: DrawerToAll(),
      body: BlocListener<VegeiesBloc, VegeiesState>(
        listener: (context, state) {
          if (state is VeggiesAddToWish) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Wishlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
          if (state is VeggiesAddToCart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Cartlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
        },
        child: ListView.builder(
            itemCount: vegies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Container(
                  height: 242,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            vegies[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          vegies[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${vegies[index]['price']}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle the heartClicked state for this specific item
                                    heartClicked[index] = !heartClicked[index];
                                  });
                                  context
                                      .read<VegeiesBloc>()
                                      .add(AddtoWishlist(vegIndex: index));
                                },
                                icon: heartClicked[index]
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_border)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle the heartClicked state for this specific item
                                    bagClicked[index] = !bagClicked[index];
                                  });
                                  context
                                      .read<VegeiesBloc>()
                                      .add(AddtoCartlist(vegIndex: index));
                                },
                                icon: bagClicked[index]
                                    ? Icon(
                                        Icons.shopping_bag,
                                        color: Colors.black,
                                      )
                                    : Icon(Icons.shopping_bag_outlined))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
