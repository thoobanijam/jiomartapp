import 'dart:async';
import 'package:flutter/material.dart';
import '../cart_service.dart';
import '../footer.dart';

class KitchenDiningPage extends StatefulWidget {
  const KitchenDiningPage({super.key});

  @override
  State<KitchenDiningPage> createState() => _KitchenDiningPageState();
}

class _KitchenDiningPageState extends State<KitchenDiningPage> {
  // =========================================================
  // PAGE CONTROLLER
  // =========================================================

  final PageController _pageController = PageController();

  Timer? _timer;

  // =========================================================
  // MOBILE SLIDER IMAGES
  // =========================================================

  final List<Map<String, dynamic>> mobileImages = [
    {
      'image': 'assets/img/k1.png',
    },
    {
      'image': 'assets/img/k2.webp',
    },
    {
      'image': 'assets/img/k3.webp',
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
  // KITCHEN & DINING PRODUCTS
  // =========================================================

  final List<Map<String, dynamic>> kitchenProducts = [
  {
    'image': 'assets/img/kitchen1.webp',
    'title': 'Kitchen Pot',
    'rating': '4.3 3,098 Rating & 241 Reviews',
      'content1': 'Steel, Microwave Safe',
    'price': '₹ 22,999',
  },

  {
    'image': 'assets/img/pan.png',
    'title': 'Frypan',
    'rating': '4.4 2,845 Rating & 198 Reviews',
       'content1': 'Steel, Microwave Safe',
    'price': '₹ 242',
  },

  {
    'image': 'assets/img/tawa.png',
    'title': 'VICKY KITCHEN TOTI TAWA',
    'rating': '4.5 4,126 Rating & 327 Reviews',
      'content1': 'Steel, Microwave Safe',
    'price': '₹ 230',
  },

  {
    'image': 'assets/img/MUG.png',
    'title': 'Premium Leakproof Mug',
    'rating': '4.2 1,976 Rating & 156 Reviews',
       'content1': 'Steel, Microwave Safe',
    'price': '₹ 220',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

  {
    'image': 'assets/img/beware.png',
    'title': 'Dynore Stainless Steel',
    'rating': '4.3 3,754 Rating & 289 Reviews',
    'content1': 'Steel, Microwave Safe',
    'price': '₹199',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },
  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

  {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
  },

   {
    'image': 'assets/img/plates.png',
    'title': 'Cimis Pack of 9 Stainless Steel,Sliver',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': 'Steel, Microwave Safe',
    
    'price': '₹ 264',
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
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitchen & Dining'),
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
                  hintText: 'Search Kitchen & Dining products',
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

                    // IMAGE SLIDER
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
              // KITCHEN & DINING PRODUCTS
              // =================================================

              Column(
                children: kitchenProducts.map((product) {
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
                        // ADD TO CART BUTTON
                        // =========================================

                        Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                  CartService.instance.addToCart(product);
                            
                                  ScaffoldMessenger.of(context).showSnackBar(
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
                          
                    // buy now
                      // Buy Now
SizedBox(
  width: 150,
  child: ElevatedButton(
    onPressed: () {
      CartService.instance.addToCart(product);

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: const Text(
                'Orders Details',
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
                  Icons.check_circle,
                  size: 70,
                  color: Colors.green,
                ),

                const SizedBox(height: 15),

                Text(
                  '${product['title']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

               Text(
                  '${product['price']}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
              
                  ),
                ),
                 Text(
                  "expect on 11 Aug",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                   
                  ),
                ),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () {
                showDialog(
  context: context,
  builder: (context) {
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
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  },
);                },
                child: const Text('Buy Now'),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.pushReplacementNamed(
                    context,
                    '/cart',
                  );
                },
                child: const Text('Go to Cart'),
              ),
            ],
          );
        },
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
                }).toList(),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
       bottomNavigationBar: const AppFooter(
        currentIndex: 0,
      ),
    );
  }
}