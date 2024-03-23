import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/cart_item.dart';
import '../../models/product.dart';
import '../cart/cart_manager.dart';
import '../cart/cart_screen.dart';
import 'top_right_badge.dart';

class ShoppingCartButton1 extends StatelessWidget {
  const ShoppingCartButton1({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TopRightBadge(
      data: context.watch<CartManager>().productCount,
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: onPressed,
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.product.title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Thực hiện hành động khi nhấn nút yêu thích
              },
              icon: const Icon(Icons.favorite, color: Colors.redAccent),
            ),
            ShoppingCartButton1(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.product.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 180),
                    child: Text(
                      '\$${widget.product.price}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: const Text(
                  "Chi tiết sản phẩm: ",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 15, 15, 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: const Text(
                  "Áo thun là một loại trang phục thông dụng được làm từ chất liệu vải nhẹ, thường là cotton hoặc các loại vải co giãn khác. Áo thun có thiết kế đơn giản, thường không có cổ áo và có đôi khi có tay ngắn hoặc dài.",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(221, 54, 54, 53),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Container(
                color: const Color.fromARGB(255, 218, 225, 221),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => _updateQuantity(-1),
                            child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            "$_quantity",
                            style: const TextStyle(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () => _updateQuantity(1),
                            child: const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final cart = context.read<CartManager>();
                          final cartItem = CartItem(
                            id: widget.product.id!,
                            title: widget.product.title,
                            imageUrl: widget.product.imageUrl,
                            price: widget.product.price,
                            quantity: _quantity,
                          );
                          cart.addCartItem(cartItem);
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: const Text('Item added to cart'),
                                duration: const Duration(seconds: 2),
                                action: SnackBarAction(
                                  label: 'UNDO',
                                  onPressed: () {
                                    cart.removeItem(widget.product.id!);
                                  },
                                ),
                              ),
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: const Color.fromARGB(255, 51, 173, 204),
                          fixedSize: const Size(double.infinity, 65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 249, 247, 250),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Thêm Sản Phẩm",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateQuantity(int delta) {
    setState(() {
      _quantity = (_quantity + delta).clamp(0, 99);
    });
  }
}
