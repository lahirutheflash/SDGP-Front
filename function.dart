import 'dart:convert';
import 'dart:io';

// import 'package:http/http.dart' as http;

// Future<String> makePredictionRequest(File selectedImage) async {
//   final request = http.MultipartRequest(
//     'POST',
//     Uri.parse('http://127.0.0.1:5000/predict'),
//   );

//   final headers = {'Content-type': 'multipart/form-data'};

//   request.files.add(
//     await http.MultipartFile.fromPath(
//       'image',
//       selectedImage.path,
//     ),
//   );

//   request.headers.addAll(headers);
//   final response = await request.send();
//   final res = await http.Response.fromStream(response);
//   final resJson = jsonDecode(res.body);
//   final message = resJson['message'];

//   return message;
// }

import 'package:http/http.dart' as http;

Future<void> sendImage(File? selectedImage) async {
  if (selectedImage == null) {
    print('No image selected.');
    return;
  }

  var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.158:5000/predict'));
  final headers = {"Content-type": "multipart/form-data"};
  request.headers.addAll(headers);
  request.files.add(await http.MultipartFile.fromPath('image', selectedImage.path));

  print(selectedImage.path);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

  
}

// var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:5000/predict'));
// request.files.add(await http.MultipartFile.fromPath('image', '/Users/lahiru/Documents/IIT/Important/2nd Year/SDGP/ML Model/Dataset copy/imagee.jpg'));

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }
