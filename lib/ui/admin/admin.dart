import 'package:flutter/material.dart';

import '../shared/app_drawer.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  @override
  static const routeName = 'admin';
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;
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
                      Text('Dashboard'),
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
                      Text('Manage'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
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
                  Icons.attach_money,
                  size: 30,
                  color: Colors.green,
                ),
                label: Text(
                  '12,000',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0, color: Colors.green),
                ),
              ),
              title: Text(
                'Revenue',
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
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                        title: ElevatedButton.icon(
                            onPressed: null,
                            icon: Icon(Icons.people_outline),
                            label: Text('Users')),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 60.0),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        icon: Icon(Icons.category),
                        label: Text("Category"),
                      ),
                      subtitle: Text(
                        '14',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        icon: Icon(Icons.track_changes),
                        label: Text("Products"),
                      ),
                      subtitle: Text(
                        '20',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: active, fontSize: 60.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        icon: Icon(Icons.tag_faces),
                        label: Text("Sold"),
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
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text("Orders"),
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
                  padding: const EdgeInsets.all(18.0),
                  child: Card(
                    child: ListTile(
                      title: TextButton.icon(
                        onPressed: () {
                          // Xử lý sự kiện khi nút được nhấn
                        },
                        icon: Icon(Icons.close),
                        label: Text("Return"),
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
              title: Text("Add product"),
              onTap: () {
                _categoryAlert();
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.change_history),
              title: Text("Products list"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.category),
              title: Text("Add category"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Add brand"),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.library_books),
              title: Text("brand list"),
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
              return 'category cannot be empty';
            }
            return null;
          },
          decoration: InputDecoration(hintText: "add category"),
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
            onPressed: () {}, icon: Icon(Icons.close), label: Text('ADD')),
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('CANCEL'))
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}
