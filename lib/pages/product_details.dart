import 'package:flutter/material.dart';
import 'package:my_shop/main.dart';

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
          title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text(
              'ShopApp',
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
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
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Similar products"),
            ),

            //          SIMILAR PRODUCTS SECTION
            Container(
              height: 340.0,
              child: Similar_products(),
            )
          ],
        ));
  }
}

class Similar_products extends StatefulWidget {
  const Similar_products({super.key});

  @override
  State<Similar_products> createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer",
      "picture": "images/products/dress2.jpeg",
      "old_price": 90,
      "price": 85,
    },
    {
      "name": "Blazer",
      "picture": "images/products/skt2.jpeg",
      "old_price": 140,
      "price": 95,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Similar_Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({
    required this.prod_name,
    required this.prod_picture,
    required this.prod_old_price,
    required this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //here we are passing the values of the product to the products detail
                builder: (context) => new ProductDetails(
                      product_details_name: prod_name,
                      product_details_new_price: prod_price,
                      product_details_old_price: prod_old_price,
                      product_details_picture: prod_picture,
                    ))),
            child: GridTile(
              footer: Container(
                  color: Colors.white70,
                  child: new Row(
                    children: [
                      Expanded(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      new Text(
                        "\$${prod_price}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
