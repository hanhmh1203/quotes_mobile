import 'package:flutter/material.dart';
import 'package:quotes_mobile/ui/home_screen_demo/item_view_model.dart';

class QuoteItemWidget extends StatelessWidget {
  final Color color;


  QuoteItemWidget({required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    QuoteViewModel itemVM = QuoteViewModel();
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
                    'Type ',
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
                child: Icon(Icons.favorite, color: Color(0xff00008b)),
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
            child: Text(
                itemVM.content,
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
              child: Text('Samuel Beckett " ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff00008b),
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
