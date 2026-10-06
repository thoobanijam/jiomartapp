import 'dart:async';
import 'package:flutter/material.dart';

import '../cart_service.dart';
import '../footer.dart';

class LGMicrowavePage extends StatefulWidget {
  const LGMicrowavePage({super.key});

  @override
  State<LGMicrowavePage> createState() => _LGMicrowavePageState();
}

class _LGMicrowavePageState extends State<LGMicrowavePage> {
  // =========================================================
  // PAGE CONTROLLER
  // =========================================================

  final PageController _pageController = PageController();

  Timer? _timer;

  // =========================================================
  // MICROWAVE SLIDER IMAGES
  // =========================================================

  final List<Map<String, dynamic>> mobileImages = [
    {
     'image': 'assets/img/microvae1.webp',
    },
    {
      'image': 'assets/img/71l2saZzl9L._AC_.jpg',
    },
    {
     'image': 'assets/img/OIP (4).webp',
    },
  ];

  // =========================================================
  // UPCOMING SALES IMAGES
  // =========================================================

  final List<Map<String, dynamic>> upcomingSalesImages = [
    {
      'image': 'assets/img/up1.webp',
    },
    {
      'image': 'assets/img/up2.webp',
    },
    {
      'image': 'assets/img/up3.webp',
    },
    {
      'image': 'assets/img/up4.webp',
    },
  ];

  // =========================================================
  // LG MICROWAVE PRODUCTS
  // =========================================================

  final List<Map<String, dynamic>> microwaveProducts = [
    {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
    {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 12,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 12,599',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 21,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 13,899',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,679',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
     {
      'image': 'assets/img/ifb.png',
      'title': 'IFb 23 L Air Fry, 70 Standard Cook Menus, Steam Clean, Weight Def...',
      'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': '20 L, Solo Microwave Oven, Black',
      'price': '₹ 11,699',
    },
  ];

  // =========================================================
  // CURRENT SLIDER PAGE
  // =========================================================

  int currentPage = 0;

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

        if (currentPage >= mobileImages.length) {
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

  void showOrderDetails(
    BuildContext context,
    Map<String, dynamic> product,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Order Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag,
                size: 70,
                color: Colors.deepOrange,
              ),

              const SizedBox(height: 15),

              // PRODUCT NAME
              Text(
                '${product['title']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // PRICE
              Text(
                '${product['price']}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              // DELIVERY DATE
              const Text(
                'Expected on 11 Aug',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),

          actions: [
            // =================================================
            // PLACE ORDER
            // =================================================

            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                showDialog(
                  context: context,
                  builder: (successContext) {
                    return AlertDialog(
                      title: const Text(
                        'Order Placed',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        '${product['title']} Order Placed!!!...',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(successContext);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Place Order',
              ),
            ),

            // =================================================
            // GO TO CART
            // =================================================

            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushReplacementNamed(
                  context,
                  '/cart',
                );
              },
              child: const Text(
                'Go to Cart',
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
      // =====================================================
      // APP BAR
      // =====================================================

      appBar: AppBar(
        title: const Text(
          'LG Microwave',
        ),
      ),

      // =====================================================
      // FULL PAGE VERTICAL SCROLL
      // =====================================================

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =================================================
              // SEARCH BOX
              // =================================================

              TextField(
                decoration: InputDecoration(
                  hintText: 'Search LG Microwave products',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // SALE IMAGE
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 100,
                child: Image.asset(
                  'assets/img/sale.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 2),

              // =================================================
              // AUTOMATIC IMAGE SLIDER
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 280,

                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: mobileImages.length,

                        onPageChanged: (index) {
                          setState(() {
                            currentPage = index;
                          });
                        },

                        itemBuilder: (context, index) {
                          return Image.asset(
                            mobileImages[index]['image'],
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 2),

                    // =================================================
                    // PAGE INDICATOR
                    // =================================================

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        mobileImages.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 300,
                            ),

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

                    const SizedBox(height: 10),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // =================================================
              // UPCOMING SALES TITLE
              // =================================================

              const Text(
                'Upcoming Sales',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // =================================================
              // UPCOMING SALES
              // =================================================

              SizedBox(
                width: double.infinity,
                height: 180,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: upcomingSalesImages.length,

                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      height: 180,

                      margin: const EdgeInsets.only(
                        right: 10,
                      ),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),

                        child: Image.asset(
                          upcomingSalesImages[index]['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // SALES 1 IMAGE
              // =================================================

              Center(
                child: Image.asset(
                  'assets/img/sales1.png',
                  width: 400,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // =================================================
              // LG MICROWAVE PRODUCTS
              // =================================================

              Column(
                children: microwaveProducts.map(
                  (product) {
                    return Container(
                      width: double.infinity,

                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),

                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),

                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          // =========================================
                          // PRODUCT IMAGE
                          // =========================================

                          Center(
                            child: Image.asset(
                              product['image'],
                              width: 180,
                              height: 180,
                              fit: BoxFit.contain,

                              errorBuilder:
                                  (context, error, stackTrace) {
                                return const SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 10),

                          // =========================================
                          // PRODUCT TITLE
                          // =========================================

                          Text(
                            product['title'],

                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // =========================================
                          // RATING
                          // =========================================

                          Text(
                            product['rating'],

                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // =========================================
                          // PRODUCT DETAILS
                          // =========================================

                          Text(
                            '• ${product['content1']}',
                          ),

                          const SizedBox(height: 12),

                          // =========================================
                          // PRICE
                          // =========================================

                          Text(
                            product['price'],

                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // =========================================
                          // BUTTONS
                          // =========================================

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceAround,

                            children: [
                              // =====================================
                              // ADD TO CART
                              // =====================================

                              SizedBox(
                                width: 150,

                                child: ElevatedButton(
                                  onPressed: () {
                                    CartService.instance.addToCart(
                                      product,
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product['title']} added to cart',
                                        ),
                                      ),
                                    );
                                  },

                                  child: const Text(
                                    'Add to Cart',
                                  ),
                                ),
                              ),

                              // =====================================
                              // BUY NOW
                              // =====================================

                              SizedBox(
                                width: 150,

                                child: ElevatedButton(
                                  onPressed: () {
                                    // STORE ORDER
                                    CartService.instance.placeOrder(
                                      product,
                                    );

                                    // OPEN ORDER DETAILS
                                    showOrderDetails(
                                      context,
                                      product,
                                    );
                                  },

                                  child: const Text(
                                    'Buy Now',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // =====================================================
      // FOOTER
      // =====================================================

      bottomNavigationBar: const AppFooter(
        currentIndex: 0,
      ),
    );
  }
}