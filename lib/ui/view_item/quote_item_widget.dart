import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_mobile/data/models/quote_model.dart';

import 'quote_item_controller.dart';
import 'quote_view_model.dart';

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
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  // Shadow color with opacity
                  spreadRadius: 2,
                  // How much the shadow spreads
                  blurRadius: 2,
                  // Softness of the shadow
                  offset: const Offset(0, 2), // Offset of the shadow (x, y)
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7, // Chiếm 70% diện tích
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          controller.quoteVM.type,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff00008b),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    if (!itemVM.isMine)
                      Expanded(
                        flex: 1,
                        // Chiếm 15% diện tích (30% còn lại chia đều cho hai cột)
                        child: Obx(
                          () => IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: controller.quoteVM.isFav.value
                                  ? const Color(0xffE55200)
                                  : const Color(0xff00008b),
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
                        child: IconButton(
                          onPressed: () {
                            // Your onPressed function here
                            controller.shareQuote();
                          },
                          icon: Icon(Icons.share, color: Color(0xff00008b)),
                        )),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Image.asset(
                        "assets/images/daunhay.png",
                        width: 40,
                        height: 40,
                        color: const Color(
                            0xff00008b), // Điều chỉnh chiều cao cho phù hợp
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(controller.quoteVM.content,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff00008b),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Image.asset(
                        "assets/images/daunhay_dong.png",
                        width: 40,
                        height: 40,
                        color: const Color(0xff00008b),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(' - ${controller.quoteVM.author} -',
                        style: const TextStyle(
                            fontSize: 20,
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
