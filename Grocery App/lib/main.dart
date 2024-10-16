import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohit_bloc_1/Bevrages/bloc/bev_bloc.dart';
import 'package:mohit_bloc_1/Categories/bloc/categories_bloc.dart';
import 'package:mohit_bloc_1/Dairy_products/bloc/dairy_bloc.dart';
import 'package:mohit_bloc_1/Fruits/bloc/fruits_bloc.dart';
import 'package:mohit_bloc_1/Home/bloc/home_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/bloc/loginsignup_bloc.dart';
import 'package:mohit_bloc_1/LoginSignup/widgets/login.dart';
import 'package:mohit_bloc_1/Snacks/bloc/snacks_bloc.dart';
import 'package:mohit_bloc_1/Vegetables/bloc/vegeies_bloc.dart';
import 'package:mohit_bloc_1/cooking%20essentials/bloc/cooking_bloc.dart';
import 'package:mohit_bloc_1/household/bloc/house_bloc.dart';
import 'package:mohit_bloc_1/packedfood/bloc/package_bloc.dart';
import 'package:mohit_bloc_1/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap the entire app in ChangeNotifierProvider to provide the ThemeProvider
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginsignupBloc>(
            create: (context) => LoginsignupBloc(),
          ),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => CategoriesBloc()),
          BlocProvider(create: (context) => VegeiesBloc()),
          BlocProvider(create: (context) => FruitsBloc()),
          BlocProvider(create: (context) => DairyBloc()),
          BlocProvider(create: (context) => CookingBloc()),
          BlocProvider(create: (context) => SnacksBloc()),
          BlocProvider(create: (context) => PackageBloc()),
          BlocProvider(create: (context) => BevBloc()),
          BlocProvider(create: (context) => HouseBloc()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              themeMode: themeProvider.getThemeValue()
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData.dark(),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: LoginPage(),
            );
          },
        ),
      ),
    );
  }
}
