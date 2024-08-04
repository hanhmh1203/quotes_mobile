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
      child: const Column(
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
                    style: TextStyle(fontSize: 18, color: Color(0xff00008b),fontWeight: FontWeight.bold),
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
                '"\nWhere I am, I don\'t know, I\'ll never know, in the silence you don\'t know, you must go on, I can\'t go on, I\'ll go on."',
                style: TextStyle(fontSize: 20, color: Color(0xff00008b),fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text('Samuel Beckett " ',
                  style: TextStyle(fontSize: 18, color: Color(0xff00008b),fontWeight: FontWeight.bold )),
            ),
          ),
        ],
      ),
    );
  }
}
