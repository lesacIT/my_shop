import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myshop/models/order_item.dart';

import '../models/auth_token.dart';
// import '../models/product.dart';
import 'firebase_service.dart';

class OrdersService extends FirebaseService {
  OrdersService([AuthToken? authToken]) : super(authToken);

  Future<Map<String, OrderItem>> fetchOrders() async {
    final Map<String, OrderItem> orders = {};

    // try {
    final ordersUrl = Uri.parse('$databaseUrl/orders/$userId.json?auth=$token');
    final response = await http.get(ordersUrl);
    final ordersMap = json.decode(response.body) as Map<String, dynamic>;
    if (response.statusCode != 200) {
      return orders;
    }

    ordersMap.forEach((orderId, order) {
      orders.putIfAbsent(orderId, () => OrderItem.fromJson(order));
    });
    return orders;
    // } catch (e) {
    //   print(e);
    //   return orders;
    // }
  }

  Future<void> addOrder(OrderItem orderItem) async {
    try {
      final url = Uri.parse(
          '$databaseUrl/orders/$userId/${orderItem.id!}.json?auth=$token');
      final response = await http.put(
        url,
        body: json.encode(orderItem.toJson()),
      );
      if (response.statusCode != 200) {
        print(response.body);
        throw Exception(json.decode(response.body)['error']);
      }
    } catch (err) {
      print(err);
      rethrow;
    }
  }
}
