import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/constants.dart';
import '../../../widgets/favorite_wizard_card.dart';
import '../controllers/favorites_page_controller.dart';

class FavoritesPageView extends GetView<FavoritesPageController> {
  const FavoritesPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text(
            'Alohomora',
            style: TextStyle(fontSize: 45, color: kColorTitle),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: controller.wizards.length,
          itemBuilder: (context, index) {
            return FavoriteWizardCard(
              wizardName: controller.wizards[index].name!,
              imagePath: controller.wizards[index].getImageUrlFromHouse,
              onTap: () {
                controller.onTapFavoriteCard(index);
              },
              deleteFavorite: () {
                controller.onTapFavoriteStar(index);
              },
              isNetwork: controller.wizards[index].image!.isEmpty,
            );
          },
        ));
  }
}
