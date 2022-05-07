import 'package:flutter/material.dart';

import '../pages/appbar_message_alert_page/navigation_drawer_menu.dart';

class AppBarUniv extends StatefulWidget {
  const AppBarUniv({Key? key}) : super(key: key);

  @override
  State<AppBarUniv> createState() => _AppBarUnivState();
}

class _AppBarUnivState extends State<AppBarUniv> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF2E2C34),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logobrancamenos.png',
            fit: BoxFit.contain,
            height: 32,
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
          // onPressed: () => showDialog<String>(
          //   context: context,
          //   builder: (BuildContext context) => Dialog(
          //     child: Container(
          //       height: 700,
          //       width: 300,
          //       // child: NavigationDrawerMenu(),
          //     ),
          //   ),
          // ),
        )
      ],
    );
  }
}
