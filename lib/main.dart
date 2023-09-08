import 'package:curve_bar/screens/screen1.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 32, 67),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: _controller,
        children: const [
          Screen1(),
          Center(child: Text('Page 2')),
          Center(child: Text('Page 3')),
          Center(child: Text('Page 4')),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (value) {
            setState(() {
              setState(() {
                currentIndex = value;
                _controller.jumpToPage(currentIndex);
              });
            });
          },
          index: currentIndex,
          backgroundColor: const Color.fromARGB(255, 45, 32, 67),
          items: const [
            Icon(Icons.home),
            Icon(Icons.access_alarm),
            Icon(Icons.shop),
            Icon(Icons.verified_user)
          ]),
    );
  }
}
