import 'package:flutter/material.dart';
import 'package:myshop/ui/admin/admin.dart';
import 'package:myshop/ui/auth/auth_manager.dart';
import 'package:myshop/ui/auth/login.dart';
import 'package:provider/provider.dart';

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
              color: Colors.red,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Quản trị viên'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Admin.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('trang test'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favorite'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.blue),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
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
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
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
