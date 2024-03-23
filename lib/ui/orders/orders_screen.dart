import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';
import 'order_item_card.dart';
import 'order_manager.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersManager = context.watch<OrdersManager>();
    ordersManager.fetchOrders();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      // Thêm Drawer
      drawer: const AppDrawer(),
      body: Consumer<OrdersManager>(
        builder: (ctx, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
          );
        },
      ),
    );
  }
}
