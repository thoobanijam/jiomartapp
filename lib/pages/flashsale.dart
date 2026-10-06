import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'name': 'Fresh Apples',
        'price': '₹149',
        'oldPrice': '₹199',
        'image': 'assets/img/apple.webp',
      },
      {
        'name': 'Fresh Bananas',
        'price': '₹79',
        'oldPrice': '₹99',
        'image': 'assets/img/banana.webp',
      },
      {
        'name': 'Fresh Cherries',
        'price': '₹249',
        'oldPrice': '₹299',
        'image': 'assets/img/cherry.jpeg',
      },
      {
        'name': 'Dragon Fruit',
        'price': '₹199',
        'oldPrice': '₹249',
        'image': 'assets/img/dragon.webp',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            '🔥 Flash Sale',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Container(
                width: 170,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        product['image']!,
                        width: double.infinity,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons
                                  .image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      product['name']!,
                      maxLines: 1,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          product['price']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                            color:
                                Colors.deepOrange,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          product['oldPrice']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration:
                                TextDecoration
                                    .lineThrough,
                          ),
                        ),
                      ],
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