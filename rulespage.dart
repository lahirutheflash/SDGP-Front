import 'package:flutter/material.dart';
import 'package:lahiru/loginpage.dart';
import 'package:lahiru/main.dart';
import 'cameraa.dart';



// void main() {
//   runApp(
//     MaterialApp(
//       home: RulesPage(),
//     ),
//   );
// }
class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/second.png'),
                fit: BoxFit.cover,
              ),
            ),
          ), // to add background image
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp())
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ), //
                ),
                child: const Text("I Understand. Let's Get Started"),
              ), //
            ), //to add containers
          ), // aline the page has to be done as well >
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
