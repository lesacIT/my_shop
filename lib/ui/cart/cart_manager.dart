import 'package:flutter/material.dart';
import 'package:myshop/models/auth_token.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/services/cart_service.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {
    // 'p1': CartItem(
    //   id: 'c1',
    //   title: 'Red Shirt',
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //   price: 29.99,
    //   quantity: 2,
    // ),
    //  'p2': CartItem(
    //   id: 'c1',
    //   title: 'Red Shirt',
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //   price: 29.99,
    //   quantity: 2,
    // ),
  };

  final CartService _cartService;
  CartManager([AuthToken? authToken]) : _cartService = CartService(authToken);

  set authToken(AuthToken? authToken) {
    _cartService.authToken = authToken;
  }

  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // void addItem(Product product) {
  //   if (_items.containsKey(product.id)) {
  //     _items.update(
  //         product.id!,
  //         (existingxCart) => existingxCart.copyWith(
  //               quantity: existingxCart.quantity + 1,
  //             ));
  //   } else {
  //     _items.putIfAbsent(
  //       product.id!,
  //       () => CartItem(
  //         id: 'c${DateTime.now().toIso8601String()}',
  //         title: product.title,
  //         imageUrl: product.imageUrl,
  //         price: product.price,
  //         quantity: 1,
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }

  // void clearItem(String productId) {
  //   _items.remove(productId);
  //   notifyListeners();
  // }

  // void updateQuantityItem(Product product, int quantity) async {

  //   if (_items.containsKey(product.id)) {
  //     _items.update(
  //         product.id!,
  //         (existingxCart) => existingxCart.copyWith(
  //               quantity: existingxCart.quantity + quantity,
  //             ));
  //   } else {
  //     _items.putIfAbsent(
  //       product.id!,
  //       () => CartItem(
  //         id: 'c${DateTime.now().toIso8601String()}',
  //         title: product.title,
  //         imageUrl: product.imageUrl,
  //         price: product.price,
  //         quantity: quantity,
  //       ),
  //     );
  //   }
  //   notifyListeners();
  // }

  Future<void> removeItem(String productId) async {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      await _cartService.updateItemCart(
          productId, _items[productId]!.quantity - 1);
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      await _cartService.deleleItemCart(productId);
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clearAllItems() {
    _cartService.deleteAllItem();
    _items = {};
    notifyListeners();
  }

  Future<void> clearItem(String productId) async {
    await _cartService.deleleItemCart(productId);
    _items.remove(productId);
    notifyListeners();
  }

  Future<void> fetchCart() async {
    _items = await _cartService.fetchCart();

    notifyListeners();
  }

  Future<void> addItem(CartItem product) async {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id!,
          (existingxCart) => existingxCart.copyWith(
                quantity: existingxCart.quantity + 1,
              ));
      await _cartService.addCartItem(_items);
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: 1,
        ),
      );
      await _cartService.addCartItem(_items);
    }
    notifyListeners();
  }

  Future<void> updateQuantityItem(Product product, int quantity) async {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id!,
          (existingxCart) => existingxCart.copyWith(
                quantity: existingxCart.quantity + quantity,
              ));
      await _cartService.addCartItem(_items);
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: quantity,
        ),
      );
      await _cartService.addCartItem(_items);
    }
    notifyListeners();
  }
}
