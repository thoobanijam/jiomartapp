import 'package:flutter/material.dart';
import 'KitchenDiningPage.dart';
import 'SamsungS24Page.dart';
import 'BoatHeadphonesPage.dart';
import 'LGMicrowavePage.dart';

class Itemsmap extends StatelessWidget {
  const Itemsmap({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> products = [
      {
        'title': 'Kitchen & Dining',
        'image': 'assets/img/kitchen&dinning.avif',
        'price': 'From ₹ 1,499',
        'page': const KitchenDiningPage(),
      },
      {
        'title': 'Samsung Galaxy S24',
        'image': 'assets/img/th.webp',
        'price': 'From ₹ 10,499',
        'page': const SamsungS24Page(),
      },
      {
        'title': 'Boat Headphones',
        'image': 'assets/img/OIP.webp',
        'price': 'From ₹ 2,490',
        'page': const BoatHeadphonesPage(),
      },
      {
        'title': 'LG Microwave Oven',
        'image': 'assets/img/DZ-11.avif',
        'price': 'From ₹ 31,999',
        'page': const LGMicrowavePage(),
      },
    ];

    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: products.length,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (context, index) {
          final product = products[index];

          return SizedBox(
            width: 185,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => product['page'],
                  ),
                );
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.deepOrange,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),

                      // TITLE
                      Text(
                        product['title'],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // IMAGE
                      Image.asset(
                        product['image'],
                        height: 120,
                        width: 120,
                        fit: BoxFit.contain,
                      ),

                      const Spacer(),

                      // PRICE
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          product['price'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}