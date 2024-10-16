import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:todoproviderdb_1/loginpage.dart';
import 'package:todoproviderdb_1/loginpro.dart';
import 'package:todoproviderdb_1/provider.dart';
import 'package:todoproviderdb_1/todohomepage.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProviderDB()),
      ChangeNotifierProvider(create: (context) => Loginpro())
    ], child: MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
