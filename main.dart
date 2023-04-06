import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'camerapage.dart';
import 'camerapage.dart';
import 'homescreen.dart';
import 'community.dart';
//import 'community.dart';
 import 'package:lahiru/community.dart';
// import 'package:sdgpproject/homescreen.dart';

// import 'constants.dart';
// import 'diseasepage.dart';
import 'demo.dart';
// ignore: unused_import





// //List<CameraDescription>? cameras;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }



// void main() {
//   runApp(
//     const MaterialApp(
//       home: MyApp(),
//     ),
//   );
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List pages =[
    HomeScreen(),
    CameraPage(),
    CommunityPage(),
    SuggestionPage()
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
          unselectedItemColor: Color.fromARGB(255, 222, 137, 41),
          elevation: 0,
          items : [
            BottomNavigationBarItem(label: 'Home',icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Camera',icon: Icon(Icons.camera_alt_rounded)),
            BottomNavigationBarItem(label: 'Community',icon: Icon(Icons.person)),
          ]
      ),
    );
  }
}



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Skeen App',
//       home: MainPage(),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/main.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               bottom: MediaQuery.of(context).size.height * 0.2,
//               child: Container(),
//             ),
//             Positioned(
//               left: 20,
//               right: 20,
//               bottom: 40,
//               child: SizedBox(
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     // Add your button press logic here
//                     // change this later i have added the camera navigation here to test
//                     await availableCameras().then(
//                         (value) => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>  CameraPage(
//                                cameras: value,
//                             )),
            
//                         )
//                     );
                    
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (context) => const SecondPage()),
//                     // );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.pink,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: const Text('Get Started'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
