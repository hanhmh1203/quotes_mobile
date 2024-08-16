import 'package:flutter/material.dart';
import 'package:quotes_mobile/ui/mine/demo_crud_mine/quote_model.dart';

class QuoteItemWidget extends StatelessWidget {
  final Color color;
  final QuoteModel itemVM;

  const QuoteItemWidget({
    required this.color,
    required this.itemVM,
    Key? key,
  }) : super(key: key);

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
        borderRadius: BorderRadius.circular(8),
        // Removed the boxShadow
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    itemVM.type,
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
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Color(0xff00008b),
                  ),
                  onPressed: () {
                    // Add your favorite toggle logic here
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.share,
                  color: Color(0xff00008b),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Image.asset(
                  "assets/images/daunhay.png",
                  width: 40,
                  height: 40,
                  color: const Color(0xff00008b),
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 25),
                  child: Text(
                    itemVM.quote,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff00008b),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4),
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
              child: Text(
                '  ${itemVM.author} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff00008b),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
