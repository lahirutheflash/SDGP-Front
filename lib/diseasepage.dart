import 'package:flutter/material.dart';
import 'package:sdgpproject/Disease.dart';
import 'constants.dart';
import 'demoData.dart';

// main() {
//   runApp(
//     const MaterialApp(
//       home: DiseasePage(),
//     ),
//   );
// }

class DiseasePage extends StatefulWidget {
  final String name;
  final String imagePath;
  final String description;
  const DiseasePage({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.description}) : super(key: key);

  @override
  State<DiseasePage> createState() => _DiseasePageState();
}

class _DiseasePageState extends State<DiseasePage> {
  //if in demo card bookmarked == true else false
  bool isBookmarked = false;

  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
      if (isBookmarked) {
        demoMediumCardData.add({
          'name': widget.name,
          'image': widget.imagePath,
          'des':widget.description,
        });
      } else {
        demoMediumCardData
            .removeWhere((element) => element['name'] == 'Acne and Rosacea');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDiseaseBack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: (){
                    //     setState(() {
                    //       if(isBookmarked){
                    //         demoMediumCardData.removeWhere((element) =>element['name'] == 'Acne and Rosacea');
                    //         isBookmarked = false;
                    //       }else{
                    //         demoMediumCardData.add({
                    //           'name' : 'Acne and Rosacea',
                    //           'image' : 'images/1.png',
                    //           'des' : 'Acne (also known as acne vulgaris) is a common skin condition that '
                    //               'affects people of all ages but primarily teens and young adults. '
                    //         });
                    //         isBookmarked = true;
                    //       }
                    //     });
                    //   },
                    // ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ]),
                        child: Icon(
                          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      onTap: toggleBookmark,
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.43,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      widget.imagePath,
                      height: 350,
                      width: 350,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.description,
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
