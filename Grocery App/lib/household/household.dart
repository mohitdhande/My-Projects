import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/household/bloc/house_bloc.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class Household extends StatefulWidget {
  const Household({super.key});

  @override
  _HouseholdState createState() => _HouseholdState();
}

class _HouseholdState extends State<Household> {
  // List of household items
  List<Map<String, dynamic>> houseHold = [
    {'name': 'Soaps', 'price': '150', 'imageurl': 'assets/soaps.png'},
    {'name': 'Shampoo', 'price': '250', 'imageurl': 'assets/shampoo.png'},
    {'name': 'Toilet Cleaner', 'price': '250', 'imageurl': 'assets/Harpic.png'},
    {
      'name': 'Floor Cleaner',
      'price': '200',
      'imageurl': 'assets/floorcleaner.png'
    },
    {
      'name': 'Utensils Cleaner',
      'price': '130',
      'imageurl': 'assets/utensilscleaner.png'
    }
  ];

  // List to track whether each item is favorited
  List<bool> isFavorite = List<bool>.filled(5, false);
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
                  "Household",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 185, 179, 241),
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
      body: BlocListener<HouseBloc, HouseState>(
        listener: (context, state) {
          if (state is HouseAddToWish) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                "Added to Wishlist",
                style: TextStyle(color: Colors.green),
              )),
            );
          }
          if (state is HouseAddToCart) {
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
            itemCount: houseHold.length,
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
                            houseHold[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          houseHold[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${houseHold[index]['price']}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle favorite state
                                    isFavorite[index] = !isFavorite[index];
                                  });
                                  context
                                      .read<HouseBloc>()
                                      .add(AddtoWishlist(houseIndex: index));
                                },
                                icon: isFavorite[index]
                                    ? Icon(Icons.favorite, color: Colors.red)
                                    : Icon(Icons.favorite_border)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    // Toggle the heartClicked state for this specific item
                                    bagClicked[index] = !bagClicked[index];
                                  });
                                  context
                                      .read<HouseBloc>()
                                      .add(AddtoCartlist(houseIndex: index));
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
