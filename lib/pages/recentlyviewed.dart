import 'package:flutter/material.dart';

class RecentlyViewed extends StatelessWidget {
  const RecentlyViewed({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Apple',
        'image': 'assets/img/apple.webp',
        'price': '₹149',
      },
      {
        'name': 'Banana',
        'image': 'assets/img/banana.webp',
        'price': '₹79',
      },
      {
        'name': 'Cherry',
        'image': 'assets/img/cherry.jpeg',
        'price': '₹249',
      },
      {
        'name': 'Dragon Fruit',
        'image': 'assets/img/dragon.webp',
        'price': '₹199',
      },
    ];

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Recently Viewed 👀',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Container(
                width: 150,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Text(
                      product['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      product['price']!,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}