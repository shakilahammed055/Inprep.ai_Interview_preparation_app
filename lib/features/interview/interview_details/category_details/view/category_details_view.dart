import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inprep_ai/features/interview/interview_details/category_details/controller%20/category_details_controller.dart' show CategoryDetailsController;
import 'package:inprep_ai/features/interview/interview_details/category_details/widgets/category_details_header.dart' show CategoryDetailsHeader;
import 'package:inprep_ai/features/interview/interview_details/category_details/widgets/overview_widget.dart';
import 'package:inprep_ai/features/interview/interview_details/category_details/widgets/start_mock_interview_container.dart';
import 'package:inprep_ai/features/interview/interview_details/category_details/widgets/what_to_expect.dart' show WhatToExpect;
import 'package:inprep_ai/features/interview/interview_details/start_interview/view/start_interview_view.dart' show StartInterviewView;

class CategoryDetailsView extends StatelessWidget {
   CategoryDetailsView({super.key});

  final CategoryDetailsController controller = Get.put(CategoryDetailsController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CategoryDetailsHeader(), 
          SizedBox(
            height: 40,
          ), 
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    StartMockInterviewContainer(onTap: (){
                      Get.to(()=> StartInterviewView(),
                       arguments: 
                       [
                        controller.id.value, 
                        controller.interviewId.value, 
                       ]
                      ); 
                    }), 
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OverviewWidget(title: "${controller.duration.value.toString()} min", description: 'Duration'),
                        OverviewWidget(title: controller.difficulty.value, description: 'Difficulty Level'),
                        OverviewWidget(title: controller.questionType.value, description: 'Type'),
                      ],
                    ), 
                    SizedBox(
                      height: 40,
                    ), 
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description", 
                       style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                       ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ), 
                    Text(controller.description.value, 
                     textAlign: TextAlign.justify,
                     style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212121),
                     ),
                    ),
                    SizedBox(
                      height: 40,
                    ), 
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What to Expect", 
                       style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF212121),
                       ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ), 
                    WhatToExpect(), 
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}