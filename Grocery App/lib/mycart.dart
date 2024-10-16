import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/wishcart.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  List<Map<String, dynamic>> cart = WishCartList.cartList;
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
                  "My Cart",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 194, 225, 163),
              ))),
      drawer: DrawerToAll(),
      body: ListView.builder(
          itemCount: cart.length,
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
                          cart[index]['imageurl'],
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Text(
                        cart[index]['name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹ ${cart[index]['price']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border,
                              )),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  cart.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.shopping_bag,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
