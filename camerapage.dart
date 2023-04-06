import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
// import 'package:lahiru/Suggestionpage.dart';
import 'demo.dart';
import 'dart:convert';
import 'function.dart';

void main() {
  runApp(
    MaterialApp(
      home: CameraPage(),
    ),
  );
}

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key:key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? selectedImage;
  String base64Image="";

  Future<void> chooseImage(type) async{
    var image;
    if(type =="camera"){
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera,);
    }else{
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery,);
    }
    if(image != null){
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(247, 255, 214, 190),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            const Text(
              "Camera Page",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundColor: Color.fromARGB(255, 188, 133, 129),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ClipOval(
                  child: selectedImage != null? Image.file(
                    selectedImage!,
                    fit: BoxFit.cover,
                    height: 500,
                    width: 500,
                  ) : Image.network(
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                    fit: BoxFit.cover,
                    height: 500,
                    width: 500,
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              
                onPressed: (){
                  chooseImage("camera");
                },
                child: const Text("Image from Camera"),
            ),
            SizedBox(height: 5,),
            ElevatedButton(
              onPressed: (){
                chooseImage("Gallery");
              },
              child: const Text("Image from Gallery"),
            ),
            SizedBox(height: 30,),
             ElevatedButton(
              onPressed: () async {
                
                // chooseImage("Gallery");
                sendImage(selectedImage);
                await Navigator.push(
            
                    context,
                    MaterialPageRoute(builder: (context) => SuggestionPage()),
                
                );
              },
              child: const Text("OK"),
            ),
          ],
          ),
        
      ),
    );
  }
}
