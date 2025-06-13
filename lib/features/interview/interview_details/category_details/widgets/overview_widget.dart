import 'package:flutter/cupertino.dart';
import 'package:inprep_ai/core/common/styles/global_text_style.dart';

class OverviewWidget extends StatelessWidget {
  final String title;
  final String description;
  const OverviewWidget({super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      decoration: BoxDecoration(
        color: Color(0xFFEBF8F1), 
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(

          vertical: 10,
        ),
        child: Column(
          children: [
            Text(title,
              style: getTextStyle(
                color: Color(0xFF37B874),
                fontSize: 14, 
                fontWeight: FontWeight.w500
              ),
            ), 
            SizedBox(
              height: 10,
            ), 
            Text(description, 
             style: getTextStyle(
              color: Color(0xFF676768), 
              fontSize: 12, 
              fontWeight: FontWeight.w400, 
             ),
            )
          ],
        ),
      ),
    );
  }
}