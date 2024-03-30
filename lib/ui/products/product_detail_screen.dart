import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../cart/cart_manager.dart';
import '../cart/cart_screen.dart';
// import '../widgets/product_details_popup.dart';
import 'top_right_badge.dart';

class ShoppingCartButton1 extends StatelessWidget {
  const ShoppingCartButton1({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TopRightBadge(
      data: context.watch<CartManager>().productCount,
      textColor: Colors.white,
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: onPressed,
      ),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  ProductDetailScreen(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  List<String> images = List.generate(5, (index) => "");
  @override
  void initState() {
    super.initState();
    // Thêm đường dẫn hình ảnh từ widget.product.imageUrl vào danh sách images
    for (int i = 0; i < images.length; i++) {
      images[i] = widget.product.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Chi Tiết Sản Phẩm",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          foregroundColor: Color(0xFF820233),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     // Thực hiện hành động khi nhấn nút yêu thích
            //   },
            //   icon: const Icon(Icons.favorite, color: Colors.redAccent),
            // ),
            ShoppingCartButton1(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FanCarouselImageSlider(
                      sliderHeight: 350,
                      autoPlay: true,
                      imagesLink: images,
                      isAssets: false,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(
                          widget.product.title,
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w900,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                              .format(widget.product.price),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFFC8273E),
                          ),
                        )
                      ],
                    ),
                    // Text(
                    //   NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                    //       .format(widget.product.price),
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 25,
                    //     color: Color(0xFFC8273E),
                    //   ),
                    // )

                    IconButton(
                      onPressed: () {
                        // Thực hiện hành động khi nhấn nút yêu thích
                      },
                      icon: const Icon(Icons.favorite, color: Colors.redAccent),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.description,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
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
                              content:
                                  const Text('Thêm sản phẩm vào giỏ hàng'),
                              duration: const Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'HOÀN TÁC',
                                onPressed: () {
                                  cart.removeItem(widget.product.id!);
                                },
                              ),
                            ),
                          );
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0x1F989797),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFC8273E),
                          ),
                        ),
                      ),
                    ),
                    ProductDetailsPopUp(
                      updateQuantity: _updateQuantity,
                      quantity: _quantity,
                      product: widget
                          .product, // Pass the current product to ProductDetailsPopUp
                    ),
                  ],
                ),
              ],
            ),
          ),
          //child:
          // //Column(
          //   children: <Widget>[
          //     const SizedBox(height: 40),
          //     SizedBox(
          //       height: 300,
          //       width: double.infinity,
          //       child: Image.network(
          //         widget.product.imageUrl,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     const SizedBox(height: 10),
          //     Row(
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.only(left: 20),
          //           child: Text(
          //             widget.product.title,
          //             style: const TextStyle(
          //               color: Colors.black,
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           padding: const EdgeInsets.only(left: 180),
          //           child: Text(
          //             '\$${widget.product.price}',
          //             style: const TextStyle(
          //               color: Colors.red,
          //               fontSize: 22,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     const SizedBox(height: 10),
          //     Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 10),
          //       width: double.infinity,
          //       child: const Text(
          //         "Chi tiết sản phẩm: ",
          //         textAlign: TextAlign.left,
          //         softWrap: true,
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Color.fromARGB(255, 15, 15, 14),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 10),
          //     Container(
          //       padding: const EdgeInsets.symmetric(horizontal: 10),
          //       width: double.infinity,
          //       child: const Text(
          //         "Áo thun là một loại trang phục thông dụng được làm từ chất liệu vải nhẹ, thường là cotton hoặc các loại vải co giãn khác. Áo thun có thiết kế đơn giản, thường không có cổ áo và có đôi khi có tay ngắn hoặc dài.",
          //         textAlign: TextAlign.left,
          //         softWrap: true,
          //         style: TextStyle(
          //           fontSize: 18,
          //           color: Color.fromARGB(221, 54, 54, 53),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 70),
          //     Container(
          //       color: const Color.fromARGB(255, 218, 225, 221),
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          //       height: 100,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Container(
          //             width: 150,
          //             height: 60,
          //             padding: const EdgeInsets.symmetric(horizontal: 8),
          //             decoration: BoxDecoration(
          //               color: Colors.grey.shade200,
          //               borderRadius: BorderRadius.circular(999),
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 InkWell(
          //                   onTap: () => _updateQuantity(-1),
          //                   child: const CircleAvatar(
          //                     radius: 22,
          //                     backgroundColor: Colors.grey,
          //                     child: Icon(Icons.remove),
          //                   ),
          //                 ),
          //                 Text(
          //                   "$_quantity",
          //                   style: const TextStyle(fontSize: 20),
          //                 ),
          //                 InkWell(
          //                   onTap: () => _updateQuantity(1),
          //                   child: const CircleAvatar(
          //                     radius: 22,
          //                     backgroundColor: Colors.grey,
          //                     child: Icon(Icons.add),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(width: 10),
          //           Expanded(
          //             child: ElevatedButton(
          //               onPressed: () {
          //                 final cart = context.read<CartManager>();
          //                 final cartItem = CartItem(
          //                   id: widget.product.id!,
          //                   title: widget.product.title,
          //                   imageUrl: widget.product.imageUrl,
          //                   price: widget.product.price,
          //                   quantity: _quantity,
          //                 );
          //                 cart.addCartItem(cartItem);
          //                 ScaffoldMessenger.of(context)
          //                   ..hideCurrentSnackBar()
          //                   ..showSnackBar(
          //                     SnackBar(
          //                       content: const Text('Item added to cart'),
          //                       duration: const Duration(seconds: 2),
          //                       action: SnackBarAction(
          //                         label: 'UNDO',
          //                         onPressed: () {
          //                           cart.removeItem(widget.product.id!);
          //                         },
          //                       ),
          //                     ),
          //                   );
          //               },
          //               style: ElevatedButton.styleFrom(
          //                 // primary: const Color.fromARGB(255, 51, 173, 204),
          //                 fixedSize: const Size(double.infinity, 65),
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(18.0),
          //                   side: const BorderSide(
          //                     color: Color.fromARGB(255, 249, 247, 250),
          //                   ),
          //                 ),
          //               ),
          //               child: const Text(
          //                 "Thêm Sản Phẩm",
          //                 style: TextStyle(fontSize: 18, color: Colors.white),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Future<void> _updateQuantity(int delta) async {
    setState(() {
      _quantity =
          (_quantity + delta).clamp(1, 99); // Giới hạn số lượng từ 1 đến 99
    });
  }
}

