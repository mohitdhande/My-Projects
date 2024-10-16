import 'package:flutter/material.dart';
import 'package:mohit_bloc_1/drawer.dart';
import 'package:mohit_bloc_1/theme_provider.dart';
import 'package:provider/provider.dart';
//import 'package:youtubesqflite_0/theme_provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        drawer: DrawerToAll(),
        body: Consumer<ThemeProvider>(builder: (ctx, provider, __) {
          return SwitchListTile.adaptive(
            title: Text("Dark Mode"),
            subtitle: Text("Change the mode here"),
            onChanged: (value) {
              provider.updateTheme(value: value);
            },
            value: provider.getThemeValue(),
          );
        }));
  }
}
