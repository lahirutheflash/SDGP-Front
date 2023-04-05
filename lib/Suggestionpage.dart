import 'package:flutter/material.dart';
import 'constants.dart';
import 'demoData.dart';
import 'diseasepage.dart';

main() {
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DiseasePage(
                                name: demoSuggestionData[index]['name'],
                                imagePath: demoSuggestionData[index]['image'],
                                description: demoSuggestionData[index]['des'],
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
                            name: demoSuggestionData[index]['name'],
                            imagePath: demoSuggestionData[index]['image'],
                          ),
                        ),
                      );
                    },
                    childCount: demoSuggestionData.length,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  DiseasePage({required name, required imagePath, required description}) {}
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
            )),
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
