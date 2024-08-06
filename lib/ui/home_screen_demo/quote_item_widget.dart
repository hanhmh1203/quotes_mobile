import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';
import 'package:quotes_mobile/ui/home_screen_demo/item_view_model.dart';
import 'package:quotes_mobile/ui/home_screen_demo/quote_item_controller.dart';

class QuoteItemWidget extends StatelessWidget {
  final Color color;

  final QuoteModel itemVM;

  QuoteItemWidget({required this.color, required this.itemVM, super.key});

  @override
  Widget build(BuildContext context) {
    QuoteViewModel viewModel = QuoteViewModel.fromQuoteModel(itemVM);
    // QuoteItemController controller =
    //     Get.put(QuoteItemController(viewModel), tag: itemVM.getKey());
    return GetBuilder<QuoteItemController>(
        tag: itemVM.getKey(),
        init: QuoteItemController(viewModel),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.3),
                  color.withOpacity(0.7),
                  color.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7, // Chiếm 70% diện tích
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          controller.quoteVM.type,
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff00008b),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      // Chiếm 15% diện tích (30% còn lại chia đều cho hai cột)
                      child: Obx(
                        () => IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: controller.quoteVM.isFav.value
                                ? Color(0xffE55200)
                                : Color(0xff00008b),
                          ),
                          onPressed: () {
                            // Your onPressed function here
                            controller.toggleFavorite();
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      // Chiếm 15% diện tích (30% còn lại chia đều cho hai cột)
                      child: Icon(Icons.share, color: Color(0xff00008b)),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(controller.quoteVM.content,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff00008b),
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(controller.quoteVM.author,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff00008b),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