class ProductDetailsPopUp extends StatelessWidget {
  final Function(int) updateQuantity;
  final int quantity;
  final Product product; // Add this line

  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  ProductDetailsPopUp({
    Key? key,
    required this.updateQuantity,
    required this.quantity,
    required this.product, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Khối lượng: ",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Số lượng: ",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Nhỏ",
                                  style: iStyle.copyWith(color: Colors.grey)),
                              SizedBox(width: 30),
                              Text("Vừa", style: iStyle),
                              SizedBox(width: 30),
                              Text("Lớn",
                                  style: iStyle.copyWith(color: Colors.grey)),
                              SizedBox(width: 30),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () => updateQuantity(-1),
                                child: Text("-", style: iStyle),
                              ),
                              SizedBox(width: 30),
                              Text("$quantity", style: iStyle),
                              SizedBox(width: 30),
                              GestureDetector(
                                onTap: () => updateQuantity(1),
                                child: Text("+", style: iStyle),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng Tiền",
                        style: iStyle,
                      ),
                      Text(
                        "${NumberFormat.currency(locale: 'vi_VN', symbol: '₫').format(product.price * quantity)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC8273E),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        final cart = context.read<CartManager>();
                        final cartItem = CartItem(
                          id: product.id!,
                          title: product.title,
                          imageUrl: product.imageUrl,
                          price: product.price,
                          quantity: quantity, // Use quantity from parameters
                        );
                        cart.addCartItem(cartItem);
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Sản phẩm đã được thêm vào giỏ'),
                              duration: const Duration(seconds: 3),
                              action: SnackBarAction(
                                label: 'HOÀN TÁC',
                                onPressed: () {
                                  cart.removeItem(product.id!);
                                },
                              ),
                            ),
                          );
                      },
                      child: ContainerButtonModel(
                        containerWidth: MediaQuery.of(context).size.width,
                        itext: "Thêm Vào Giỏ Hàng",
                        bgColor: Color(0xFFC8273E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Mua Ngay",
        bgColor: Color(0xFFC8273E),
      ),
    );
  }
}

class ContainerButtonModel extends StatelessWidget {
  final Color? bgColor;
  final double? containerWidth;
  final String itext;

  const ContainerButtonModel(
      {Key? key, this.bgColor, this.containerWidth, required this.itext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgColor,
      ),
      child: Center(
        child: Text(
          itext,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
