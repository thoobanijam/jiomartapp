import 'package:flutter/material.dart';

class CouponOffers extends StatelessWidget {
  const CouponOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final coupons = [
      {
        'title': '₹100 OFF',
        'subtitle': 'On orders above ₹999',
        'code': 'JIO100',
      },
      {
        'title': '₹200 OFF',
        'subtitle': 'On orders above ₹1499',
        'code': 'JIO200',
      },
      {
        'title': '20% OFF',
        'subtitle': 'On selected products',
        'code': 'SAVE20',
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
            'Coupon Offers 🎟️',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            itemCount: coupons.length,
            itemBuilder: (context, index) {
              final coupon = coupons[index];

              return Container(
                width: 250,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.orange,
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      coupon['title']!,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      coupon['subtitle']!,
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          coupon['code']!,
                          style: const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Apply',
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