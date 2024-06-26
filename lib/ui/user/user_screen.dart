import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';
import '/ui/auth/auth_manager.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  static const routeName = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("La Beauté"),

        automaticallyImplyLeading: true,
        // leading: BackButton(
        //     // onPressed: () {
        //     //   Navigator.of(context).pop();
        //     // },
        //     ),
        foregroundColor: Color(0xFF820233),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // Thực hiện hành động khi nhấn nút yêu thích
        //     },
        //     icon: const Icon(Icons.favorite, color: Colors.redAccent),
        //   ),
        // ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: _TopPortion(),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Thu Thảo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.of(context).popAndPushNamed('/');

                          context.read<AuthManager>().logout();
                        },
                        heroTag: 'VIP',
                        elevation: 0,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        label: const Text(
                          "Đăng xuất",
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _ProfileInfoRow()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("0234437654", 'Phone'),
    ProfileInfoItem("thuthao@gmail.com", 'Email'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
          )
        ],
      );
}

class ProfileInfoItem {
  final String title;
  final String value;
  const ProfileInfoItem(this.title, this.value);
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF540139), Color(0xFF820233)]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('./images/avatarapp.jpg'),
                    // backgroundColor: Colors.grey,
                    // child: Icon(
                    //   Icons.person,
                    //   color: Colors.white,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
