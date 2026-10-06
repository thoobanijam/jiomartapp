
import 'package:flutter/material.dart';
import 'grocery.dart';
import 'vegetables.dart';
import 'fruits.dart';
import 'milk_diary.dart';
import 'snacks.dart';
import 'beverage.dart';

class PopularNeedu extends StatefulWidget {
  const PopularNeedu({super.key});

  @override
  State<PopularNeedu> createState() => _PopularNeeduState();
}

class _PopularNeeduState extends State<PopularNeedu> {
  // Popular needs data
  final List<Map<String, dynamic>> popularNeeds = [
    {
      'name': 'Groceries',
      'image': 'assets/img/grocery.jpeg',
      'icon': Icons.shopping_basket,
      'page': const Grocery(),
     
    },
    {
      'name': 'Vegetables',
      'image': 'assets/img/veg.webp',
      'icon': Icons.eco,
       'page': const Vegetables(),
    },
    {
      'name': 'Fruits',
      'image': 'assets/img/fruits.webp',
      'icon': Icons.apple,
      'page': const Fruits(),
    },
    {
      'name': 'Milk & Dairy',
      'image': 'assets/img/milk&diary.webp',
      'icon': Icons.local_drink,
      'page': const MilkDiary(),
    },
    {
      'name': 'Snacks',
      'image': 'assets/img/snacks.webp',
      'icon': Icons.fastfood,
      'page': const Snacks(),
    },
    {
      'name': 'Beverages',
      'image': 'assets/img/beverages.webp',
      'icon': Icons.local_cafe,
      'page': const Beverage(),
    },
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular Near You',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularNeeds.length,
              itemBuilder: (context, index) {
                final item = popularNeeds[index];

                return GestureDetector(
               onTap: () {
  setState(() {
    selectedIndex = index;
  });

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => item['page'],
    ),
  );
},
  child: Container(
                    width: 130,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Colors.orange.shade100
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.orange
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          child: Icon(
                            item['icon'],
                            size: 40,
                            color: Colors.orange,
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          item['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 25),

          // Selected item
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 30,
                ),

                const SizedBox(width: 15),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'You selected',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      popularNeeds[selectedIndex]['name'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

