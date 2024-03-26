import "package:flutter/material.dart";

// import "package:labeaute/screens/cart_screen.dart";

import "container_button_modal.dart";

class ProductDetailsPopUp extends StatelessWidget {
  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Khối lượng: ",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Số lượng: ",
                            style: iStyle,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text("Nhỏ", style: iStyle),
                              SizedBox(width: 30),
                              Text("Vừa", style: iStyle),
                              SizedBox(width: 30),
                              Text("Lớn", style: iStyle),
                              SizedBox(width: 30),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Text("-", style: iStyle),
                              SizedBox(width: 30),
                              Text("1", style: iStyle),
                              SizedBox(width: 30),
                              Text("+", style: iStyle),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng Tiền",
                        style: iStyle,
                      ),
                      Text(
                        "180.000đ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC8273E),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CartScreen(),
                      //   ),
                      // );
                    },
                    child: ContainerButtonModel(
                      containerWidth: MediaQuery.of(context).size.width,
                      itext: "Thêm Vào Giỏ Hàng",
                      bgColor: Color(0xFFC8273E),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Mua Ngay",
        bgColor: Color(0xFFC8273E),
      ),
    );
  }
}
