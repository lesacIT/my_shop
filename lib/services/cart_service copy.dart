import 'dart:convert';

import '../models/auth_token.dart';
import '../models/cart_item.dart';
import 'firebase_service.dart';

class CartService extends FirebaseService {
  CartService([AuthToken? authToken]) : super(authToken);

  Future<List<CartItem>> fetchCartItems(String userId) async {
    final List<CartItem> cartItems = [];

    try {
      final cartItemsMap = await httpFetch(
        '$databaseUrl/cartItems.json?auth=$token&orderBy="userId"&equalTo="$userId"',
      ) as Map<String, dynamic>?;

      if (cartItemsMap != null) {
        cartItemsMap.forEach((cartItemId, cartItem) {
          cartItems.add(
            CartItem.fromJson({
              'id': cartItemId,
              ...cartItem,
            }),
          );
        });
      }
      return cartItems;
    } catch (error) {
      print(error);
      return cartItems;
    }
  }

  Future<void> addCartItem(CartItem cartItem) async {
    try {
      await httpFetch(
        '$databaseUrl/cartItems.json?auth=$token',
        method: HttpMethod.put,
        body: jsonEncode(
          cartItem.toJson(),
        ),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateCartItem(CartItem cartItem) async {
    try {
      await httpFetch(
        '$databaseUrl/cartItems/${cartItem.id}.json?auth=$token',
        method: HttpMethod.patch,
        body: jsonEncode(cartItem.toJson()),
      );
    } catch (error) {
      print(error);
    }
  }

  Future<void> deleteCartItem(String id) async {
    try {
      await httpFetch(
        '$databaseUrl/cartItems/$id.json?auth=$token',
        method: HttpMethod.delete,
      );
    } catch (error) {
      print(error);
    }
  }
}
