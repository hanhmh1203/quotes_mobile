import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/ui/start/start_controller.dart';

import 'left_menu_page.dart';

class LeftMenuScreen extends GetView<LeftMenuController> {
  @override
  final LeftMenuController controller = Get.put(LeftMenuController());

  LeftMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            const Text(
              'quote_type',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontStyle: FontStyle.italic),
            ).tr(),
            Obx(() => Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    // Add this to prevent ListView.builder from taking infinite height
                    physics: AlwaysScrollableScrollPhysics(),
                    // Disable scrolling of ListView.builder
                    itemCount: controller.types.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.label), // Use a suitable icon
                        title: Text(controller.types[index].type.toUpperCase()),
                        onTap: () {
                          print("go back");
                          // StartController controller = Get.find();
                          controller.clickItem(
                              typeModel: controller.types[index]);
                          // Get.back();
                          Navigator.pop(context);
                          // Close drawer when an item is tapped
                          // Handle onTap event here!
                        },
                      );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   // TODO: implement build
//   return Drawer(
//     child: ListView(
//       padding: EdgeInsets.only(top: 50),
//       children: <Widget>[
//         ListTile(
//           leading: Icon(Icons.home), // Biểu tượng ở bên trái của mục
//           title: Text('Home'), // Nội dung văn bản của mục
//           onTap: () {
//             Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
//             // Thêm mã xử lý sự kiện onTap tại đây!
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.settings),
//           title: Text('Settings'),
//           onTap: () {
//             Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
//             // Thêm mã xử lý sự kiện onTap tại đây!
//           },
//         ),
//         ListTile(
//           leading: Icon(Icons.contacts),
//           title: Text('Contact Us'),
//           onTap: () {
//             Navigator.pop(context); // Đóng drawer khi nhấn vào mục này
//             // Thêm mã xử lý sự kiện onTap tại đây!
//           },
//         ),
//       ],
//     ),
//   );
// }
}
