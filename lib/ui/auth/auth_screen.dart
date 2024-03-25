import 'package:flutter/material.dart';

import 'app_banner.dart';
import 'auth_card.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFEEEEEE),
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //       // gradient: LinearGradient(
          //       //   colors: [
          //       //     const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
          //       //     const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
          //       //   ],
          //       //   begin: Alignment.topLeft,
          //       //   end: Alignment.bottomRight,
          //       //   stops: const [0, 1],
          //       // ),
          //       ),
          // ),

          Center(
            child: SingleChildScrollView(
              child: SizedBox(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Flexible(
                      child: AppBanner(),
                    ),
                    Flexible(
                      flex: deviceSize.width > 400 ? 5 : 1,
                      child: const AuthCard(),
                    )
                    // _buildForgotPasswordButton(),
                    // Positioned(
                    //   right: -getBigDiameter(context) / 2,
                    //   bottom: -getBigDiameter(context) / 2,
                    //   child: Container(
                    //     width: getBigDiameter(context),
                    //     height: getBigDiameter(context),
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       // color: Color(0xFFF3E9EE),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildForgotPasswordButton() {
  //   return Align(
  //     alignment: Alignment.centerRight,
  //     child: Container(
  //       margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
  //       child: Text(
  //         "QUÊN MẬT KHẨU?",
  //         style: TextStyle(
  //           color: Color(0xFFFF4891),
  //           fontSize: 12,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
