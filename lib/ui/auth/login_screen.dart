// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import 'package:labeaute/widgets/container_button_modal.dart';

// class login_screen extends StatelessWidget {
//   static const routeName = 'CartScreen2';
//   List imageList = [
//     "images/image2.jpg",
//     "images/image3.jpg",
//     "images/image4.jpg",
//     "images/image5.jpg",
//   ];

//   List productTitles = ["Son", "Kem nền", "Phấn phủ", "Mascara"];

//   List prices = [
//     "150.000đ",
//     "200.000đ",
//     "180.000đ",
//     "190.000đ",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Giỏ Hàng"),
//         leading: BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Container(
//                 child: ListView.builder(
//                   itemCount: imageList.length,
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Checkbox(
//                             splashRadius: 20,
//                             activeColor: Color(0xFFC8273E),
//                             value: true,
//                             onChanged: (val) {},
//                           ),
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset(
//                               imageList[index],
//                               height: 80,
//                               width: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 productTitles[index],
//                                 style: TextStyle(
//                                   color: Colors.black87,
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 "Son Bbia",
//                                 style: TextStyle(
//                                   color: Colors.black26,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Text(
//                                 prices[index],
//                                 style: TextStyle(
//                                   color: Color(0xFFC8273E),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w900,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 CupertinoIcons.minus,
//                                 color: Colors.green,
//                               ),
//                               SizedBox(width: 20),
//                               Text(
//                                 "1",
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w700),
//                               ),
//                               SizedBox(width: 5),
//                               Icon(
//                                 CupertinoIcons.plus,
//                                 color: Color(0xFFC8273E),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Chọn Tất Cả",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Checkbox(
//                     splashRadius: 20,
//                     activeColor: Color(0xFFC8273E),
//                     value: false,
//                     onChanged: (val) {},
//                   )
//                 ],
//               ),
//               Divider(
//                 height: 10,
//                 thickness: 1,
//                 color: Colors.black,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Tổng Tiền",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     "300.000đ",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w900,
//                       color: Color(0xFFC8273E),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               InkWell(
//                 onTap: () {},
//                 child: ContainerButtonModel(
//                   itext: "Thanh Toán",
//                   containerWidth: MediaQuery.of(context).size.width,
//                   bgColor: Color(0xFFC8273E),
//                 ),
//               ),
//               SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ContainerButtonModel extends StatelessWidget {
//   final Color? bgColor;
//   final double? containerWidth;
//   final String itext;

//   const ContainerButtonModel(
//       {super.key, this.bgColor, this.containerWidth, required this.itext});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: containerWidth,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: bgColor,
//       ),
//       child: Center(
//         child: Text(
//           itext,
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//       ),
//     );
//   }
// }
