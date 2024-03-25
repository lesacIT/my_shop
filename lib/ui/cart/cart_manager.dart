import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth_token.dart';
import '../../models/cart_item.dart';
import '../../models/product.dart';
import '../../services/cart_service.dart';

class CartManager extends ChangeNotifier {
  // Map<String, CartItem> _items = {
  //   'p1': CartItem(
  //     id: 'c1',
  //     title: 'Red Shirt',
  //     imageUrl:
  //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  //     price: 29.99,
  //     quantity: 2,
  //   ),
  // };
  CartManager([AuthToken? authToken]) : _cartService = CartService(authToken);
  static const String _cartKey = 'cart';
  Map<String, CartItem> _items = {};
  final CartService _cartService;

  Future<void> getCartFromSharePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_cartKey)) {
      final stringList = prefs.getStringList(_cartKey);
      for (var element in stringList!) {
        final item = CartItem.fromJson(json.decode(element));
        _items.putIfAbsent(item.id, () => item);
      }
    }
    notifyListeners();
  }

  Future<void> fetchCartItems(String userId) async {
    _items = Map.fromIterable(
      await _cartService.fetchCartItems(userId),
      key: (item) => item.id,
      value: (item) => item,
    );
    notifyListeners();
  }

  Future<void> addCartItem(CartItem cartItem) async {
    try {
      // Gửi yêu cầu HTTP để thêm sản phẩm vào cơ sở dữ liệu
      await _cartService.addCartItem(cartItem);

      // Nếu sản phẩm đã tồn tại trong giỏ hàng, cộng dồn số lượng lên 1 đơn vị
      if (_items.containsKey(cartItem.id)) {
        _items.update(
          cartItem.id,
          (existingCartItem) => existingCartItem.copyWith(
            quantity: existingCartItem.quantity + cartItem.quantity,
          ),
        );
      } else {
        // Nếu sản phẩm chưa tồn tại trong giỏ hàng, thêm sản phẩm vào giỏ hàng
        _items[cartItem.id] = cartItem;
      }

      // Thông báo cho người nghe biết rằng giỏ hàng đã được cập nhật
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    await _cartService.updateCartItem(cartItem);
    _items.update(
      cartItem.id,
      (existingCartItem) => cartItem,
    );
    notifyListeners();
  }

  void clearAllItems() {
    _items = {};
    notifyListeners();
  }

  Future<void> deleteCartItem(String id) async {
    await _cartService.deleteCartItem(id);
    _items.remove(id);
    notifyListeners();
  }

  Future<void> saveCartToSharePreferences() async {
    final prefs = await SharedPreferences.getInstance();

    if (productCount < 1) {
      if (prefs.containsKey(_cartKey)) {
        prefs.remove(_cartKey);
      }
    }
    final List<String> stringList = [];
    _items.forEach((key, element) {
      stringList.add(json.encode(element.toJson()));
    });
    prefs.setStringList(_cartKey, stringList);
    notifyListeners();
  }

  int get productCount {
    return _items.length;
  }

  Map<String, CartItem> get products {
    return _items;
  }

  List<CartItem> get productsList {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

//   double get totalAmount {
//   double total = 0;
//   _items.forEach((index, product) {
//     total += product.price * product.quantity;
//   });
//   return total;
// }

  bool isProductExist() {
    return false;
  }

  void addItem(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + quantity,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: product.id!, // Sử dụng id của sản phẩm khi thêm sản phẩm mới
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: quantity,
        ),
      );
    }
    saveCartToSharePreferences();
  }

  void addByProductId(List<String> productIds) async {
    for (String productId in productIds) {
      final productData = await getProductById(productId);
      if (productData != null) {
        final CartItem cartItem = CartItem(
          id: productData['id'],
          title: productData['title'],
          imageUrl: productData['imageUrl'],
          price: productData['price'],
          quantity:
              1, // Khởi tạo số lượng là 1 khi thêm mới một mặt hàng vào giỏ hàng
        );
        if (_items.containsKey(productId)) {
          _items.update(
            productId,
            (existCartItem) =>
                existCartItem.copyWith(quantity: existCartItem.quantity + 1),
          );
        } else {
          _items[productId] = cartItem;
        }
      } else {
        // Xử lý trường hợp không tìm thấy sản phẩm với ID đã cho (nếu cần)
      }
    }
    saveCartToSharePreferences();
  }

  Future<Map<String, dynamic>?> getProductById(String productId) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_cartKey)) {
      final stringList = prefs.getStringList(_cartKey);
      if (stringList != null) {
        for (var element in stringList) {
          final cartItem = CartItem.fromJson(json.decode(element));
          if (cartItem.id == productId) {
            return {
              'id': cartItem.id,
              'title': cartItem.title,
              'imageUrl': cartItem.imageUrl,
              'price': cartItem.price,
            };
          }
        }
      }
    }
    return null;
  }

  void removeItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }
    saveCartToSharePreferences();
  }

  void clearItem(String productId) {
    _items.remove(productId);
    saveCartToSharePreferences();
  }

  void clearCart() {
    _items.clear();
    saveCartToSharePreferences();
  }
  // int get productCount {
  //   return _items.length;
  // }

  // List<CartItem> get products {
  //   return _items.values.toList();
  // }

  // Iterable<MapEntry<String, CartItem>> get productEntries {
  //   return {..._items}.entries;
  // }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }
}
