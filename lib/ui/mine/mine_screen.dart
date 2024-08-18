import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors_type.dart';
import '../demo_dialog/dialog_helper.dart';

import '../view_item/quote_item_mine_widget.dart';
import '../view_item/view_item_page.dart';
import 'mine_controller.dart';

class MineScreen extends GetView<MineController> {
  const MineScreen({super.key});

  @override
  MineController get controller => Get.put(MineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('mine').tr(),
      // ),
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     // Example button action, can be customized
          //   },
          //   child: const Text("click"),
          // ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.quotes.length,
                itemBuilder: (context, index) {
                  final color = colors[index % colors.length];
                  return QuoteItemMineWidget(
                    color: color,
                    itemVM: controller.quotes[index],
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DialogHelper().openDialog(context, controller.addQuote);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
