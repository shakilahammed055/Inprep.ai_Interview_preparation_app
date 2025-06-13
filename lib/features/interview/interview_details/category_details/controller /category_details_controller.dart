import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  var title = ''.obs;
  var description =
      'Lorem ipsum dolor sit amet consectetur. Mi accumsan orci aenean libero aenean. In risus purus ipsum nibh leo. Malesuada fames enim feugiat enim. Dolor aliquam libero facilisi nunc eget justo ante.'
          .obs;

  var name = ''.obs;
  var img = ''.obs;
  var duration = 0.obs;
  var difficulty = ''.obs;
  var questionType = ''.obs;
  var id = ''.obs;
  var interviewId = ''.obs;

  var whatToExpect = <String>[].obs;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as List<dynamic>;

    name.value = args[0];
    img.value = args[1];
    duration.value = args[2];
    difficulty.value = args[3];
    questionType.value = args[4];
    description.value = args[5];
    whatToExpect.value = (args[6] as List?)!.map((e) => e.toString()).toList();
    id.value = args[7];
    interviewId.value = args[8];

  }

  List<Map<String, dynamic>> whattoexpect = [
     {
      'title': '5 technical coding questions', 
     }, 
     {
      'title': '3 problem-solving exercises', 
     }, 
     {
      'title': 'Timed responses: 2 minutes per question', 
     }, 
     {
      'title': 'Feedback will be provided after each question', 
     }, 
  ]; 
}