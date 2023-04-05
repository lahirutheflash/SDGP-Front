import 'package:flutter/material.dart';
import 'constants.dart';
import 'demoData.dart';
import 'dart:async';

main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
              "SKEEN",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tips",
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ImageCarousel(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recents",
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ImageCarousel(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BookMarked",
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                ),
                demoMediumCardData.isEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding,
                            horizontal: defaultPadding * 3,
                          ),
                          child: Text(
                            "No saved items yet",
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DiseasePage(
                                      name: demoMediumCardData[index]['name'],
                                      imagePath: demoMediumCardData[index]
                                          ['image'],
                                      description: demoMediumCardData[index]
                                          ['des'],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Recents(
                                  name: demoMediumCardData[index]['name'],
                                  imagePath: demoMediumCardData[index]['image'],
                                ),
                              ),
                            );
                          },
                          childCount: demoMediumCardData.length,
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DiseasePage({required name, required imagePath, required description}) {}
}

class Recents extends StatelessWidget {
  final String name;
  final String imagePath;
  const Recents({
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

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      final nextPage = _currentPage + 1;
      if (nextPage >= demoBigImages.length) {
        _pageController.jumpToPage(0);
        setState(() {
          _currentPage = 0;
        });
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: demoBigImages.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
              _stopTimer();
              _startTimer();
            },
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                demoBigImages[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                demoBigImages.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding / 4),
                  child: IndicatorDot(isActive: index == _currentPage),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  IndicatorDot({required bool isActive}) {}
}
