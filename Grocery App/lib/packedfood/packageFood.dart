import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/packedfood/bloc/package_bloc.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class PackageFood extends StatefulWidget {
  const PackageFood({super.key});

  @override
  _PackageFoodState createState() => _PackageFoodState();
}

class _PackageFoodState extends State<PackageFood> {
  // List of package food items
  List<Map<String, dynamic>> packagefood = [
    {'name': 'Breads', 'price': '40', 'imageurl': 'assets/bread.png'},
    {'name': 'mcains', 'price': '250', 'imageurl': 'assets/mcains.png'},
    {
      'name': 'Frozen Chicken',
      'price': '300',
      'imageurl': 'assets/frozenchicken.png'
    },
    {
      'name': 'Chicken Nuggets',
      'price': '400',
      'imageurl': 'assets/nuggets.png'
    },
    {'name': 'Kelloggs', 'price': '190', 'imageurl': 'assets/kellogs.png'}
  ];

  // List to track the heart clicked state for each food item
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
                  "Packed Food",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 241, 179, 179),
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
      body: BlocListener<PackageBloc, PackageState>(
        listener: (context, state) {
          if (state is PackageAddToWish) {
            SnackBar(
                content: Text(
              "Added to Wishlist",
              style: TextStyle(color: Colors.green),
            ));
          }
          if (state is PackageAddToCart) {
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
            itemCount: packagefood.length,
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
                            packagefood[index]['imageurl'],
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(
                          packagefood[index]['name'],
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹ ${packagefood[index]['price']}",
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
                                      .read<PackageBloc>()
                                      .add(AddtoWishlist(packageIndex: index));
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
                                      .read<PackageBloc>()
                                      .add(AddtoCartlist(packageIndex: index));
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
