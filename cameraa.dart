import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:lahiru/cameraa.dart';


class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? selectedImage;
  String base64Image="";
  late CameraController camcontroller;
  //XFile? picture;
  XFile? image;


  Future<void> chooseImage(type) async{
    //var image;
    if(type =="camera"){
      //_CameraPreview(context);
      
       image = (await ImagePicker()
           .pickImage(source: ImageSource.camera,)) ;
           if(image!=null){
            print('picture is working');
           }else{
              print('picture not there');
           }
    }else{
      image = (await ImagePicker()
          .pickImage(source: ImageSource.gallery,));
          if(image!=null){
            print('image is working');
           }else{
              print('image not there');
           }
    }
    if(image != null){
      setState(() {
        selectedImage = File(image!.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }
  }
//camera preview in another way
 Widget _CameraPreview(BuildContext context) {
    return Container(
      width: 300,
      height: 450,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: AspectRatio(
        aspectRatio: 1 / camcontroller.value.aspectRatio,
        child: CameraPreview(camcontroller),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    camcontroller = CameraController(
      widget.cameras![1],
      ResolutionPreset.max,
      enableAudio: false,
    );
    camcontroller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((i) {
      print(i);
    });
  }
   @override
  void dispose() {
    camcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (!camcontroller.value.isInitialized) {
      return Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Welcome To".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.blueAccent),
            ),
            const Text(
              "Camera Page",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipOval(
                    child: selectedImage != null? Image.file(
                      selectedImage!,
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ) : Image.network(
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )
                  ),
                ),
              ),
              // camera window
              //_CameraPreview(context),
              ElevatedButton(
                  onPressed: (){
                    chooseImage("camera");
                  },
                  child: const Text("Image from Camera"),
              ),
              ElevatedButton(
                onPressed: (){
                  chooseImage("");
                },
                child: const Text("Image from Gallery"),
              ),
              ElevatedButton(
                onPressed: (){
                  
                },
                child: const Text("OK"),
              )

            ],
        )
      )
    );
  }
}

  // final request = http.MultipartRequest(
  //             // 'POST', Uri.parse('http://192.168.1.127:5000/mood'));
  //             'POST',
  //             Uri.parse('http://164.90.223.233:8080/mood'));

  //         //final headers = {{"Content-type": "multipart/form-data"}};

  //         // request.headers.addAll({"Content-type": "multipart/form-data"});
  //         final headers = {"Content-type": "multipart/form-data"};
  //         //print(selectedImage);
  //         request.files.add(http.MultipartFile(
  //             'image',
  //             selectedImage!.readAsBytes().asStream(),
  //             selectedImage!.lengthSync(),
  //             filename: selectedImage!.path));

  //         //print(request);

  //         request.headers.addAll(headers);
  //         final response = await request.send();
  //         http.Response res = await http.Response.fromStream(response);
  //         final resJson = jsonDecode(res.body);
  //         message = resJson['message'];
  //         setState(() {});