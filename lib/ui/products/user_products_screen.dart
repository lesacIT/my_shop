import 'package:flutter/material.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';
import 'user_product_list_tile.dart';

class UserProductsScreen extends StatelessWidget {
  //them moi
  static const routeName = '/user-products';

  const UserProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SẢN PHẨM'),
        backgroundColor: Color(0xFF820233),
        actions: <Widget>[
          // Bắt sự kiện cho nút add
          AddUserProductButton(
            onPressed: () {
              // Chuyển đến trang EditProductScreen
              Navigator.of(context).pushNamed(
                EditProductScreen.routeName,
              );
            },
          ),
        ],
      ),
      // Thêm Drawer
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: context.read<ProductsManager>().fetchProducts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => context.read<ProductsManager>().fetchProducts(),
            child: const UserProductList(),
          );
        },
      ),
    );
  }
}

class UserProductList extends StatelessWidget {
  const UserProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dùng Consumer để truy xuất và lắng nghe báo hiệu
// thay đổi trạng thái từ ProductsManager
    // final productsManager = ProductsManager();
    return Consumer<ProductsManager>(
      builder: (ctx, productsManager, child) {
        return ListView.builder(
          itemCount: productsManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              const SizedBox(height: 10),
              UserProductListTile(
                productsManager.items[i],
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddUserProductButton extends StatelessWidget {
  const AddUserProductButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: onPressed,
    );
  }
}
