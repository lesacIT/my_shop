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
        header: ProductGridHeader(
          product: product,
          onFavoritePressed: () {
            context.read<ProductsManager>().toggleFavoriteStatus(product);
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
        footer: ProductGridFooter(
          product: product,
          onAddToCartPressed: () async {
            final cartItem = CartItem(
              id: product.id!,
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
                  content: const Text('Sản phẩm đã được thêm vào giỏ'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'HOÀN TÁC',
                    onPressed: () {
                      cart.removeItem(product.id!);
                    },
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}

class ProductGridHeader extends StatelessWidget {
  const ProductGridHeader({
    Key? key,
    required this.product,
    this.onFavoritePressed,
  }) : super(key: key);

  final Product product;
  final VoidCallback? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(top: 7.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 40,
            height: 38,
            color: Colors.white,
            child: ValueListenableBuilder<bool>(
              valueListenable: product.isFavoriteListenable,
              builder: (ctx, isFavorite, child) {
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  iconSize: 24,
                  onPressed: onFavoritePressed,
                );
              },
            ),
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
    this.onAddToCartPressed,
  }) : super(key: key);

  final Product product;
  final VoidCallback? onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black45,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5), // Khoảng cách giữa title và price
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC8273E),
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.add_shopping_cart,
        ),
        onPressed: onAddToCartPressed,
        color: Colors.white,
      ),
    );
  }
}
