import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../core/colors_type.dart';
import '../demo_dialog/dialog_helper.dart';
import '../home_screen_demo/quote_item_widget.dart';
import 'mine_page.dart';

class MineScreen extends GetView<MineController> {
  const MineScreen({super.key});

  @override
  // TODO: implement controller
  MineController get controller => Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    // ('app_name').tr();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('mine').tr(),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
              },
              child: Text("click"),
            ),
            Expanded(
              // Wrap ListView.builder with Expanded to avoid layout issues
              child: Obx(
                    () {
                  print(
                      "FavouriteScreen controller.quotes.length:${controller.quotes.length}");
                  return ListView.builder(
                    itemCount: controller.quotes.length,
                    // Number of items in the list
                    itemBuilder: (context, index) {
                      // Get color in order from the colors list
                      final color = colors[index % colors.length];
                      return QuoteItemWidget(
                        color: color,
                        itemVM: controller.quotes[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogHelper dialogHelper = DialogHelper();
          dialogHelper.openDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
