import 'package:flutter/material.dart';
import 'package:myshop/ui/orders/order_manager.dart';
import 'package:provider/provider.dart';

import 'cart_item_card.dart';
import 'cart_manager.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartManager>();
    cart.getCartFromSharePreferences();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: Column(
        children: <Widget>[
          buildCart(cart, context),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: buildCartDetails(cart),
          ),
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView(
      children: cart.productEntries
          .map(
            (entry) => CartItemCard(
              productId: entry.key,
              cardItem: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget buildCart(CartManager cart, BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Tổng thanh toán',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '${cart.totalAmount} ',
                style: TextStyle(
                  color: Theme.of(context).primaryTextTheme.titleLarge?.color,
                  fontSize: 13,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            TextButton(
              onPressed: cart.totalAmount <= 0
                  ? null
                  : () async {
                      try {
                        await context.read<OrdersManager>().addOrder(
                              cart.productsList,
                              cart.totalAmount,
                            );
                        context.read<CartManager>().clearCart();
                      } catch (err) {
                        print("có lỗi nè");
                      }
                    },
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              child: const Text('Đặt hàng'),
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
