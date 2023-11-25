import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wizard_app/app/widgets/app_title.dart';
import 'package:wizard_app/app/widgets/wizard_list.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppTitle(),
          Expanded(
            child: WizardList(
              wizardModelList: controller.wizardModelList.value,
              onTapStar: controller.onTapFavorite,
              isFavoriteList: controller.isFavoriteList.value,
            ),
          ),
        ],
      ),
    );
  }
}
