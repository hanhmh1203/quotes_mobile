import 'package:flutter/material.dart';
import 'quote_item_widget.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách các màu
    final colors = [
      const Color(0xFFE1BEE7), // Màu tím nhạt
      const Color(0xFFF8BBD0), // Màu hồng nhạt
      const Color(0xFFFFF9C4),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom List Screen'),
      ),
      body: ListView.builder(
        itemCount:4, // Số lượng item trong danh sách
        itemBuilder: (context, index) {
          // Lấy màu theo thứ tự từ danh sách colors
          final color = colors[index % colors.length];
          return QuoteItemWidget(color: color);
        },
      ),
    );
  }
}
