import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'curved_navigation_bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = const [
    Page(title: "Settings page", color: Colors.orange),
    Page(title: "Search Page", color: Colors.redAccent),
    Page(title: "Home page", color: Colors.blueGrey),
    Page(title: "Messages Page", color: Colors.green),
    Page(title: "Profile Page", color: Colors.purple),
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Curved Navigator Bar"),
        centerTitle: true,
      ),
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        height: 50,
        color: Colors.white38,
        index: index,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        buttonBackgroundColor: Colors.white70,
        items: [
          Icon(
            Icons.settings,
            size: 30,
            color: index == 0 ? Colors.black : Colors.white70,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: index == 1 ? Colors.black : Colors.white70,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: index == 2 ? Colors.black : Colors.white70,
          ),
          Icon(
            Icons.message,
            size: 30,
            color: index == 3 ? Colors.black : Colors.white70,
          ),
          Icon(Icons.person,
              size: 30, color: index == 4 ? Colors.black : Colors.white70),
        ],
        onTap: (i) {
          setState(() => index = i);
        },
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Color color;
  final String title;
  const Page({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
