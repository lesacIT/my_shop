import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myshop/models/order_item.dart';
import 'package:myshop/ui/orderDetails/order_detail_screen.dart';
import 'package:provider/provider.dart';

import 'ui/screens.dart';

Future<void> main() async {
  await dotenv.load();
  // await Firebase.initializeApp();
  final cartManager = CartManager();
  // Tải giỏ hàng từ SharedPreferences
  await cartManager.getCartFromSharePreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(0xFF820233),
      secondary: Colors.deepOrange,
      background: Colors.white,
      surfaceTint: Colors.grey[200],
    );

    final themData = ThemeData(
      fontFamily: 'Lato',
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shadowColor: colorScheme.shadow,
      ),
      dialogTheme: DialogTheme(
        titleTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: 20,
        ),
      ),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
            // Khi authManager có báo hiệu thay đổi thì đọc lại authToken
            // cho productManager
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),
        ChangeNotifierProxyProvider<AuthManager, OrdersManager>(
          create: (context) => OrdersManager(),
          update: (context, authManager, orderManager) {
            orderManager!.authToken = authManager.authToken;
            return orderManager;
          },
        ),
        ChangeNotifierProvider(create: (context) => CartManager()),
        ChangeNotifierProxyProvider<AuthManager, OrdersManager>(
          create: (context) => OrdersManager(),
          update: (context, authManager, orderManager) {
            orderManager!.authToken = authManager.authToken;
            return orderManager;
          },
        ),
        ChangeNotifierProvider(create: (context) => CartManager()),
      ],
      child: Consumer<AuthManager>(builder: (context, AuthManager, child) {
        return MaterialApp(
          title: 'La Beauté',
          debugShowCheckedModeBanner: false,
          theme: themData,
          home: AuthManager.isAuth
              ? const ProductsOverviewScreen()
              : FutureBuilder(
                  future: AuthManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  }),
          routes: {
            CartScreen.routeName: (ctx) => const SafeArea(
                  child: CartScreen(),
                ),
            OrdersScreen.routeName: (ctx) => const SafeArea(
                  child: OrdersScreen(),
                ),
            UserProductsScreen.routeName: (ctx) => const SafeArea(
                  child: UserProductsScreen(),
                ),
            UserScreen.routeName: (context) => const UserScreen(),
            Admin.routeName: (context) => Admin(),
            Login.routeName: (context) => Login(),
          },
          // onGenerateRoute sẽ được gọi khi không tìm thấy route yêu cầu
          // trong thuộc tính routes ở trên. Thường dùng để truyền tham số
          // hoặc tùy biến hiệu ứng chuyển trang.
          onGenerateRoute: (settings) {
            if (settings.name == ProductDetailScreen.routeName) {
              final productId = settings.arguments as String;
              return MaterialPageRoute(
                settings: settings,
                builder: (ctx) {
                  return SafeArea(
                    child: ProductDetailScreen(
                      ProductsManager().findById(productId)!,
                    ),
                  );
                },
              );
            }
            if (settings.name == EditProductScreen.routeName) {
              final productId = settings.arguments as String?;
              return MaterialPageRoute(
                builder: (ctx) {
                  return SafeArea(
                    child: EditProductScreen(
                      productId != null
                          ? ctx.read<ProductsManager>().findById(productId)
                          : null,
                    ),
                  );
                },
              );
            }
            if (settings.name == OrdersScreen.routeName) {
              return MaterialPageRoute(builder: (context) {
                // Truyền danh sách các đơn hàng vào OrdersScreen
                return OrdersScreen();
              });
            }
            if (settings.name == OrderDetailsScreen.routeName) {
              return MaterialPageRoute(builder: (context) {
                return OrderDetailsScreen(settings.arguments as OrderItem);
              });
            }
            return null;
          },
        );
      }),
    );
  }
}
