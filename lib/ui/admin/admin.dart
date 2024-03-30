import 'package:flutter/material.dart';

import '../../ui/screens.dart';
import '../shared/app_drawer.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  static const routeName = 'admin';
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.green;
  MaterialColor notActive = Colors.yellow;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  GlobalKey<FormState> _categoryFormKey = GlobalKey();
  GlobalKey<FormState> _brandFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _selectedPage = Page.dashboard;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),

                      SizedBox(width: 8), // Khoảng cách giữa icon và label
                      Text('Tổng Quan',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _selectedPage = Page.manage;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      SizedBox(width: 8), // Khoảng cách giữa icon và label
                      Text('Quản Lí',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          elevation: 0.0,
          // backgroundColor: Colors.white,
        ),
        drawer: const AppDrawer(),
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: TextButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: Colors.green,
                ),
                label: Text(
                  '1,200,000đ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
                ),
              ),
              title: Text(
                'Tổng Thu Nhập',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
                child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.people_outline, color: Colors.white),
                          label: Text(
                            "Tài Khoản",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.category, color: Colors.white),
                          label: Text(
                            "Danh Mục",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.track_changes, color: Colors.white),
                          label: Text(
                            "Sản Phẩm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '10',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.tag_faces, color: Colors.white),
                          label: Text(
                            "Đã Bán",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '13',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.shopping_cart, color: Colors.white),
                          label: Text(
                            "Đơn Hàng",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Đặt độ cong tùy ý tại đây
                      side: BorderSide(
                          color: Color(0xFF820233),
                          width: 1.0), // Màu và độ rộng của đường viền
                    ),
                    child: ListTile(
                      title: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              25.0), // Đặt độ cong tùy ý tại đây
                          color: Color(0xFFC8273E),
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            // Xử lý sự kiện khi nút được nhấn
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                          label: Text(
                            "Hoàn Trả",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '0',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        );
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text("Thêm Sản Phẩm"),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);

                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                );
              },
            ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.add),
            //   title: Text(
            //     "Cập Nhật Sản Phẩm",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   onTap: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(UserProductsScreen.routeName);
            //   },
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Danh Sách Sản Phẩm"),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Thêm Danh Mục"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Thêm Nhãn Hàng"),
              onTap: () {
                _brandAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Danh Sách Danh Mục"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("Danh Sách Nhãn Hàng"),
              onTap: () {},
            ),
            Divider(),
          ],
        );
        break;
      default:
        return Container();
    }
  }

  void _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'danh mục không tồn tại';
            }
            return null;
          },
          decoration: InputDecoration(hintText: "thêm danh mục"),
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
            onPressed: () {}, icon: Icon(Icons.close), label: Text('THÊM')),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('HỦY'))
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  void _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryFormKey,
        child: TextFormField(
          controller: categoryController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nhãn hiệu không tồn tại';
            }
            return null;
          },
          decoration: InputDecoration(hintText: "Thêm nhãn hàng"),
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
            onPressed: () {}, icon: Icon(Icons.close), label: Text('THÊM')),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('HỦY'))
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}
