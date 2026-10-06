import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jiomart_application_1/pages/deliverybanner.dart';
import 'package:jiomart_application_1/pages/flashsale.dart';
import 'package:jiomart_application_1/pages/popularbrands.dart';
import 'package:jiomart_application_1/pages/popularneedu.dart';
import 'package:jiomart_application_1/pages/shopbycat.dart';

import 'login_page.dart';
import 'itemsmap.dart';
import '../footer.dart';
import 'KitchenDiningPage.dart';
import 'SamsungS24Page.dart';
import 'BoatHeadphonesPage.dart';
import 'LGMicrowavePage.dart';
import 'slider_dashboard.dart';
import 'slider_dashboard_one.dart';
import 'popularneedu.dart';
import 'shopbycat.dart';
import 'flashsale.dart';
import 'specialoffers.dart';
import 'popularbrands.dart';
import 'recentlyviewed.dart';
import 'deliverybanner.dart';
import 'couponoffers.dart';

class JioMartDashboard extends StatefulWidget {
  const JioMartDashboard({super.key});

  @override
  State<JioMartDashboard> createState() => _JioMartDashboardState();
}

class _JioMartDashboardState extends State<JioMartDashboard>
    with SingleTickerProviderStateMixin {

  // Selected category
  int selectedIndex = 0;

  // Animation
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
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
  
  

  // Logout
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();

    // Animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Scale animation
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('JioMart'),
        backgroundColor: const Color.fromARGB(255, 242, 190, 174),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),

     body: Container(
  width: double.infinity,
  height: double.infinity,
  color: const Color.fromARGB(255, 242, 190, 174),

  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // ================= SEARCH =================
        Container(
          margin: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for 'daily needs'",
              fillColor:
                  const Color.fromARGB(255, 253, 231, 238),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),

        // ================= CATEGORIES =================
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // SMART BUYS
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const KitchenDiningPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == 0
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Smart Buys',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // HOT DEALS
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const KitchenDiningPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == 1
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Hot Deals',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // MOBILES
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SamsungS24Page(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == 2
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mobiles',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ELECTRONICS
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BoatHeadphonesPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == 3
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.headphones,
                        size: 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Electronics',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // APPLIANCES
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 4;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const LGMicrowavePage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 8,
                    left: 8,
                    right: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: selectedIndex == 4
                            ? Colors.black
                            : Colors.transparent,
                        width: 4,
                      ),
                    ),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.microwave,
                        size: 20,
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Appliances',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // ================= ITEMS =================

        const SizedBox(height: 10),

        Itemsmap(),

        const SizedBox(height: 30),

        // ================= SLIDER 1 =================

        SizedBox(
          width: double.infinity,
          child: SliderDashboard(),
        ),

        // ================= SPACE =================

        const SizedBox(height: 50),

        //======================popular==============
       

        PopularNeedu(),

        const SizedBox(height: 30),

        // ================= SLIDER 2 =================

        SizedBox(
          width: double.infinity,
          child: SliderDashboardOne(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),
       SizedBox(
          width: double.infinity,
          child: ShopByCategory(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),
         SizedBox(
          width: double.infinity,
          child: FlashSale(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),

         SizedBox(
          width: double.infinity,
          child: SpecialOffers(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),
      
      SizedBox(
          width: double.infinity,
          child: PopularBrands(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),

         SizedBox(
          width: double.infinity,
          child: RecentlyViewed(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),

      SizedBox(
          width: double.infinity,
          child: DeliveryBanner(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),

      SizedBox(
          width: double.infinity,
          child: CouponOffers(),
        ),

        // Extra bottom space
        const SizedBox(height: 50),
        
      ],
    ),
  ),
), bottomNavigationBar:
          const AppFooter(
        currentIndex: 0,
      ),
    );
    
     
  }
}