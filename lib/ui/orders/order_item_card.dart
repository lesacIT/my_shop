import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/order_item.dart';
import '../../ui/screens.dart';
// class OrderItemCard extends StatefulWidget {
//   final OrderItem order;

//   const OrderItemCard(this.order, {super.key});

//   @override
//   State<OrderItemCard> createState() => _OrderItemCardState();
// }

// class _OrderItemCardState extends State<OrderItemCard> {
//   var _expanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10),
//       child: Column(
//         children: <Widget>[
//           OrderSummary(
//             expanded: _expanded,
//             order: widget.order,
//             onExpandPressed: () {
//               setState(() {
//                 _expanded = !_expanded;
//               });
//             },
//           ),
//           if (_expanded) OrderItemList(widget.order)
//         ],
//       ),
//     );
//   }
// }

// class OrderItemList extends StatelessWidget {
//   const OrderItemList(this.order, {super.key});

//   final OrderItem order;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
//       height: min(order.productCount * 20.0 + 10, 100),
//       child: ListView(
//         children: order.products
//             .map(
//               (prod) => Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     prod.title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${prod.quantity}x \$${prod.price}',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.grey,
//                     ),
//                   )
//                 ],
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// class OrderSummary extends StatelessWidget {
//   const OrderSummary({
//     super.key,
//     required this.order,
//     required this.expanded,
//     this.onExpandPressed,
//   });

//   final bool expanded;
//   final OrderItem order;
//   final void Function()? onExpandPressed;

//   @override
//   Widget build(BuildContext context) {
//     DateTime dateTime = DateTime.parse(OrderItem.dateTime);
//     return ListTile(
//       titleTextStyle: Theme.of(context).textTheme.titleLarge,
//       title: Text('\$${OrderItem.dateTime}'),
//       subtitle: Text(
//         DateFormat('dd/MM/yyyy hh:mm').format(OrderItem.dateTime),
//       ),
//       trailing: IconButton(
//         icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
//         onPressed: onExpandPressed,
//       ),
//       onTap: () {
//         Navigator.of(context)
//             .pushNamed(OrdersScreen.routeName, arguments: OrderItem);
//       },
//     );
//   }
// }

class OrderItemCard extends StatelessWidget {
  final OrderItem orderItem;

  const OrderItemCard(this.orderItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(15), child: buildOrderSummary(context));
  }

  Widget buildOrderSummary(BuildContext context) {
    return ListTile(
      title: Text('Số lượng: ${orderItem.numOfProducts}'),
      subtitle: Text(
        DateFormat('dd/MM/yyyy hh:mm').format(orderItem.dateTime),
      ),
      trailing: Text('Tổng tiền: ${formatNumber(orderItem.totalPrice)} đ'),
      onTap: () {
        Navigator.of(context)
            .pushNamed(OrdersScreen.routeName, arguments: orderItem);
      },
    );
  }

  // Widget buildOrderDetails() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
  //     height: min(widget.order.productCount * 20 + 10, 100),
  //   );
  // }

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
