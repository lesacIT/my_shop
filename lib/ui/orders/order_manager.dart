import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/auth_token.dart';
import '../../models/cart_item.dart';
import '../../models/order_item.dart';
import '../../services/orders_service.dart';

class OrdersManager with ChangeNotifier {
  // final List<OrderItem> _orders = [
  //   OrderItem(
  //     id: 'o1',
  //     amount: 59.98,
  //     products: [
  //       CartItem(
  //         id: 'c1',
  //         title: 'Red Shirt',
  //         imageUrl:
  //             'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  //         price: 29.99,
  //         quantity: 2,
  //       )
  //     ],
  //     dateTime: DateTime.now(),
  //   )
  // ];
  Map<String, OrderItem> _orders = {};

  final OrdersService _ordersService;

  OrdersManager([AuthToken? authToken])
      : _ordersService = OrdersService(authToken);

  set authToken(AuthToken? authToken) {
    _ordersService.authToken = authToken;
  }

  Future<void> fetchOrders() async {
    _orders = await _ordersService.fetchOrders();
    notifyListeners();
  }

  int get orderCount {
    return _orders.length;
  }

  // void addOrder(List<CartItem> cartProduct, double total) async {
  //   _orders.insert(
  //     0,
  //     OrderItem(
  //       id: 'o${DateTime.now().toIso8601String()}',
  //       amount: total,
  //       products: cartProduct,
  //       dateTime: DateTime.now(),
  //     ),
  //   );
  //   notifyListeners();
  // }
  List<OrderItem> get orders {
    final List<OrderItem> orderTemp = _orders.values.toList();
    orderTemp.sort((a, b) {
      return a.dateTime.isAfter(b.dateTime) ? -1 : 1;
    });
    return orderTemp;
  }

  Future<void> addOrder(List<CartItem> products, double total) async {
    final String id =
        'o${DateFormat('yyyyMMddHHmmss').format(DateTime.now()).toString()}';
    final newOrder = OrderItem(
        id: id, amount: total, products: products, dateTime: DateTime.now());
    await _ordersService.addOrder(newOrder);
  }
}
