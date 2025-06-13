// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:inprep_ai/core/common/styles/global_text_style.dart';
// import 'package:inprep_ai/features/profile_setup.dart/controller/genarated_about_me_controller.dart';
// import 'package:inprep_ai/features/profile_setup.dart/models/generate_about_me.dart';

// class GenaratedAboutMe extends StatelessWidget {
//   GenaratedAboutMe({super.key});

//   final GenaratedAboutMeController genaratedAboutMeController = Get.put(
//     GenaratedAboutMeController(),
//   );

//   @override
//   Widget build(BuildContext context) {
//     // Get the passed Generateaboutme data
//     final Generateaboutme? generateaboutme = Get.arguments;

//     // Set the text in the TextEditingController to the AI-generated about me content
//     genaratedAboutMeController.aboutme.text =
//         generateaboutme!.profile?.generatedAboutMe ?? "No AI-generated content available.";

//     // Calculate the number of lines required to display the content in the TextField
//     int maxLines = _calculateMaxLines(generateaboutme.profile?.generatedAboutMe ?? "");

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "About Me AI Generated",
//           style: getTextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xff212121),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start, // Align content to start
//             crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
//             children: [
//               TextField(
//                 scrollPhysics: NeverScrollableScrollPhysics(),
//                 maxLines: maxLines,
//                 controller: genaratedAboutMeController.aboutme,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   labelText: 'AI Generated About Me',
//                   hintText: 'Your AI generated about me will appear here',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF37B874),
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(15),
//                     borderSide: const BorderSide(
//                       color: Color(0xFF37B874),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20), // Reduced height for better visibility
//               ElevatedButton(
//                 onPressed: () {
//                   // Add a test action to confirm the button works
//                   print("Take Interview button pressed!");
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF37B874), // Visible background color
//                   foregroundColor: Colors.white, // Visible text color
//                   padding: const EdgeInsets.symmetric(vertical: 15), // Button padding
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15), // Consistent border radius
//                   ),
//                 ),
//                 child: const Text(
//                   "Take Interview",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Calculate the number of lines based on the content and text field width
//   int _calculateMaxLines(String text) {
//     final TextPainter textPainter = TextPainter(
//       text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
//       maxLines: 1000,
//       textDirection: TextDirection.ltr,
//     );

//     // Layout the text and determine the height
//     textPainter.layout(maxWidth: Get.width - 40); // Account for padding

//     // Calculate the number of lines
//     int lines = (textPainter.size.height / 24).ceil(); // Estimate for line height
//     return lines > 0 ? lines : 1; // Ensure at least 1 line
//   }
// }


// Updated File: lib/features/profile_setup.dart/screens/generated_about_me.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inprep_ai/core/common/styles/global_text_style.dart';
import 'package:inprep_ai/features/profile_setup.dart/controller/genarated_about_me_controller.dart';
import 'package:inprep_ai/features/profile_setup.dart/models/generate_about_me.dart';
import 'package:inprep_ai/features/profile_setup.dart/screen.dart/record_screen.dart';

class GenaratedAboutMe extends StatelessWidget {
  GenaratedAboutMe({super.key});

  final GenaratedAboutMeController genaratedAboutMeController = Get.put(
    GenaratedAboutMeController(),
  );

  @override
  Widget build(BuildContext context) {
    // Get the passed Generateaboutme data
    final Generateaboutme? generateaboutme = Get.arguments;

    // Set the text in the TextEditingController to the AI-generated about me content
    genaratedAboutMeController.aboutme.text =
        generateaboutme?.profile?.generatedAboutMe ?? "No AI-generated content available.";

    // Calculate the number of lines required to display the content in the TextField
    int maxLines = _calculateMaxLines(generateaboutme?.profile?.generatedAboutMe ?? "");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About Me AI Generated",
          style: getTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xff212121),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                maxLines: maxLines,
                readOnly: true,
                controller: genaratedAboutMeController.aboutme,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'AI Generated About Me',
                  hintText: 'Your AI generated about me will appear here',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFF37B874),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0xFF37B874),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to video recording screen and wait for result
                  final videoPath = await Get.to(() => VideoRecordingScreen());
                  if (videoPath != null) {
                    debugPrint("Video recorded and saved at: $videoPath");
                    Get.snackbar(
                      'Success',
                      'Video recorded successfully at: $videoPath',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF37B874),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Take Interview",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Calculate the number of lines based on the content and text field width
  int _calculateMaxLines(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 16)),
      maxLines: 1000,
      textDirection: TextDirection.ltr,
    );

    // Layout the text and determine the height
    textPainter.layout(maxWidth: Get.width - 40); // Account for padding

    // Calculate the number of lines
    int lines = (textPainter.size.height / 24).ceil(); // Estimate for line height
    return lines > 0 ? lines : 1; // Ensure at least 1 line
  }
}