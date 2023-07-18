import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_start/datamanager.dart';
import 'package:flutter_start/pages/menupage.dart';
import 'package:flutter_start/pages/offerpage.dart';
import 'package:flutter_start/pages/orderpage.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.brown,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MainApp createState() => MainApp();
}

class MainApp extends State<MyApp> {
  String value = "hello world";
  int selectedIndex = 0;
  var dataManager = DataManager();

  void onClickBtn(String inputValue) {
    setState(() {
      value = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("!!!");

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        currentWidgetPage = OrderPage(dataManager: dataManager);
        break;
      case 2:
        currentWidgetPage = const OffersPage();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ireedui beno"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow.shade400,
          unselectedItemColor: Colors.yellow.shade50,
          items: const [
            BottomNavigationBarItem(label: "Menu", icon: Icon(Icons.coffee)),
            BottomNavigationBarItem(label: "Shop", icon: Icon(Icons.shop)),
            BottomNavigationBarItem(
              label: "Order",
              icon: Icon(Icons.shopping_cart_checkout_outlined),
            )
          ]),
      body: currentWidgetPage,
      // body: [
      //   const MenuPage(),
      //   const Text('sdfs'),
      //   const OffersPage(),
      // ][selectedIndex],
    );
    //
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  String name = "test";

  @override
  Widget build(BuildContext context) {
    const greetStyle = TextStyle(color: Colors.blueAccent);

    return Column(children: <Widget>[
      Row(
        children: [
          Text("$name beeonoo", style: greetStyle),
          Column(
            children: [
              Image.asset(
                'images/profile.png',
                height: 200,
              )
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: TextField(
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Enter Password',
          ),
          onChanged: (text) {
            setState(() {
              name = text;
            });
          },
          style: greetStyle,
        ),
      ),
    ]);
  }
}
