import 'package:get/get.dart';
import 'package:wizard_app/app/managers/hive_manager.dart';
import 'package:wizard_app/app/modules/home/controllers/home_controller.dart';

import '../../../routes/app_pages.dart';
import '../../home/wizard_model.dart';

class FavoritesPageController extends GetxController {
  RxList<Wizard> wizards = HiveManager.instance.getFavorites.obs;

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

  void updateWizards() {
    wizards.value = HiveManager.instance.getFavorites;
  }

  void onTapFavoriteCard(int index) {
    Get.toNamed(Routes.INFO_PAGE,
        arguments: {'wizard': wizards.value.elementAt(index)});
  }

  Future<void> onTapFavoriteStar(int index) async {
    HomeController homeController = Get.put(HomeController());
    await HiveManager.instance.deleteFavorite(wizards.elementAt(index));
    updateWizards();
    homeController.clearAndUpdateFavorite();
  }
}
