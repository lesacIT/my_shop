import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../products/product_grid_tile.dart';
import '../products/products_manager.dart';
import '../shared/app_drawer.dart';

class Favorites extends StatelessWidget {
  static const routeName = 'Favorites';
  final bool showFavorites;

  Favorites(this.showFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsManager, List<Product>>(
      (productsManager) => showFavorites
          ? productsManager.favoriteItems
          : productsManager.favoriteItems,
    );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("SẢN PHẨM YÊU THÍCH"),

          automaticallyImplyLeading: true,
          // leading: BackButton(
          //     // onPressed: () {
          //     //   Navigator.of(context).pop();
          //     // },
          //     ),
          foregroundColor: Color(0xFF820233),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       // Thực hiện hành động khi nhấn nút yêu thích
          //     },
          //     icon: const Icon(Icons.favorite, color: Colors.redAccent),
          //   ),
          // ],
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                // child: Text(
                //   "SẢN PHẨM YÊU THÍCH",
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF820233),
                //   ),
                // ),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  itemBuilder: (ctx, i) => ProductGridTile(products[i]),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
              ),
            ],
          ),
        ));

    //);
  }
}
