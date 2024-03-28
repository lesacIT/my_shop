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
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Expanded(
            child: buildCartDetails(cart),
          ),
          const SizedBox(height: 10),
          // Divider(
          //   height: 10,
          //   thickness: 1,
          //   color: Colors.black,
          // ),
          buildTotalAmount(cart, context),
          Divider(),
          SizedBox(height: 10),
          buildOrderButton(cart, context),
        ],
      ),
    );
  }

  Widget buildCartDetails(CartManager cart) {
    return ListView.builder(
      itemCount: cart.productEntries.length,
      itemBuilder: (context, index) {
        final entry = cart.productEntries.elementAt(index);
        return Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10.0), // Khoảng cách dọc giữa các sản phẩm
          child: CartItemCard(
            productId: entry.key,
            cardItem: entry.value,
          ),
        );
      },
    );
  }

  Widget buildTotalAmount(CartManager cart, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Tổng Tiền',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
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
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrderButton(CartManager cart, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFC8273E),
          minimumSize: Size(double.infinity, 50), // Kích thước cho nút
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            'Thanh Toán',
            style:
                TextStyle(fontSize: 18, color: Colors.white), // Cỡ chữ cho nút
          ),
        ),
      ),
    );
  }

  String formatNumber(int number) {
    String formattedNumber = number.toString();
    formattedNumber = formattedNumber.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]},');
    return formattedNumber;
  }

  static void removeItem(String productId) {}
}
