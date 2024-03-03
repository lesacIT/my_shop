import 'package:flutter/material.dart';
import 'package:my_shop/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Blazer",
      "picture": "images/products/dress2.jpeg",
      "old_price": 90,
      "price": 85,
    },
    {
      "name": "Blazer",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Blazer",
      "picture": "images/products/skt1.jpeg",
      "old_price": 150,
      "price": 125,
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
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    required this.prod_name,
    required this.prod_picture,
    required this.prod_old_price,
    required this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name,
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
