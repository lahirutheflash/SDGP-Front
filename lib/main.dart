import 'package:flutter/material.dart';
import 'package:sdgpproject/camerapage.dart';
import 'package:sdgpproject/community.dart';
import 'package:sdgpproject/homescreen.dart';

import 'constants.dart';
import 'diseasepage.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List pages =[
    CameraPage(),
    HomeScreen(),
    CommunityPage(),
  ];
  int currentIndex =0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54 ,
          unselectedItemColor: Colors.green,
          elevation: 0,
          items : [
            BottomNavigationBarItem(label: 'Camera',icon: Icon(Icons.camera_alt_rounded)),
            BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Community',icon: Icon(Icons.person)),
          ]
      ),
    );
  }
}


//re write the code where we can bookmarked the page and keep it bookmarked untill we press again and undo it.