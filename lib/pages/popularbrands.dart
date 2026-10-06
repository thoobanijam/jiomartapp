import 'package:flutter/material.dart';

class PopularBrands extends StatelessWidget {
  const PopularBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      'Jio',
      'Samsung',
      'LG',
      'Boat',
      'Vivo',
      'Oppo',
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
            'Popular Brands',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              return Container(
                width: 110,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Text(
                  brands[index],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}