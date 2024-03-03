import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_details_name;
  final product_details_new_price;
  final product_details_old_price;
  final product_details_picture;

  ProductDetails({
    required this.product_details_name,
    required this.product_details_new_price,
    required this.product_details_old_price,
    required this.product_details_picture,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text(
            'ShopApp',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
                height: 300.0,
                child: GridTile(
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(widget.product_details_picture),
                    ),
                    footer: new Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: new Text(
                          widget.product_details_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        title: new Row(
                          children: <Widget>[
                            Expanded(
                                child: new Text(
                              "\$${widget.product_details_old_price}",
                              style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough),
                            )),
                            Expanded(
                                child: new Text(
                              "\$${widget.product_details_new_price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )),
                          ],
                        ),
                      ),
                    ))),
            // ==========================The first buttons==========
            Row(
              children: <Widget>[
                // =========the size button========
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text('Size'),
                              content: new Text("Choose the size"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: new Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("size")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                // =========the size button========
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text('Colors'),
                              content: new Text("Choose the color"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: new Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Color")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return new AlertDialog(
                              title: new Text('Quantity'),
                              content: new Text("Choose the quantity"),
                              actions: <Widget>[
                                new MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(context);
                                  },
                                  child: new Text("close"),
                                )
                              ],
                            );
                          });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text("Qty")),
                        Expanded(child: new Icon(Icons.arrow_drop_down)),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // ==========================The second buttons==========
            Row(
              children: <Widget>[
                // =========the size button========
                Expanded(
                  child: MaterialButton(
                      onPressed: () {},
                      color: Colors.red,
                      textColor: Colors.white,
                      elevation: 0.2,
                      child: new Text("Buy now")),
                ),

                new IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.red,
                    )),
                new IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  color: Colors.red,
                )
              ],
            ),

            Divider(),
            new ListTile(
              title: new Text("Product details"),
              subtitle: new Text(
                  "Quần áo không chỉ là vật dụng bảo vệ cơ thể mà còn là biểu tượng của phong cách cá nhân và sở thích cá nhân. Từ thời trang hàng ngày đến những bộ trang phục đặc biệt Chất liệu, kiểu dáng, và màu sắc của quần áo đều đóng vai trò quan trọng trong việc thể hiện cá tính. Những bộ trang phục thoải mái và phản ánh phong cách sáng tạo thường là sự kết hợp tinh tế giữa ý thức thời trang và sự thoải mái trong mọi hoạt động."),
            ),
            Divider(),
            new Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Product name",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(widget.product_details_name),
                )
              ],
            ),
            new Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Product brand",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                //Remember to create the product brand
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text("Brand X"),
                )
              ],
            ),

            //
            new Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "Product condition",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text("NEW"),
                )
              ],
            )
          ],
        ));
  }
}
