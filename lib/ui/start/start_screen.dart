import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/ui/left_menu/left_menu_page.dart';

import '../../core/colors_type.dart';
import '../home_screen_demo/quote_item_widget.dart';
import 'start_page.dart';

class StartScreen extends GetView<StartController> {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    controller.parseJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text('app_name').tr(),
      ),
      drawer: LeftMenuScreen(), // Sử dụng CustomDrawer
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              controller.loadDataQuote();
            },
            child: Text("click"),
          ),
          Expanded( // Wrap ListView.builder with Expanded to avoid layout issues
            child: Obx(
                  () {
                return ListView.builder(
                  itemCount: controller.quotes.length, // Number of items in the list
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
      )
    );
  }
}
