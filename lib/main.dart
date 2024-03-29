import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/tabbar_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          textTheme: Theme.of(context).textTheme.copyWith(
              headlineMedium: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black)),
          appBarTheme: AppBarTheme(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          tabBarTheme: const TabBarTheme(labelColor: CupertinoColors.activeBlue),
          unselectedWidgetColor: CupertinoColors.inactiveGray),
      title: 'Material App',
      home: const TwitterTabbarView(),
    );
  }
}
