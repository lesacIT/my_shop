import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/cart_item.dart';

class OrderDetailsItemCard extends StatelessWidget {
  final CartItem cardItem;

  const OrderDetailsItemCard({
    required this.cardItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return buildOrderDetailItemCard(context);
  }

  Widget buildOrderDetailItemCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: FittedBox(
                child: Image.network(cardItem.imageUrl),
              ),
            ),
          ),
          title: Text(cardItem.title),
          subtitle: Text(
            'Đơn giá: ${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(cardItem.price)}',
          ),
          trailing: Text(
            'x ${cardItem.quantity}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  String formatNumber(double number) {
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
