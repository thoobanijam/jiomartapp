import 'package:flutter/material.dart';
import '../cart_service.dart';
import '../footer.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),

      body: AnimatedBuilder(
        animation: CartService.instance,
        builder: (context, child) {
          final cart =
              CartService.instance;

          if (cart.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'No orders yet',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding:
                      const EdgeInsets.all(15),
                  itemCount: cart.items.length,
                  itemBuilder:
                      (context, index) {
                    final item =
                        cart.items[index];

                    return Card(
                      margin:
                          const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(
                          12,
                        ),

                        leading: Image.asset(
                          item.image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),

                        title: Text(
                          item.title,
                          maxLines: 2,
                          overflow:
                              TextOverflow.ellipsis,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        subtitle: Padding(
                          padding:
                              const EdgeInsets.only(
                            top: 8,
                          ),
                          child: Text(
                            'Quantity: ${item.quantity}\n'
                            'Price: ${item.price}\n'
                            'Total: ₹${item.totalPrice.toStringAsFixed(0)}',
                          ),
                        ),

                        trailing:
                            const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
  ],
          );
        },
      ),

      bottomNavigationBar:
          const AppFooter(
        currentIndex: 2,
      ),
    );
  }
}