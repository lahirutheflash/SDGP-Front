import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:skeen/second.dart';
import 'package:skeen/camerapage.dart';
import 'package:skeen/community.dart';
import 'package:skeen/homescreen.dart';

import 'constants.dart';
import 'diseasepage.dart';
import 'suggestionpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skeen App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/main.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: MediaQuery.of(context).size.height * 0.2,
              child: Container(),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 40,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button press logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
