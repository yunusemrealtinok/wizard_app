import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wizard_app/app/modules/home/controllers/home_controller.dart';
import 'package:wizard_app/app/widgets/wizard_list_item.dart';

import '../modules/home/wizard_model.dart';
import '../routes/app_pages.dart';

class WizardList extends StatefulWidget {
  WizardList(
      {super.key,
      required this.wizardModelList,
      required this.onTapStar,
      required this.isFavoriteList});
  HomeController homeController = Get.put(HomeController());
  final List<Wizard> wizardModelList;
  final Function(int) onTapStar;
  final List<bool> isFavoriteList;
  @override
  State<WizardList> createState() => _WizardListState();
}

class _WizardListState extends State<WizardList> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      widget.homeController.refreshed.value;
      return GridView.builder(
        itemCount: widget.wizardModelList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => WizardListItem(
            wizard: widget.wizardModelList[index],
            onTap: (wizard) {
              Get.toNamed(Routes.INFO_PAGE, arguments: {'wizard': wizard});
            },
            onTapStar: () {
              widget.onTapStar(index);
            },
            isFavorite: widget.isFavoriteList[index],
            onTapArrow: () {
              Get.toNamed(Routes.FAVORITES_PAGE);
            }),
      );
    });
  }
}
