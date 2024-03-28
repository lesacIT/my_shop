import 'package:flutter/material.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../../models/product.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: ProductGridFooter(
          product: product,
          onFavoritePressed: () {
            context.read<ProductsManager>().toggleFavoriteStatus(product);
          },
          onAddToCartPressed: () async {
            final cartItem = CartItem(
              id: product.id!,
              // Thay 'user_id' bằng logic để lấy userId của người dùng
              title: product.title,
              imageUrl: product.imageUrl,
              quantity: 1,
              price: product.price,
            );
            final cart = context.read<CartManager>();
            await cart.addCartItem(cartItem);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: const Text('Item added to cart'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeItem(product.id!);
                    },
                  ),
                ),
              );
          },
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ProductGridFooter extends StatelessWidget {
  const ProductGridFooter({
    Key? key,
    required this.product,
    this.onFavoritePressed,
    this.onAddToCartPressed,
  }) : super(key: key);

  final Product product;
  final VoidCallback? onFavoritePressed;
  final VoidCallback? onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Color(0xFF820233),
      // leading: ValueListenableBuilder<bool>(
      //   valueListenable: product.isFavoriteListenable,
      //   builder: (ctx, isFavorite, child) {
      //     return IconButton(
      //       icon: Icon(
      //         isFavorite ? Icons.favorite : Icons.favorite_border,
      //       ),
      //       color: Theme.of(context).colorScheme.secondary,
      //       onPressed: onFavoritePressed,
      //     );
      //   },
      // ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.add_shopping_cart,
        ),
        onPressed: onAddToCartPressed,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
    //   Container(
    // child: Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     SizedBox(
    //       height: 420,
    //       child: Stack(
    //         children: [
    //           InkWell(
    //             onTap: () {},
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: Image.asset(
    //                 product.imageUrl,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Text(
    //       product.title,
    //       style: TextStyle(
    //         fontSize: 18,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     Row(
    //       children: [
    //         Text(
    //           '\$${product.price.toStringAsFixed(2)}',
    //           style: TextStyle(
    //             fontSize: 18,
    //             fontWeight: FontWeight.bold,
    //             color: Color(0xFFC8273E),
    //           ),
    //         ),
    //         SizedBox(width: 10),
    //         IconButton(
    //           icon: const Icon(
    //             Icons.shopping_cart,
    //           ),
    //           onPressed: onAddToCartPressed,
    //           color: Theme.of(context).colorScheme.secondary,
    //         ),
    //       ],
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     ),
    //   ],
    // ),
    // );
  }
}
