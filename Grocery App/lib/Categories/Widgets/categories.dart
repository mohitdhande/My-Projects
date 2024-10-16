import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Bevrages/bevrages.dart';
import 'package:mohit_bloc_1/Categories/bloc/categories_bloc.dart';
import 'package:mohit_bloc_1/Categories/categories.dart';
import 'package:mohit_bloc_1/Dairy_products/dairyproducts.dart';
import 'package:mohit_bloc_1/Fruits/fruits.dart';
import 'package:mohit_bloc_1/Home/Widgets/homemain.dart';
import 'package:mohit_bloc_1/Snacks/snacks.dart';
import 'package:mohit_bloc_1/Vegetables/vegetable.dart';
import 'package:mohit_bloc_1/cooking%20essentials/cookingesen.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/household/household.dart';
import 'package:mohit_bloc_1/mycart.dart';
import 'package:mohit_bloc_1/packedfood/packageFood.dart';
import 'package:mohit_bloc_1/wishlist.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> groceryProducts = Categories.categoriesProducts;
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
                  "Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 116, 216, 107),
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
      body: BlocListener<CategoriesBloc, CategoriesState>(
        listener: (context, state) {
          if (state is VegetableList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Vegetablelist()));
          }
          if (state is CFruitsList) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FruitsList()));
          }
          if (state is DairyProductsList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Dairyproducts()));
          }
          if (state is CookingEssentialsList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CookingEssentials()));
          }
          if (state is SnacksList) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Snacks()));
          }
          if (state is PackageFoodList) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PackageFood()));
          }
          if (state is BeveragesList) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Beverages()));
          }
          if (state is HouseHoldList) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Household()));
          }
        },
        child: GridView.builder(
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
                    .read<CategoriesBloc>()
                    .add(GoIntocategories(index: index));
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
      ),
    );
  }
}
