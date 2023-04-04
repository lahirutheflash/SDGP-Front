import 'package:flutter/material.dart';

import 'constants.dart';
import 'demoData.dart';

main() {
  runApp(
    MaterialApp(
      home: CommunityPage(),
    ),
  );
}

class CommunityPage extends StatefulWidget {
  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
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
                  .bodySmall!
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

class SupportGroup extends StatelessWidget {
  final String name;
  final String imagePath;
  final String url;
  const SupportGroup(
      {Key? key,
      required this.name,
      required this.imagePath,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
