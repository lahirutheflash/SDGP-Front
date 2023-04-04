import 'package:flutter/material.dart';
import 'package:skeen/community.dart';
import 'constants.dart';
import 'demoData.dart';

void main() {
  runApp(
    const MaterialApp(
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
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredSupportGroups = demoSupportGroup
        .where((group) =>
            group['name'].toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
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
                  .bodyText2!
                  .copyWith(color: kAccentColor),
            ),
            const Text(
              "SKEEN Community",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              decoration: InputDecoration(
                hintText: "Search Support Groups",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
          ),
          Expanded(
            child: filteredSupportGroups.isEmpty
                ? const Center(
                    child: Text("No results found"),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SupportGroup(
                                      name: filteredSupportGroups[index]
                                          ['name'],
                                      imagePath: filteredSupportGroups[index]
                                          ['image'],
                                      url: filteredSupportGroups[index]['url'],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: SupportGroup(
                                  name: filteredSupportGroups[index]['name'],
                                  imagePath: filteredSupportGroups[index]
                                      ['image'],
                                  url: filteredSupportGroups[index]['url'],
                                ),
                              ),
                            );
                          },
                          childCount: filteredSupportGroups.length,
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
