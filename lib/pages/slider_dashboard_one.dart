import 'dart:async';

import 'package:flutter/material.dart';

class SliderDashboardOne extends StatefulWidget {
  const SliderDashboardOne({super.key});

  @override
  State<SliderDashboardOne> createState() => _SliderDashboardOneState();
}

class _SliderDashboardOneState extends State<SliderDashboardOne> {
  final PageController _pageController = PageController();

  Timer? _timer;

  int currentPage = 0;

  final List<Map<String, dynamic>> upcomingSalesImages = [
    {
      'image': 'assets/img/tomotos.webp',
    },
    {
      'image': 'assets/img/up4.webp',
    },
    {
      'image': 'assets/img/vivo5.png',
    },
    {
      'image': 'assets/img/71l2saZzl9L._AC_.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        if (!_pageController.hasClients) {
          return;
        }

        currentPage++;

        if (currentPage >= upcomingSalesImages.length) {
          currentPage = 0;
        }

        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: upcomingSalesImages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      upcomingSalesImages[index]['image'],
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                      errorBuilder: (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                upcomingSalesImages.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 12 : 8,
                    height: currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPage == index
                          ? Colors.deepOrange
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}