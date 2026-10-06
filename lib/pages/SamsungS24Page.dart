import 'dart:async';
import 'package:flutter/material.dart';
import '../cart_service.dart';
import '../footer.dart';
class SamsungS24Page extends StatefulWidget {
  const SamsungS24Page({super.key});

  @override
  State<SamsungS24Page> createState() => _SamsungS24PageState();
}

class _SamsungS24PageState extends State<SamsungS24Page> {
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
      'image': 'assets/img/mob1.webp',
    },
    {
      'image': 'assets/img/mob2.webp',
    },
    {
      'image': 'assets/img/mob3.webp',
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
  // SAMSUNG PRODUCTS
  // =========================================================

 final List<Map<String, dynamic>> samsungProducts = [
  {
    'image': 'assets/img/vivo1.png',
    'title': 'Vivo T5 Lite 44W 5G (Twilight Shadow, 128GB)',
    'rating': '4.3 3,098 Rating & 241 Reviews',
    'content1': '6 GB RAM | 128 GB ROM',
    'content2': '17.12 cm (6.74) HD+ Display',
    'content3': '50MP + 0.08MP | 5MP Front Camera',
    'content4': '6500 mAh Li-ion Battery',
    'content5': 'Dimensity 6300 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Accessories Included',
    'price': '₹ 22,999',
  },

  {
    'image': 'assets/img/vivo2.png',
    'title': 'Vivo Y29 5G (Glacier Blue, 128GB)',
    'rating': '4.4 2,845 Rating & 198 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) HD+ Display',
    'content3': '50MP Main Camera | 8MP Front Camera',
    'content4': '5500 mAh Battery',
    'content5': 'Snapdragon 4 Gen 2 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'USB Cable & Charger Included',
    'price': '₹ 20,499',
  },

  {
    'image': 'assets/img/vivo3.png',
    'title': 'Vivo V50 Lite 5G (Titanium Silver, 256GB)',
    'rating': '4.5 4,126 Rating & 327 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '17.20 cm (6.77) AMOLED Display',
    'content3': '50MP + 8MP Dual Rear Camera',
    'content4': '6500 mAh Battery',
    'content5': 'Dimensity 6300 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Fast Charger Included',
    'price': '₹ 18,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Vivo T4x 5G (Pronto Purple, 128GB)',
    'rating': '4.2 1,976 Rating & 156 Reviews',
    'content1': '6 GB RAM | 128 GB ROM',
    'content2': '17.07 cm (6.72) Full HD+ Display',
    'content3': '50MP + 2MP | 8MP Front Camera',
    'content4': '6500 mAh Battery',
    'content5': 'Dimensity 7300 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger & Documentation Included',
    'price': '₹ 22,999',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'Vivo V40 5G (Ganges Blue, 256GB)',
    'rating': '4.6 5,284 Rating & 412 Reviews',
    'content1': '12 GB RAM | 256 GB ROM',
    'content2': '17.22 cm (6.78) AMOLED Display',
    'content3': '50MP + 50MP Dual Rear Camera',
    'content4': '5500 mAh Battery',
    'content5': 'Snapdragon 7 Gen 3 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger, Cable & Case Included',
    'price': '₹ 18,999',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'Samsung Galaxy A16 5G (Light Green, 128GB)',
    'rating': '4.4 4,892 Rating & 356 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.91 cm (6.7) Super AMOLED Display',
    'content3': '50MP + 5MP + 2MP | 13MP Front Camera',
    'content4': '5000 mAh Battery',
    'content5': 'Dimensity 6300 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger & USB Cable Included',
    'price': '₹14,999',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'Apple iPhone 15 (Black, 128GB)',
    'rating': '4.6 8,245 Rating & 621 Reviews',
    'content1': '6 GB RAM | 128 GB ROM',
    'content2': '15.49 cm (6.1) Super Retina XDR Display',
    'content3': '48MP + 12MP Dual Rear Camera | 12MP Front',
    'content4': 'All-Day Battery Life',
    'content5': 'A16 Bionic Chip',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'USB Type-C Cable Included',
    'price': '₹54,999',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'OnePlus Nord CE 4 Lite 5G (Super Silver, 128GB)',
    'rating': '4.3 3,754 Rating & 289 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) AMOLED Display',
    'content3': '50MP Main Camera | 16MP Front Camera',
    'content4': '5500 mAh Battery',
    'content5': 'Snapdragon 695 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '80W SUPERVOOC Charger Included',
    'price': '₹19,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Xiaomi Redmi Note 14 5G (Titan Black, 128GB)',
    'rating': '4.4 5,126 Rating & 402 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) AMOLED Display',
    'content3': '50MP + 8MP + 2MP | 20MP Front Camera',
    'content4': '5110 mAh Battery',
    'content5': 'Dimensity 7025 Ultra 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger & USB Cable Included',
    'price': '₹17,499',
  },

  {
    'image': 'assets/img/vivo3.png',
    'title': 'Realme P3 5G (Nebula Pink, 128GB)',
    'rating': '4.3 3,621 Rating & 278 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) AMOLED Display',
    'content3': '50MP Main Camera | 16MP Front Camera',
    'content4': '6000 mAh Battery',
    'content5': 'Snapdragon 6 Gen 4 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '45W Charger Included',
    'price': '₹16,999',
  },

  {
    'image': 'assets/img/vivo2.png',
    'title': 'OPPO K13 5G (Prism Black, 128GB)',
    'rating': '4.4 2,985 Rating & 241 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) AMOLED Display',
    'content3': '50MP + 2MP | 16MP Front Camera',
    'content4': '7000 mAh Battery',
    'content5': 'Snapdragon 6 Gen 4 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '80W SUPERVOOC Charger Included',
    'price': '₹17,999',
  },

  {
    'image': 'assets/img/vivo2.png',
    'title': 'Motorola G85 5G (Olive Green, 128GB)',
    'rating': '4.3 2,741 Rating & 198 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '16.94 cm (6.67) pOLED Display',
    'content3': '50MP + 8MP | 32MP Front Camera',
    'content4': '5000 mAh Battery',
    'content5': 'Snapdragon 6s Gen 3 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '33W TurboPower Charger Included',
    'price': '₹18,999',
  },

  {
    'image': 'assets/img/vivo1.png',
    'title': 'Nothing Phone (3a) 5G (White, 128GB)',
    'rating': '4.5 3,982 Rating & 315 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '17.13 cm (6.77) AMOLED Display',
    'content3': '50MP + 50MP + 8MP | 32MP Front Camera',
    'content4': '5000 mAh Battery',
    'content5': 'Snapdragon 7s Gen 3 Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '45W Charger Compatible',
    'price': '₹24,999',
  },

  {
    'image': 'assets/img/vivo1.png',
    'title': 'POCO X7 5G (Spectre Black, 256GB)',
    'rating': '4.4 4,215 Rating & 337 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '16.94 cm (6.67) AMOLED Display',
    'content3': '50MP + 8MP + 2MP | 20MP Front Camera',
    'content4': '5500 mAh Battery',
    'content5': 'Dimensity 7300 Ultra 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '45W Fast Charger Included',
    'price': '₹23,999',
  },

  {
    'image': 'assets/img/vivo1.png',
    'title': 'iQOO Z10 5G (Silver, 128GB)',
    'rating': '4.5 4,621 Rating & 384 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '17.22 cm (6.77) AMOLED Display',
    'content3': '50MP OIS Main Camera | 32MP Front Camera',
    'content4': '7300 mAh Battery',
    'content5': 'Snapdragon 7s Gen 3 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '90W FlashCharge Adapter Included',
    'price': '₹21,999',
  },

  {
    'image': 'assets/img/vivo1.png',
    'title': 'HONOR X9c 5G (Titanium Purple, 256GB)',
    'rating': '4.3 2,486 Rating & 197 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '17.20 cm (6.78) AMOLED Display',
    'content3': '108MP + 5MP | 16MP Front Camera',
    'content4': '6600 mAh Battery',
    'content5': 'Snapdragon 6 Gen 1 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger & Protective Case Included',
    'price': '₹21,499',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'Nokia G42 5G (So Grey, 128GB)',
    'rating': '4.1 1,845 Rating & 132 Reviews',
    'content1': '6 GB RAM | 128 GB ROM',
    'content2': '16.56 cm (6.56) HD+ Display',
    'content3': '50MP + 2MP + 2MP | 8MP Front Camera',
    'content4': '5000 mAh Battery',
    'content5': 'Snapdragon 480+ 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Charger & USB Cable Included',
    'price': '₹12,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'ASUS ROG Phone 8 5G (Phantom Black, 256GB)',
    'rating': '4.6 1,924 Rating & 186 Reviews',
    'content1': '16 GB RAM | 256 GB ROM',
    'content2': '17.22 cm (6.78) AMOLED Display',
    'content3': '50MP + 13MP + 32MP | 32MP Front Camera',
    'content4': '5500 mAh Battery',
    'content5': 'Snapdragon 8 Gen 3 Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '65W HyperCharge Adapter Included',
    'price': '₹79,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Sony Xperia 10 VI 5G (Black, 128GB)',
    'rating': '4.2 1,265 Rating & 98 Reviews',
    'content1': '8 GB RAM | 128 GB ROM',
    'content2': '15.49 cm (6.1) OLED Display',
    'content3': '48MP + 8MP Dual Rear Camera | 8MP Front',
    'content4': '5000 mAh Battery',
    'content5': 'Snapdragon 6 Gen 1 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'USB Type-C Cable Included',
    'price': '₹39,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'TECNO POVA 6 Pro 5G (Comet Green, 256GB)',
    'rating': '4.2 2,154 Rating & 167 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '17.22 cm (6.78) AMOLED Display',
    'content3': '108MP + 2MP | 32MP Front Camera',
    'content4': '6000 mAh Battery',
    'content5': 'Dimensity 6080 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '70W Ultra Charge Adapter Included',
    'price': '₹19,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Infinix Note 40 Pro 5G (Titan Gold, 256GB)',
    'rating': '4.3 2,876 Rating & 221 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '17.22 cm (6.78) AMOLED Display',
    'content3': '108MP OIS + 2MP + 2MP | 32MP Front Camera',
    'content4': '5000 mAh Battery',
    'content5': 'Dimensity 7020 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '45W Fast Charger Included',
    'price': '₹19,499',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Lenovo Legion Phone Duel (Vengeance Red, 256GB)',
    'rating': '4.4 1,421 Rating & 115 Reviews',
    'content1': '12 GB RAM | 256 GB ROM',
    'content2': '16.74 cm (6.59) AMOLED Display',
    'content3': '64MP + 16MP | 20MP Pop-up Front Camera',
    'content4': '5000 mAh Dual Battery',
    'content5': 'Snapdragon 865+ Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '65W Fast Charging Adapter Included',
    'price': '₹39,999',
  },

  {
    'image': 'assets/img/vivo5.png',
    'title': 'ZTE Nubia Neo 2 5G (Storm Gray, 256GB)',
    'rating': '4.2 1,876 Rating & 143 Reviews',
    'content1': '8 GB RAM | 256 GB ROM',
    'content2': '16.94 cm (6.72) FHD+ Display',
    'content3': '50MP + 2MP | 16MP Front Camera',
    'content4': '5200 mAh Battery',
    'content5': 'Unisoc T820 5G Processor',
    'content6': '1 Year Warranty on the Handset',
    'content7': '33W Fast Charger Included',
    'price': '₹16,999',
  },

  {
    'image': 'assets/img/vivo4.png',
    'title': 'Ulefone Armor 24 5G (Black, 256GB)',
    'rating': '4.1 946 Rating & 72 Reviews',
    'content1': '12 GB RAM | 256 GB ROM',
    'content2': '16.76 cm (6.6) FHD+ Display',
    'content3': '64MP + 64MP Dual Rear Camera | 16MP Front',
    'content4': '22000 mAh Large Battery',
    'content5': 'MediaTek Dimensity 6100+ 5G',
    'content6': '1 Year Warranty on the Handset',
    'content7': 'Heavy-Duty Case & Charger Included',
    'price': '₹29,999',
  },
]; // =========================================================
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
        title: const Text('Samsung Galaxy S24'),
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
                  hintText: 'Search Samsung products',
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
              // SAMSUNG PRODUCTS
              // =================================================

              Column(
                children: samsungProducts.map((product) {
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

                        Text(
                          '• ${product['content2']}',
                        ),

                        Text(
                          '• ${product['content3']}',
                        ),

                        Text(
                          '• ${product['content4']}',
                        ),

                        Text(
                          '• ${product['content5']}',
                        ),

                        Text(
                          '• ${product['content6']}',
                        ),

                        Text(
                          '• ${product['content7']}',
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
                        // BUY BUTTON
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