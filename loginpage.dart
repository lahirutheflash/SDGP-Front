import 'package:flutter/material.dart';
import 'package:lahiru/rulespage.dart';


void main() {
  runApp(
    MaterialApp(
      home: LoginPage(),
    ),
  );
}
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skeen App',
      home: MyLoginPage(),
    );
  }
}
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({Key? key}) : super(key: key);

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/main.png'),
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
                            builder: (context) => const RulesPage()),
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


