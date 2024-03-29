import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  List<String> tabs = ["Tất cả", "Danh mục", "Hàng đầu", "Đề xuất"];

  ProductsGrid(this.showFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
      (productsManager) =>
          showFavorites ? productsManager.favoriteItems : productsManager.items,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        children: [
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
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "SẢN PHẨM MỚI",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF820233),
              ),
            ),
          ),
          SizedBox(height: 5),

          Expanded(
            child: GridView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) => ProductGridTile(products[i]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
            ),
          ),
        ],
      ),
    );
    //);
  }
}
