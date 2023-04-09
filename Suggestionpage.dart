import 'package:flutter/material.dart';
import 'constants.dart';
import 'demoData.dart';
import 'diseasepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
main(){
  runApp(
    MaterialApp(
      home: SuggestionPage(),
    ),
  );
}
class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  List<dynamic> _suggestionData = [];
  @override
  void initState() {
    super.initState();
    _fetchSuggestionData();
  }
  Future<void> _fetchSuggestionData() async {
    final response = await http.get(Uri.parse('http://192.168.1.158:5000/predict'));
   // print(response);


    // var bla =jsonDecode(response.body);
    // print(jsonDecode(response.body));
    // print(bla['class']);

    //Map<String, String> data = jsonDecode(response.body);
  
  // Accessing the class value using the dot notation
  // String classValue = data['class'];
  // print(classValue);
  // print(data);

  print(response.statusCode);


    if (response.statusCode == 200) {
      final List<dynamic> responseList = json.decode(response.body);
      List<dynamic> matchingList = [];
      for (var item in responseList) {
        final name = item['class'];
        final matchingItems = demoSuggestionData.where((element) => element['class'] == name).toList();
        if (matchingItems.isNotEmpty) {
          matchingList.addAll(matchingItems);
        }
      }
      setState(() {
        _suggestionData = matchingList;
      });
    } else {
      throw Exception('Failed to fetch suggestion data');
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Possible Suggestions",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        // return GestureDetector(
                        //   onTap: (){
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => DiseasePage(
                        //           name : _suggestionData[index]['name'],
                        //           imagePath: _suggestionData[index]['image'],
                        //           description: _suggestionData[index]['des'],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //       vertical: 10,
                        //       horizontal: 20,
                        //     ),
                        //     child: Suggestions(
                        //       name: _suggestionData[index]['name'],
                        //       imagePath: _suggestionData[index]['image'],
                        //     ),
                        //   ),
                        // );

                         if (_suggestionData.isEmpty){
                          return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiseasePage(
                                  name: demoSuggestionData[0]['name'],
                                  imagePath: demoSuggestionData[0]['image'],
                                  description: demoSuggestionData[0]['des'],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Suggestions(
                              name: demoSuggestionData[0]['name'],
                              imagePath: demoSuggestionData[0]['image'],
                            ),
                          ),
                        );
                         }
                         else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiseasePage(
                                  name: _suggestionData[index]['name'],
                                  imagePath: _suggestionData[index]['image'],
                                  description:
                                      _suggestionData[index]['des'],
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Suggestions(
                              name: _suggestionData[index]['name'],
                              imagePath: _suggestionData[index]['image'],
                            ),
                          ),
                        );
                      }
                      childCount: (_suggestionData.isEmpty)? 1: _suggestionData.length;

                    }
                      ,
                      childCount: _suggestionData.length,
                    ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class Suggestions extends StatelessWidget {
  final String name;
  final String imagePath;
  const Suggestions({
    Key? key,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(24),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25),
              BlendMode.darken,
            )
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}