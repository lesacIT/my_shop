import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
// import 'product_grid_tile.dart';
import 'products_manager.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  List<String> tabs = ["Tất cả", "Danh mục", "Hàng đầu", "Đề xuất"];

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

  List reviews = [
    "54",
    "42",
    "30",
    "60",
  ];

  ProductsGrid(this.showFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
      (productsManager) =>
          showFavorites ? productsManager.favoriteItems : productsManager.items,
    );

    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(height: 5),
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              "images/banner2.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20), // Khoảng cách giữa banner và danh sách sản phẩm
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length,
            itemBuilder: (context, index) {
              return FittedBox(
                child: Container(
                  height: 40,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 180,
          child: ListView.builder(
            itemCount: imageList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                width: 320,
                margin: EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 180,
                      width: 180,
                      child: Stack(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                imageList[index],
                                fit: BoxFit.cover,
                                height: 180,
                                width: 180,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xFFC8273E),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productTitles[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 120,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Text(
                                '(' + reviews[index] + ')',
                              ),
                              SizedBox(width: 10),
                              Text(
                                prices[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFC8273E),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Sản Phẩm Mới Nhất",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        GridView.builder(
          itemCount: productTitles.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            // crossAxisSpacing: 40,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageList[index],
                              width: 170,
                              fit: BoxFit.cover,
                              height: 220,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Color(0xFFC8273E),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    productTitles[index],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 22,
                      ),
                      Text(
                        '(' + reviews[index] + ')',
                      ),
                      SizedBox(width: 10),
                      Text(
                        prices[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC8273E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),

        // Expanded(
        // child: GridView.builder(
        //   padding: const EdgeInsets.all(10.0),
        //   itemCount: products.length,
        //   itemBuilder: (ctx, i) => ProductGridTile(products[i]),
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     childAspectRatio: 3 / 2,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //   ),
        // ),
        // ),
      ],
    ));
  }
}
