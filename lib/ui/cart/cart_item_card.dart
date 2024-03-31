import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../shared//dialog_utils.dart';

class CartItemCard extends StatelessWidget {
  final String productId;
  final CartItem cardItem;

  const CartItemCard({
    required this.productId,
    required this.cardItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cardItem.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showConfirmDialog(
          context,
          'Bạn muốn xóa sản phẩm khỏi giỏ hàng?',
        );
      },
      onDismissed: (direction) {
        context.read<CartManager>().deleteCartItem(productId);
        // CartScreen.removeItem(productId);
      },
      child: ItemInfoCard(cardItem),
    );
  }
}

class ItemInfoCard extends StatelessWidget {
  const ItemInfoCard(
    this.cartItem, {
    super.key,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    List imageList = [
      "images/image2.jpg",
      "images/image3.jpg",
      "images/image4.jpg",
      "images/image5.jpg",
    ];

    List productTitles = ["Son", "Kem nền", "Phấn phủ", "Mascara"];

    List prices = [
      "150.000đ",
      "200.000đ",
      "180.000đ",
      "190.000đ",
    ];

    // return Card(
    //   margin: const EdgeInsets.symmetric(
    //     horizontal: 15,
    //     vertical: 4,
    //   ),
    //   child: Padding(
    //     padding: const EdgeInsets.all(8),
    //     child: ListTile(
    //       leading:
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(5),
    //         child: Image.network(
    //           cartItem.imageUrl,
    //           fit: BoxFit.cover,
    //           width: 80,
    //           height: 80,
    //         ),

    //       ),
    //       title: Text(cartItem.title),
    //       subtitle: Text('Total: \$${(cartItem.price * cartItem.quantity)}'),
    //       trailing: Text(
    //         '${cartItem.quantity} x \$${cartItem.price}',
    //         style: Theme.of(context).textTheme.titleMedium,
    //       ),
    //     ),
    //   ),
    // );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              splashRadius: 20,
              activeColor: Color(0xFFC8273E),
              value: true,
              onChanged: (val) {},
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cartItem.imageUrl,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(cartItem.price * cartItem.quantity)}",
                    style: TextStyle(
                      color: Color(0xFFC8273E),
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  CupertinoIcons.minus,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Text(
                  '${cartItem.quantity}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 10),
                Icon(
                  CupertinoIcons.plus,
                  color: Color(0xFFC8273E),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
