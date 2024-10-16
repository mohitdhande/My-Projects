import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Categories/Widgets/categories.dart';
import 'package:mohit_bloc_1/Categories/bloc/categories_bloc.dart';
import 'package:mohit_bloc_1/Categories/categories.dart';
import 'package:mohit_bloc_1/Dairy_products/dairyproducts.dart';
import 'package:mohit_bloc_1/Home/bloc/home_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/widgets/login.dart';
import 'package:mohit_bloc_1/Vegetables/vegetable.dart';
import 'package:mohit_bloc_1/Fruits/fruits.dart';
import 'package:mohit_bloc_1/aboutus.dart';
import 'package:mohit_bloc_1/cooking%20essentials/cookingesen.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/help.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/myorders.dart';
import 'package:mohit_bloc_1/notify.dart';
import 'package:mohit_bloc_1/offers.dart';
import 'package:mohit_bloc_1/privacy.dart';
import 'package:mohit_bloc_1/profile.dart';
import 'package:mohit_bloc_1/settings.dart';
import 'package:mohit_bloc_1/trackorders.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class HomeMainPage extends StatefulWidget {
  String custName;
  HomeMainPage({super.key, required this.custName});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final List<String> imgList = [
    'assets/offer1.jpg',
    'assets/offer2.jpg',
    'assets/offer3.jpg',
    'assets/offer4.jpg',
    'assets/offer5.jpg'
  ];

  // List<Map<String, dynamic>> groceryProducts = [
  //   {'name': 'Vegetables', 'imageurl': 'assets/vegetable (2).png'},
  //   {'name': 'Fruits', 'imageurl': 'assets/fruits.png'},
  //   {'name': 'Dairy Products', 'imageurl': 'assets/dairyproducts.png'},
  //   {'name': 'Cooking Essentials', 'imageurl': 'assets/cookingEssentials.png'}
  // ];

  List<Map<String, dynamic>> groceryProducts = Categories.groceryProducts;

  List<Map<String, dynamic>> recentView = [
    {'name': 'Bananas', 'price': '39', 'imgurl': 'assets/bananas.png'},
    {'name': 'Bread', 'price': '29', 'imgurl': 'assets/bread.png'},
    {'name': 'Tomatoes', 'price': '80', 'imgurl': 'assets/Tomatoes.png'},
    {'name': 'Eggs', 'price': '120', 'imgurl': 'assets/eggs.png'},
    {'name': 'Grapes', 'price': '99', 'imgurl': 'assets/grapes.png'},
  ];
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // Height of the AppBar
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0), // Curving bottom left corner
            bottomRight: Radius.circular(40.0), // Curving bottom right corner
          ),
          child: AppBar(
            title: Text(
              "Grocy",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
            backgroundColor: Colors.yellow, // Background color of the AppBar
            actions: [
              IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WishList()));
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartList()));
                  },
                  icon: Icon(Icons.shopping_bag_outlined)),
            ],
          ),
        ),
      ),
      drawer: DrawerToAll(),
      // Drawer(
      //   backgroundColor: Colors.white.withOpacity(0.7),
      //   child: Column(
      //     children: [
      //       Container(
      //         margin: EdgeInsets.only(
      //           top: 50,
      //         ),
      //         padding: EdgeInsets.only(top: 10),
      //         height: 210,
      //         width: 305,
      //         decoration: BoxDecoration(

      //             //color: Colors.black,
      //             gradient: LinearGradient(stops: [
      //           0.3,
      //           0.9
      //         ], colors: [
      //           const Color.fromARGB(255, 227, 123, 123),
      //           const Color.fromARGB(255, 216, 156, 121),
      //         ])),
      //         child: Column(
      //           children: [
      //             Row(
      //               children: [
      //                 Image.asset(
      //                   "assets/person.png",
      //                   height: 100,
      //                   width: 100,
      //                 ),
      //                 Text(
      //                   "Hii  ",
      //                   style: TextStyle(
      //                       fontSize: 25,
      //                       fontWeight: FontWeight.w600,
      //                       fontStyle: FontStyle.italic),
      //                 ),
      //                 Text(widget.custName,
      //                     style: TextStyle(
      //                         fontSize: 25,
      //                         fontWeight: FontWeight.w600,
      //                         fontStyle: FontStyle.italic)),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 10,
      //             ),
      //             Text(
      //               'Your Groceries delivered in 10 minutes',
      //               style: TextStyle(
      //                 fontSize: 16,
      //                 fontWeight: FontWeight.w600,
      //                 fontStyle: FontStyle.italic,
      //                 decoration: TextDecoration.underline,
      //               ),
      //             ),
      //             SizedBox(
      //               height: 30,
      //             ),
      //             Row(
      //               children: [
      //                 SizedBox(
      //                   width: 20,
      //                 ),
      //                 Icon(
      //                   Icons.star_border_outlined,
      //                   color: Colors.amber,
      //                 ),
      //                 Text(
      //                   '  Rate our app',
      //                   style: TextStyle(fontSize: 18),
      //                 )
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DHome());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.home_filled,
      //             ),
      //             Text(
      //               ' Home',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(Dprofile());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.person,
      //             ),
      //             Text(
      //               ' Profile',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DSettings());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.settings,
      //             ),
      //             Text(
      //               ' Settings',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DWishlist());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.favorite,
      //             ),
      //             Text(
      //               ' Wishlist',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DCartlist());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.shopping_cart,
      //             ),
      //             Text(
      //               ' My Cart',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DMyOrders());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.shopping_bag,
      //             ),
      //             Text(
      //               ' My Orders',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DtrackOrders());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.local_shipping,
      //             ),
      //             Text(
      //               ' Track order',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(Doffers());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.local_offer,
      //             ),
      //             Text(
      //               ' Offers',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(Dnotify());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.notifications,
      //             ),
      //             Text(
      //               ' Notification',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(Dhelp());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.call,
      //             ),
      //             Text(
      //               ' Help',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(Dprivacy());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.privacy_tip,
      //             ),
      //             Text(
      //               ' Privacy',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DAbout());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.info_outline,
      //             ),
      //             Text(
      //               ' About Us',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       ),
      //       GestureDetector(
      //         onTap: () {
      //           context.read<HomeBloc>().add(DLogout());
      //         },
      //         child: Row(
      //           children: [
      //             Padding(padding: EdgeInsets.fromLTRB(0, 30, 20, 20)),
      //             Icon(
      //               Icons.logout,
      //             ),
      //             Text(
      //               ' Logout',
      //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is OnCategoriesPage) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategoriesGrid()));
          }
          if (state is HVegetableList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vegetablelist()));
          }
          if (state is HFruitList) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FruitsList()));
          }
          if (state is HDairyproductList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Dairyproducts()));
          }
          if (state is HCookingList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CookingEssentials()));
          }
          if (state is OnDHome) {
            Navigator.of(context).pop();
          }
          if (state is OnMyOrders) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyOrdersPage()));
          }
          if (state is OntrackOrders) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TrackOrdersPage()));
          }
          if (state is OnProfile) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile(
                          name: widget.custName,
                        )));
          }
          if (state is OnOffers) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OffersPage(
                          imgList: imgList,
                        )));
          }
          if (state is OnNotify) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Notify()));
            // Navigator.popUntil(
            //     context, HomeMainPage(custName: widget.custName));
            //.pop(context);
          }
          if (state is OnHelp) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Help()));
          }
          if (state is OnPrivacy) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Privacy()));
          }
          if (state is OnAboutUs) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutUs()));
          }
          if (state is OnLogout) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
          if (state is OnSettings) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage()));
          }
          if (state is OnWish) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => WishList()));
          }
          if (state is OnWCart) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartList()));
          }
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 30, top: 70)),
                  Text(
                    'Welcome ',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    widget.custName,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Center(
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: imgList
                            .map((e) => Container(
                                  child: Center(
                                    child: Image.asset(e),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          initialPage: 0,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          onPageChanged: (index, _) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                      ),
                      buildCarouselIndicator()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                  ),
                  Text(
                    '  Categories',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                // This will prevent the GridView from expanding infinitely.
                //physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //crossAxisSpacing: 10,
                  // mainAxisSpacing: 10,
                ),
                itemCount: groceryProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<HomeBloc>()
                          .add(HGoIntocategories(index: index));
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                      height: 150,
                      width: 145,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                offset: Offset(1, 2),
                                spreadRadius: 0,
                                blurRadius: 8)
                          ],
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(groceryProducts[index]['imageurl']),
                          Text(groceryProducts[index]['name'])
                        ],
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(300, 10, 10, 10),
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(CategoriesViewAll());
                  },
                  child: Row(
                    children: [
                      Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                      Icon(Icons.arrow_right_rounded)
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                  ),
                  Text(
                    '  Recent view',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 200,
                width: 500,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: recentView.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 14),
                                width: 130,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.15),
                                        offset: Offset(2, 2),
                                        spreadRadius: 0,
                                        blurRadius: 3)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 120,
                                      child: Image.asset(
                                          recentView[index]['imgurl']),
                                    ),
                                    Text(
                                      recentView[index]['name'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      "₹${recentView[index]['price']}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
                color: i == _currentPage ? Colors.black : Colors.grey,
                shape: BoxShape.circle),
          )
      ],
    );
  }
}
