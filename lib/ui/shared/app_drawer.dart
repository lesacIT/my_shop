import 'package:flutter/material.dart';
import 'package:myshop/ui/admin/admin.dart';
import 'package:myshop/ui/auth/auth_manager.dart';
// import 'package:myshop/ui/auth/login_screen.dart';
import 'package:provider/provider.dart';

import '../favorite/product_favorite_screen.dart';
import '../orders/orders_screen.dart';
import '../products/user_products_screen.dart';
import '../user/user_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // AppBar(
          //   title: const Text('Hello Friend!'),
          //   automaticallyImplyLeading: false,
          // ),
          UserAccountsDrawerHeader(
            accountName: Text('Thu Thảo'),
            accountEmail: Text('thao47827@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage('./images/avatarapp.jpg'),
                // backgroundColor: Colors.grey,
                // child: Icon(
                //   Icons.person,
                //   color: Colors.white,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF820233),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Cửa Hàng'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Đơn Hàng'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Quản Lí Sản Phẩm'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Quản Trị Viên'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Admin.routeName);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.admin_panel_settings),
          //   title: const Text('trang test'),
          //   onTap: () {
          //     // Navigator.of(context).pushReplacementNamed(login_screen.routeName);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Người Dùng'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Yêu Thích'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Favorites.routeName);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.help, color: Colors.green),
          //   title: const Text('About'),
          //   onTap: () {
          //     Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Color(0xFFC8273E),
            ),
            title: const Text(
              'Đăng Xuất',
              style: TextStyle(
                color: Color(0xFFC8273E),
              ),
            ),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..pushReplacementNamed('/');
              context.read<AuthManager>().logout();
            },
          ),
        ],
      ),
    );
  }
}
