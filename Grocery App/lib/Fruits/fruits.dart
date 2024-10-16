import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Categories/Widgets/categories.dart';
import 'package:mohit_bloc_1/Fruits/bloc/fruits_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class FruitsList extends StatefulWidget {
  const FruitsList({super.key});

  @override
  _FruitsListState createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {
  // Sample fruit data
  List<Map<String, dynamic>> fruties = [
    {'name': 'Bananas', 'price': '39', 'imageurl': 'assets/bananas.png'},
    {'name': 'Grapes', 'price': '99', 'imageurl': 'assets/grapes.png'},
    {'name': 'Apples', 'price': '300', 'imageurl': 'assets/apples.png'},
    {
      'name': 'Custard Apple',
      'price': '150',
      'imageurl': 'assets/custurdapple.png'
    },
    {'name': 'Mangoes', 'price': '130', 'imageurl': 'assets/mangoes.png'}
  ];

  // List to track the heart clicked status
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
                  "Fruits",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 221, 175, 237),
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
      body: BlocListener<FruitsBloc, FruitsState>(
        listener: (context, state) {
          if (state is FruitAddToWish) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Wishlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
          if (state is FruitAddToCart) {
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
            itemCount: fruties.length,
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
                            fruties[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          fruties[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${fruties[index]['price']}",
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
                                      .read<FruitsBloc>()
                                      .add(AddtoWishlist(fruitIndex: index));
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
                                      .read<FruitsBloc>()
                                      .add(AddtoCartlist(fruitIndex: index));
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
