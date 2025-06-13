import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inprep_ai/core/common/styles/global_text_style.dart' show getTextStyle;
import 'package:inprep_ai/core/utils/constants/icon_path.dart';
import 'package:inprep_ai/features/interview/interview_details/category_details/controller%20/category_details_controller.dart';

class WhatToExpect extends StatelessWidget {
   WhatToExpect({super.key});

  final CategoryDetailsController controller = Get.find<CategoryDetailsController>(); 

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height:800,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.whatToExpect.length,
        itemBuilder: (context, index){
          var data = controller.whatToExpect[index];
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(IconPath.arrowForward, 
                   width: 24,
                   height: 24,
                  ), 
                  SizedBox(
                    width: 10,
                  ), 
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(data, 
                     style: getTextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w400, 
                      color: Color(0xFF212121),
                     ),
                    ),
                  ),
                ],
              ),
            ),
          ); 
        }
        ),
    );
  }
}