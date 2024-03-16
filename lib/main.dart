import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_shop/pages/splash_screen.dart';
import 'package:my_shop/screens/admin.dart';
import 'package:provider/provider.dart';

import 'pages/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  await dotenv.load();
  // runApp(MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: HomePage(),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthManager>(
          create: (context) => AuthManager(),
        ),
      ],
      child: Consumer<AuthManager>(builder: (context, AuthManager, child) {
        return MaterialApp(
          // Đặt các thuộc tính MaterialApp tại đây
          // home: AuthManager.isAuth
          //     ? HomePage()
          //     : FutureBuilder(
          //         future: AuthManager.tryAutoLogin(),
          //         builder: (context, snapshot) {
          //           return snapshot.connectionState == ConnectionState.waiting
          //               ? const SplashScreen()
          //               : const AuthScreen();
          //         }), // Thay thế MyHomePage bằng màn hình chính của ứng dụng của bạn
          home: AuthManager.isAuth
              ? Admin()
              : FutureBuilder(
                  future: AuthManager.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthScreen();
                  }), // Thay thế MyHomePage
        );
      }),
    );
  }
}
