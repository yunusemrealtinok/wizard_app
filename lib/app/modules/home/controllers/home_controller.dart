import 'package:get/get.dart';
import 'package:wizard_app/app/managers/hive_manager.dart';
import 'package:wizard_app/app/modules/favorites_page/controllers/favorites_page_controller.dart';

import '../../../data/wizard_repository.dart';
import '../wizard_model.dart';

class HomeController extends GetxController {
  final MockWizardRepository mockWizardRepository = MockWizardRepository();

  RxList<Wizard> wizardModelList = <Wizard>[].obs;

  RxList<bool> isFavoriteList = <bool>[].obs;

  RxBool refreshed = false.obs;

  @override
  void onInit() {
    wizardModelList.value = mockWizardRepository.getWizardList();
    isFavoriteList.clear();
    for (var element in wizardModelList) {
      isFavoriteList.add(
        HiveManager.instance.getFavorites.contains(element),
      );
    }

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

  void clearAndUpdateFavorite() {
    isFavoriteList.clear();
    for (var element in wizardModelList) {
      isFavoriteList.add(
        HiveManager.instance.getFavorites.contains(element),
      );
    }
  }

  Future<void> onTapFavorite(int index) async {
    FavoritesPageController favoritesPageController =
        Get.put(FavoritesPageController());
    refreshed.value = true;
    if (isFavoriteList[index] == true) {
      await HiveManager.instance.deleteFavorite(wizardModelList[index]);
      isFavoriteList[index] == false;
    } else {
      await HiveManager.instance.addFavorite(wizardModelList[index]);
      isFavoriteList[index] == true;
    }
    refreshed.value = false;
    clearAndUpdateFavorite();
    favoritesPageController.updateWizards();
  }
}
