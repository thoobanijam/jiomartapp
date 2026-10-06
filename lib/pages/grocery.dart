import 'dart:async';

import 'package:flutter/material.dart';
import '../footer.dart';
import '../orders_page.dart';
import '../cart_service.dart';

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  // =========================================================
  // PAGE CONTROLLER
  // =========================================================

  final PageController _pageController = PageController();

  Timer? _timer;

  // =========================================================
  // CURRENT PAGE
  // =========================================================

  int currentPage = 0;

  // =========================================================
  // GROCERY IMAGES
  // =========================================================

  final List<Map<String, dynamic>> groceryImages = [
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

  // items
   final List<Map<String, dynamic>> Items = [
    {
      'image': 'assets/img/items1.webp',
    },
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
    },
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
    },
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
    },
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
    },
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
     {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
    },
   
    {
      'image': 'assets/img/items2.webp',
    },
    {
      'image': 'assets/img/items3.webp',
    },
    {
      'image': 'assets/img/items4.jpg',
    },
    {
      'image': 'assets/img/items1.webp',
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

        if (currentPage >= groceryImages.length) {
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
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
        centerTitle: true,
      ),

      // =====================================================
      // BODY
      // =====================================================

      body: SingleChildScrollView(
        child: Column(
          children: [

            // =================================================
            // GROCERY IMAGE SLIDER
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

                        itemCount: groceryImages.length,

                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },

                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: double.infinity,

                            child: Image.asset(
                              groceryImages[index]['image'],

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

                    // =========================================
                    // SLIDER DOTS
                    // =========================================

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,

                      children: List.generate(
                        groceryImages.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 300,
                            ),

                            margin:
                                const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),

                            width: currentPage == index
                                ? 12
                                : 8,

                            height: currentPage == index
                                ? 12
                                : 8,

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

            // =================================================
            // GROCERY TITLE + SEE ALL + CART
            // =================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,

                children: [

                  // =========================================
                  // GROCERY TITLE
                  // =========================================

                  const Text(
                    'Groceries',

                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // =========================================
                  // SPACE
                  // =========================================

                  const Spacer(),

                  // =========================================
                  // SEE ALL
                  // =========================================

                  TextButton(
                    onPressed: () {
                      // Add your action here
                    },

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

                  // =========================================
                  // CART ICON
                  // =========================================

                  Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: Colors.deepOrange,

                      borderRadius:
                          BorderRadius.circular(10),
                    ),

                    child: IconButton(
                      onPressed: () {
                        // Add cart action here
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
            // GROCERY PRODUCTS
            // =================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: GridView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: Items.length,


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
                          color: Colors.grey
                              .withOpacity(0.2),

                          blurRadius: 5,

                          spreadRadius: 1,
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // ===================================
                        // PRODUCT IMAGE
                        // ===================================

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
    showDialog(
      context: context,
      builder: (context) {
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
      'Grocery Item ${index + 1}',
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
                                  fontWeight:
                                      FontWeight.bold,
                                  color:
                                      Colors.deepOrange,
                                ),
                              ),

    const Text(
      'Do you want to buy this item?',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
      ),
    ),
  ],
),

          actions: [
            // CANCEL BUTTON
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            // BUY NOW BUTTON
            ElevatedButton(
              onPressed: () {
  final product = {
    'title': 'Grocery Item ${index + 1}',
    'image': Items[index]['image'],
    'price': '₹199',
  };

  // Add the item to cart
  CartService.instance.addToCart(product);

  // Close the Buy Now dialog
  Navigator.pop(context);

  // Open Orders Page
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

              child: const Text(
                'Buy Now',
              ),
            ),
          ],
        );
      },
    );
  },

                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                            
                              child: Image.asset(
                               Items[
                                        index %
                                           Items
                                                .length]
                                    ['image'],
                            
                                width: double.infinity,
                            
                                fit: BoxFit.cover,
                            
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
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

                        // ===================================
                        // PRODUCT NAME
                        // ===================================

                        Padding(
                          padding:
                              const EdgeInsets.all(10),

                          child: Text(
                            'Grocery Item ${index + 1}',

                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        // ===================================
                        // PRICE
                        // ===================================

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

                                decoration:
                                    BoxDecoration(
                                  color:
                                      Colors.deepOrange,

                                  borderRadius:
                                      BorderRadius
                                          .circular(8),
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