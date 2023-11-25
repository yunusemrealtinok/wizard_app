import 'package:get/get.dart';

import '../../home/wizard_model.dart';

class InfoPageController extends GetxController {
  //TODO: Implement InfoPageController
  Wizard wizard = Get.arguments['wizard'];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
