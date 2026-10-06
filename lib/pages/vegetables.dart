import 'dart:async';

import 'package:flutter/material.dart';

import '../footer.dart';
import '../orders_page.dart';
import '../cart_service.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  final PageController _pageController = PageController();

  Timer? _timer;

  int currentPage = 0;

  final List<Map<String, dynamic>> vegetableImages = [
    {'image': 'assets/img/grocery1.webp'},
    {'image': 'assets/img/grocery2.jpeg'},
    {'image': 'assets/img/grocery3.webp'},
    {'image': 'assets/img/grocery4.jpeg'},
  ];

  final List<Map<String, dynamic>> items = [
    {'image': 'assets/img/veg1.webp'},
    {'image': 'assets/img/onion.jpg'},
    {'image': 'assets/img/tomotos.webp'},
    {'image': 'assets/img/caps.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
     {'image': 'assets/img/veg1.webp'},
    {'image': 'assets/img/onion.jpg'},
    {'image': 'assets/img/tomotos.webp'},
    {'image': 'assets/img/caps.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
      {'image': 'assets/img/veg1.webp'},
    {'image': 'assets/img/onion.jpg'},
    {'image': 'assets/img/tomotos.webp'},
    {'image': 'assets/img/caps.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
    {'image': 'assets/img/cli.jpeg'},
    {'image': 'assets/img/brocoli.webp'},
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

        if (currentPage >= vegetableImages.length) {
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

  void showBuyDialog(int index) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Buy Now',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Vegetable ${index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '₹199',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Do you want to buy this item?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final product = {
                  'title': 'Vegetable ${index + 1}',
                  'image': items[index % items.length]['image'],
                  'price': '₹199',
                };

                CartService.instance.addToCart(product);

                Navigator.pop(dialogContext);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrdersPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Buy Now'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegetables'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: vegetableImages.length,
                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            vegetableImages[index]['image'],
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        vegetableImages.length,
                        (index) {
                          return AnimatedContainer(
                            duration:
                                const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
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
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'Vegetables',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const OrdersPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () =>
                                showBuyDialog(index),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              child: Image.asset(
                                items[index % items.length]
                                    ['image'],
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons
                                          .image_not_supported,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              const EdgeInsets.all(10),
                          child: Text(
                            'Vegetable ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),
                          child: Row(
                            children: [
                              const Text(
                                '₹199',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight.bold,
                                  color:
                                      Colors.deepOrange,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color:
                                      Colors.deepOrange,
                                  borderRadius:
                                      BorderRadius.circular(
                                    8,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const AppFooter(
        currentIndex: 0,
      ),
    );
  }
}