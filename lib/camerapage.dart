import 'package:flutter/material.dart';

main(){
  runApp(
    MaterialApp(
      home: CameraPage(),
    ),
  );
}
class CameraPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("cam page"),
        ),
        body: Center(
          child: Text(
            "cam page",
            style: TextStyle(fontSize: 20.0),),
        ),
      ),
    );
  }
}