import 'dart:async';

import 'package:flutter/material.dart';

import '../footer.dart';
import '../orders_page.dart';
import '../cart_service.dart';

class Beverage extends StatefulWidget {
  const Beverage({super.key});

  @override
  State<Beverage> createState() => _BeverageState();
}

class _BeverageState extends State<Beverage> {
  // =========================================================
  // PAGE CONTROLLER
  // =========================================================

  final PageController _pageController = PageController();

  Timer? _timer;

  int currentPage = 0;

  // =========================================================
  // MILK & DAIRY SLIDER IMAGES
  // =========================================================

  final List<Map<String, dynamic>> milkDiaryImages = [
    {
      'image': 'assets/img/grocery1.webp',
    },
    {
      'image': 'assets/img/grocery2.jpeg',
    },
    {
      'image': 'assets/img/grocery3.webp',
    },
    {
      'image': 'assets/img/grocery4.jpeg',
    },
  ];

  // =========================================================
  // MILK & DAIRY PRODUCTS
  // =========================================================

  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/img/7up.png',
    },
    {
      'image': 'assets/img/aw.jpg',
    },
    {
      'image': 'assets/img/canadadry.webp',
    },
    {
      'image': 'assets/img/clamdo.webp',
    },
    {
      'image': 'assets/img/crush.webp',
    },
    {
      'image': 'assets/img/deja.webp',
    },
    {
      'image': 'assets/img/deitride.webp',
    },
    {
      'image': 'assets/img/pepper.webp',
    },
    {
      'image': 'assets/img/m.webp',
    },
   {
      'image': 'assets/img/7up.png',
    },
    {
      'image': 'assets/img/aw.jpg',
    },
    {
      'image': 'assets/img/canadadry.webp',
    },
    {
      'image': 'assets/img/clamdo.webp',
    },
    {
      'image': 'assets/img/crush.webp',
    },
    {
      'image': 'assets/img/deja.webp',
    },
    {
      'image': 'assets/img/deitride.webp',
    },
    {
      'image': 'assets/img/pepper.webp',
    },
    {
      'image': 'assets/img/m.webp',
    },
      ];

  // =========================================================
  // INIT STATE
  // =========================================================

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

        if (currentPage >= milkDiaryImages.length) {
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

  // =========================================================
  // DISPOSE
  // =========================================================

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();

    super.dispose();
  }

  // =========================================================
  // BUY NOW DIALOG
  // =========================================================

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
                'Snacks ${index + 1}',
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
            // =================================================
            // CANCEL
            // =================================================

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            // =================================================
            // BUY NOW
            // =================================================

            ElevatedButton(
              onPressed: () {
                final product = {
                  'title':
                      'Snacks ${index + 1}',
                  'image':
                      items[index % items.length]['image'],
                  'price': '₹199',
                };

                // Add product to cart
                CartService.instance.addToCart(product);

                // Close dialog
                Navigator.pop(dialogContext);

                // Open Orders Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const OrdersPage(),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Buy Now',
              ),
            ),
          ],
        );
      },
    );
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =======================================================
      // APP BAR
      // =======================================================

      appBar: AppBar(
        title: const Text(
          'Beverage',
        ),
        centerTitle: true,
      ),

      // =======================================================
      // BODY
      // =======================================================

      body: SingleChildScrollView(
        child: Column(
          children: [
            // =================================================
            // MILK & DAIRY SLIDER
            // =================================================

            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 300,

                child: Column(
                  children: [
                    // =========================================
                    // PAGE VIEW
                    // =========================================

                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,

                        itemCount:
                            milkDiaryImages.length,

                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },

                        itemBuilder:
                            (context, index) {
                          return Image.asset(
                            milkDiaryImages[index]
                                ['image'],

                            width: double.infinity,
                            height: double.infinity,

                            fit: BoxFit.fill,

                            errorBuilder:
                                (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return const Center(
                                child: Icon(
                                  Icons
                                      .image_not_supported,
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

                    // =========================================
                    // SLIDER DOTS
                    // =========================================

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: List.generate(
                        milkDiaryImages.length,
                        (index) {
                          return AnimatedContainer(
                            duration:
                                const Duration(
                              milliseconds: 300,
                            ),

                            margin:
                                const EdgeInsets
                                    .symmetric(
                              horizontal: 4,
                            ),

                            width:
                                currentPage == index
                                    ? 12
                                    : 8,

                            height:
                                currentPage == index
                                    ? 12
                                    : 8,

                            decoration:
                                BoxDecoration(
                              shape:
                                  BoxShape.circle,

                              color:
                                  currentPage ==
                                          index
                                      ? Colors
                                          .deepOrange
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

            // =================================================
            // TITLE + SEE ALL + CART
            // =================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: Row(
                children: [
                  const Text(
                    'Beverage',

                    style: TextStyle(
                      fontSize: 26,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  // ===========================================
                  // SEE ALL
                  // ===========================================

                  TextButton(
                    onPressed: () {},

                    child: const Text(
                      'See All',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Colors.deepOrange,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // ===========================================
                  // CART
                  // ===========================================

                  Container(
                    width: 42,
                    height: 42,

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.deepOrange,

                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),
                    ),

                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
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

            // =================================================
            // PRODUCTS GRID
            // =================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),

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

                itemBuilder:
                    (context, index) {
                  return Container(
                    decoration:
                        BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.2),

                          blurRadius: 5,

                          spreadRadius: 1,
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [
                        // =====================================
                        // PRODUCT IMAGE
                        // =====================================

                        Expanded(
                          child:
                              GestureDetector(
                            onTap: () {
                              showBuyDialog(
                                index,
                              );
                            },

                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius
                                      .vertical(
                                top: Radius
                                    .circular(
                                  12,
                                ),
                              ),

                              child: Image.asset(
                                items[index %
                                    items.length]['image'],

                                width:
                                    double.infinity,

                                fit:
                                    BoxFit.cover,

                                errorBuilder:
                                    (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return const Center(
                                    child: Icon(
                                      Icons
                                          .image_not_supported,
                                      size: 40,
                                      color:
                                          Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        // =====================================
                        // PRODUCT NAME
                        // =====================================

                        Padding(
                          padding:
                              const EdgeInsets
                                  .all(10),

                          child: Text(
                            'Beverage ${index + 1}',

                            style:
                                const TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        // =====================================
                        // PRICE + ADD BUTTON
                        // =====================================

                        Padding(
                          padding:
                              const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 10,
                          ),

                          child: Row(
                            children: [
                              const Text(
                                '₹199',

                                style:
                                    TextStyle(
                                  fontSize: 16,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                  color: Colors
                                      .deepOrange,
                                ),
                              ),

                              const Spacer(),

                              // =================================
                              // ADD BUTTON
                              // =================================

                              GestureDetector(
                                onTap: () {
                                  final product = {
                                    'title':
                                        'Milk & Dairy Item ${index + 1}',
                                    'image':
                                        items[index % items.length]['image'],
                                    'price':
                                        '₹199',
                                  };

                                  CartService
                                      .instance
                                      .addToCart(
                                    product,
                                  );

                                  ScaffoldMessenger
                                          .of(
                                    context,
                                  ).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Item added to cart',
                                      ),
                                      duration:
                                          Duration(
                                        seconds: 1,
                                      ),
                                    ),
                                  );
                                },

                                child: Container(
                                  width: 35,
                                  height: 35,

                                  decoration:
                                      BoxDecoration(
                                    color: Colors
                                        .deepOrange,

                                    borderRadius:
                                        BorderRadius
                                            .circular(
                                      8,
                                    ),
                                  ),

                                  child:
                                      const Icon(
                                    Icons.add,
                                    color:
                                        Colors.white,
                                    size: 22,
                                  ),
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

      // =======================================================
      // FOOTER
      // =======================================================

      bottomNavigationBar:
          const AppFooter(
        currentIndex: 0,
      ),
    );
  }
}