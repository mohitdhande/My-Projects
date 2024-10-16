import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Bevrages/bloc/bev_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  _BeveragesState createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  // List of beverages
  List<Map<String, dynamic>> bev = [
    {'name': 'Tea', 'price': '140', 'imageurl': 'assets/Taazatea.png'},
    {'name': 'Coffee', 'price': '150', 'imageurl': 'assets/Coffee.png'},
    {'name': 'Green Tea', 'price': '350', 'imageurl': 'assets/greenTea.png'},
    {'name': 'Soft Drink', 'price': '50', 'imageurl': 'assets/SoftDrinks.png'},
    {'name': 'Maza', 'price': '70', 'imageurl': 'assets/Maza.png'}
  ];

  // List to track the heart clicked state for each beverage
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
                  "Beverages",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 241, 215, 179),
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
      body: BlocListener<BevBloc, BevState>(
        listener: (context, state) {
          if (state is BevAddToWish) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Wishlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
          if (state is BevAddToCart) {
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
            itemCount: bev.length,
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
                            bev[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          bev[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${bev[index]['price']}",
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
                                      .read<BevBloc>()
                                      .add(AddtoWishlist(bevindex: index));
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
                                      .read<BevBloc>()
                                      .add(AddtoCartlist(bevindex: index));
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
