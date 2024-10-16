import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/wishcart.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List<Map<String, dynamic>> wish = WishCartList.wishList;
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
                  "WishList",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 194, 225, 163),
              ))),
              drawer: DrawerToAll(),
      body: ListView.builder(
          itemCount: wish.length,
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
                          wish[index]['imageurl'],
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Text(
                        wish[index]['name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹ ${wish[index]['price']}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  wish.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_bag_outlined))
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
