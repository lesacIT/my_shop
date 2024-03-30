import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order_item.dart';
import '/models/cart_item.dart';
import 'order_detail_item_card.dart';
import 'order_details_manager.dart';

class OrderDetailsScreen extends StatelessWidget {
  static String routeName = '/OrderDetailsScreen';

  final orderItem;

  const OrderDetailsScreen(OrderItem orderItemIn, {super.key})
      : orderItem = orderItemIn;

  @override
  Widget build(BuildContext context) {
    final order = OrderDetailsManager().itemOrder;
    final orderManager = OrderDetailsManager();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "CHI TIẾT ĐƠN HÀNG",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: true,
        foregroundColor: Color(0xFF820233),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildOrderDetails(order),
          ),
          buildDetais(orderManager, context),
        ],
      ),
    );
  }

  Widget buildOrderDetails(List<CartItem> order) {
    return ListView.builder(
      itemCount: orderItem.productCount,
      itemBuilder: (context, i) =>
          OrderDetailsItemCard(cardItem: orderItem.products[i]),
    );
  }

  Widget buildDetais(OrderDetailsManager order, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Đã thanh toán',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Chip(
              label: Text(
                "${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(orderItem.totalPrice)}",
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                  fontSize: 13,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  String formatNumber(int number) {
    String formattedNumber =
        number.toString(); // Giữ lại 3 chữ số sau dấu thập phân
    formattedNumber = formattedNumber.replaceAllMapped(
        RegExp(
            r'(\d{1,3})(?=(\d{3})+(?!\d))'), // Tìm mỗi chuỗi 3 chữ số không có chữ số nào theo sau
        (Match match) =>
            '${match[1]},'); // Thêm dấu chấm sau mỗi chuỗi 3 chữ số
    return formattedNumber;
  }
}
