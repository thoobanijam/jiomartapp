import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  'Special Offer 🎁',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Get amazing discounts on your daily needs.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 15),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Shop Now',
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.local_offer,
            size: 70,
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}