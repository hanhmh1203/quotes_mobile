import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'left_menu_page.dart';

class LeftMenuScreen extends GetView<LeftMenuController> {
  const LeftMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 50),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home), // Biểu tượng ở bên trái của mục
            title: Text('Home'), // Nội dung văn bản của mục
            onTap: () {
              Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
              // Thêm mã xử lý sự kiện onTap tại đây!
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
              // Thêm mã xử lý sự kiện onTap tại đây!
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact Us'),
            onTap: () {
              Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
              // Thêm mã xử lý sự kiện onTap tại đây!
            },
          ),
        ],
      ),
    );
  }
}
