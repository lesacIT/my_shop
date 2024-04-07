import 'dart:convert';

import 'package:myshop/models/auth_token.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:myshop/services/firebase_service.dart';

class CartService extends FirebaseService {
  CartService([AuthToken? authToken]) : super(authToken);

  Future<Map<String, CartItem>> fetchCart({bool filterByUser = false}) async {
    final Map<String, CartItem> cart = {};

    try {
      final cartMap = await httpFetch(
        '$databaseUrl/userCart/$userId.json?auth=$token',
      ) as Map<String, dynamic>?;

      if (cartMap != null) {
        cartMap?.forEach((productId, product) {
          cart[productId] = CartItem.fromJson(product);
        });
      }

      return cart;
    } catch (error) {
      print(error);
      return cart;
    }
  }

  Future<void> addCartItem(Map<String, CartItem> item) async {
    try {
      await httpFetch(
        '$databaseUrl/userCart/$userId.json?auth=$token',
        method: HttpMethod.put,
        body: jsonEncode(
          item.map(
            (key, value) => MapEntry(
              key,
              value.toJson(),
            ),
          ),
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleleItemCart(String id) async {
    try {
      await httpFetch('$databaseUrl/userCart/$userId/$id.json?auth=$token',
          method: HttpMethod.delete);
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteAllItem() async {
    try {
      await httpFetch('$databaseUrl/userCart/$userId.json?auth=$token',
          method: HttpMethod.delete);
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateItemCart(String id, quantity) async {
    try {
      await httpFetch(
        '$databaseUrl/userCart/$userId/$id.json?auth=$token',
        method: HttpMethod.patch,
        body: jsonEncode({'quantity': quantity}),
      );
    } catch (error) {
      print(error);
    }
  }
}
