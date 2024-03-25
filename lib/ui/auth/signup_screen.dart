// import 'package:flutter/material.dart';

// import 'login_screen.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   double getSmallDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 2 / 3;
//   double getBigDiameter(BuildContext context) =>
//       MediaQuery.of(context).size.width * 7 / 8;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFEEEEEE),
//       body: Stack(
//         children: [
//           Positioned(
//             right: -getSmallDiameter(context) / 3,
//             top: -getSmallDiameter(context) / 3,
//             child: Container(
//               width: getSmallDiameter(context),
//               height: getSmallDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: -getBigDiameter(context) / 4,
//             top: -getBigDiameter(context) / 4,
//             child: Container(
//               width: getBigDiameter(context),
//               height: getBigDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                 ),
//               ),
//               child: Center(
//                 child: Text(
//                   "LaBeauté",
//                   style: TextStyle(
//                     fontFamily: 'Pacifico',
//                     fontSize: 35,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: -getBigDiameter(context) / 2,
//             bottom: -getBigDiameter(context) / 2,
//             child: Container(
//               width: getBigDiameter(context),
//               height: getBigDiameter(context),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Color(0xFFF3E9EE),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: ListView(
//               children: [
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 220, 20, 10),
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.person,
//                         color: Color(0xFFFF4891),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey.shade100),
//                       ),
//                       labelText: "Họ và tên",
//                       enabledBorder: InputBorder.none,
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.email,
//                         color: Color(0xFFFF4891),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey.shade100),
//                       ),
//                       labelText: "Email",
//                       enabledBorder: InputBorder.none,
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.numbers,
//                         color: Color(0xFFFF4891),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey.shade100),
//                       ),
//                       labelText: "Số điện thoại",
//                       enabledBorder: InputBorder.none,
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       icon: Icon(
//                         Icons.vpn_key,
//                         color: Color(0xFFFF4891),
//                       ),
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey.shade100),
//                       ),
//                       labelText: "Mật khẩu",
//                       enabledBorder: InputBorder.none,
//                       labelStyle: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Align(
//                 //   alignment: Alignment.centerRight,
//                 //   child: Container(
//                 //     margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
//                 //     child: Text(
//                 //       "QUÊN MẬT KHẨU?",
//                 //       style: TextStyle(
//                 //         color: Color(0xFFFF4891),
//                 //         fontSize: 12,
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 Container(
//                   margin: EdgeInsets.fromLTRB(20, 20, 20, 15),
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     gradient: LinearGradient(
//                       colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                   child: Material(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {},
//                       borderRadius: BorderRadius.circular(20),
//                       splashColor: Colors.amber,
//                       child: Center(
//                         child: Text(
//                           "TẠO TÀI KHOẢN",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "ĐÃ CÓ TÀI KHOẢN? ",
//                       style: TextStyle(
//                         fontSize: 11,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginScreen(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         " ĐĂNG NHẬP",
//                         style: TextStyle(
//                           color: Color(0xFFFF4891),
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
