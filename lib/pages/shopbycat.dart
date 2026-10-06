import 'package:flutter/material.dart';

import 'vegetables.dart';
import 'fruits.dart';
import 'milk_diary.dart';
import 'snacks.dart';
import 'beverage.dart';

class ShopByCategory extends StatelessWidget {
  const ShopByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'Vegetables',
        'icon': Icons.eco,
        'page': const Vegetables(),
      },
      {
        'name': 'Fruits',
        'icon': Icons.apple,
        'page': const Fruits(),
      },
      {
        'name': 'Milk & Dairy',
        'icon': Icons.local_drink,
        'page': const MilkDiary(),
      },
      {
        'name': 'Snacks',
        'icon': Icons.fastfood,
        'page': const Snacks(),
      },
      {
        'name': 'Beverages',
        'icon': Icons.local_cafe,
        'page': const Beverage(),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Shop By Category',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 15),

        // Each container one by one
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        category['page'] as Widget,
                  ),
                );
              },

              child: Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    const SizedBox(width: 20),

                    // Icon
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Icon(
                        category['icon'] as IconData,
                        size: 35,
                        color: Colors.deepOrange,
                      ),
                    ),

                    const SizedBox(width: 20),

                    // Category name
                    Expanded(
                      child: Text(
                        category['name'] as String,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Arrow
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}