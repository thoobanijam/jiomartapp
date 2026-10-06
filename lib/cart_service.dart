import 'package:flutter/material.dart';

class CartItem {
  final String image;
  final String title;
  final String price;
  int quantity;

  CartItem({
    required this.image,
    required this.title,
    required this.price,
    this.quantity = 1,
  });

  double get priceValue {
    String cleaned = price
        .replaceAll('₹', '')
        .replaceAll(',', '')
        .trim();

    return double.tryParse(cleaned) ?? 0;
  }

  double get totalPrice => priceValue * quantity;
}

class CartService extends ChangeNotifier {
  CartService._privateConstructor();

  static final CartService instance =
      CartService._privateConstructor();

  // CART ITEMS
  final List<CartItem> _items = [];

  List<CartItem> get items =>
      List.unmodifiable(_items);

  // ORDER ITEMS
  final List<CartItem> _orders = [];

  List<CartItem> get orders =>
      List.unmodifiable(_orders);

  // CART COUNT
  int get itemCount =>
      _items.fold(
        0,
        (total, item) => total + item.quantity,
      );

  // CART SUBTOTAL
  double get subtotal =>
      _items.fold(
        0,
        (total, item) => total + item.totalPrice,
      );

  // DELIVERY
  double get deliveryCharge {
    if (_items.isEmpty) {
      return 0;
    }

    if (subtotal >= 500) {
      return 0;
    }

    return 40;
  }

  // CART TOTAL
  double get total =>
      subtotal + deliveryCharge;

  // ADD TO CART
  void addToCart(
    Map<String, dynamic> product,
  ) {
    final String title =
        product['title'] ?? '';

    final String image =
        product['image'] ?? '';

    final String price =
        product['price'] ?? '₹0';

    final existingIndex =
        _items.indexWhere(
      (item) => item.title == title,
    );

    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartItem(
          image: image,
          title: title,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  // BUY NOW / PLACE ORDER
  void placeOrder(
    Map<String, dynamic> product,
  ) {
    final String title =
        product['title'] ?? '';

    final String image =
        product['image'] ?? '';

    final String price =
        product['price'] ?? '₹0';

    final existingIndex =
        _orders.indexWhere(
      (item) => item.title == title,
    );

    if (existingIndex != -1) {
      _orders[existingIndex].quantity++;
    } else {
      _orders.add(
        CartItem(
          image: image,
          title: title,
          price: price,
        ),
      );
    }

    notifyListeners();
  }

  // INCREASE CART QUANTITY
  void increaseQuantity(int index) {
    _items[index].quantity++;
    notifyListeners();
  }

  // DECREASE CART QUANTITY
  void decreaseQuantity(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }

    notifyListeners();
  }

  // REMOVE CART ITEM
  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  // CLEAR CART
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}