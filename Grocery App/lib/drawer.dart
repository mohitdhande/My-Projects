import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Home/bloc/home_bloc.dart';

class DrawerToAll extends StatelessWidget {
  const DrawerToAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.7),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 50,
            ),
            padding: EdgeInsets.only(top: 10),
            height: 210,
            width: 305,
            decoration: BoxDecoration(

                //color: Colors.black,
                gradient: LinearGradient(stops: [
              0.3,
              0.9
            ], colors: [
              const Color.fromARGB(255, 227, 123, 123),
              const Color.fromARGB(255, 216, 156, 121),
            ])),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/person.png",
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      "Hii  ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    Text('Mohit',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Your Groceries delivered in 10 minutes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.amber,
                    ),
                    Text(
                      '  Rate our app',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DHome());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.home_filled,
                ),
                Text(
                  ' Home',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(Dprofile());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.person,
                ),
                Text(
                  ' Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DSettings());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.settings,
                ),
                Text(
                  ' Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DWishlist());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.favorite,
                ),
                Text(
                  ' Wishlist',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DCartlist());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.shopping_cart,
                ),
                Text(
                  ' My Cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DMyOrders());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.shopping_bag,
                ),
                Text(
                  ' My Orders',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DtrackOrders());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.local_shipping,
                ),
                Text(
                  ' Track order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(Doffers());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.local_offer,
                ),
                Text(
                  ' Offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(Dnotify());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.notifications,
                ),
                Text(
                  ' Notification',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(Dhelp());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.call,
                ),
                Text(
                  ' Help',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(Dprivacy());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.privacy_tip,
                ),
                Text(
                  ' Privacy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DAbout());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.info_outline,
                ),
                Text(
                  ' About Us',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(DLogout());
            },
            child: Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
                Icon(
                  Icons.logout,
                ),
                Text(
                  ' Logout',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
