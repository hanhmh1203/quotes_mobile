import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final Color color;

  const ListItem({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    'Type ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff00008b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.favorite, color: Color(0xff00008b)),
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.share, color: Color(0xff00008b)),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Image.asset(
                  "assets/images/daunhay.png",
                  width: 20,
                  height: 20,
                  color: Color(0xff00008b),// Điều chỉnh chiều cao cho phù hợp
                ),
              ),
              SizedBox(width: 5), // Khoảng cách ngang
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 25),
                  child: Text(
                    'Where I am, I don\'t know, I\'ll never know, in the silence you don\'t know, you must go on, I can\'t go on, I\'ll go on."',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff00008b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // Chỉ chiếm đủ không gian để chứa nội dung
                children: [
                  Text(
                    'Samuel Beckett',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff00008b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10), // Khoảng cách giữa text và hình ảnh
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Image.asset(
                      "assets/images/daunhay_dong.png",
                      width: 20,
                      height: 20,
                      color: Color(0xff00008b),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
