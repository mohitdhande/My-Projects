import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Fruits/bloc/fruits_bloc.dart';
import 'package:mohit_bloc_1/cooking%20essentials/bloc/cooking_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class CookingEssentials extends StatefulWidget {
  const CookingEssentials({super.key});

  @override
  _CookingEssentialsState createState() => _CookingEssentialsState();
}

class _CookingEssentialsState extends State<CookingEssentials> {
  // List of cooking essentials items
  List<Map<String, dynamic>> cooking = [
    {'name': 'Wheat', 'price': '34', 'imageurl': 'assets/wheat.jpg'},
    {'name': 'Jowar', 'price': '60', 'imageurl': 'assets/Jowar.jpg'},
    {'name': 'Rice', 'price': '63', 'imageurl': 'assets/Rice.png'},
    {'name': 'Oil', 'price': '150', 'imageurl': 'assets/oils.png'},
    {'name': 'Masala', 'price': '60', 'imageurl': 'assets/Masala.png'}
  ];

  // List to track the heart clicked state for each item
  List<bool> heartClicked = List<bool>.filled(5, false);
  List<bool> bagClicked = List<bool>.filled(5, false);

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
                  "Cooking Essentials",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 222, 223, 223),
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
      body: BlocListener<CookingBloc, CookingState>(
        listener: (context, state) {
          if (state is CookingAddToWish) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Wishlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
          if (state is CookingAddToCart) {
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
            itemCount: cooking.length,
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
                            cooking[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          cooking[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${cooking[index]['price']}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle heart icon state
                                    heartClicked[index] = !heartClicked[index];
                                  });
                                  context
                                      .read<CookingBloc>()
                                      .add(CAddtoWishlist(cookingIndex: index));
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
                                      .read<CookingBloc>()
                                      .add(CAddtoCartlist(cookingIndex: index));
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
