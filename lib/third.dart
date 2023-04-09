import 'package:flutter/material.dart';
import 'package:skeen/camerapage.dart';
import 'package:skeen/community.dart';
import 'package:skeen/homescreen.dart';

import 'camerapage.dart';
import 'community.dart';
import 'homescreen.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List pages = [
    CameraPage(),
    const HomeScreen(),
    CommunityPage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.green,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: 'Camera',
            icon: Icon(Icons.camera_alt_rounded),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Community',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
