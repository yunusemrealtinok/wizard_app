import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/constants.dart';
import '../modules/home/wizard_model.dart';

class WizardListItem extends StatelessWidget {
  const WizardListItem(
      {super.key,
      required this.wizard,
      required this.onTap,
      required this.onTapStar,
      required this.isFavorite,
      required this.onTapArrow});
  final Wizard wizard;
  final Function(Wizard) onTap;
  final Function() onTapStar;
  final bool isFavorite;
  final Function() onTapArrow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(wizard);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.w),
        ),
        elevation: 4,
        shadowColor: kColorTitle,
        color: wizard.getColorFromHouse,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    wizard.name ?? 'N/A',
                    style: kWizardNameTextStyle,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: wizard.id!,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: wizard.image!.isEmpty
                        ? Image.asset(
                            wizard.getImageUrlFromHouse,
                            width: 110.w,
                            height: 110.h,
                            fit: BoxFit.fitHeight,
                          )
                        : CachedNetworkImage(
                            imageUrl: wizard.getImageUrlFromHouse,
                            width: 110.w,
                            height: 110.h,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                                    color: Colors.black),
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, left: 75),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(
                        size: 35,
                        Icons.star,
                        color: isFavorite ? Colors.orange : Colors.white,
                      ),
                      onPressed: onTapStar,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: const Icon(
                          size: 35,
                          Icons.lock,
                          color: Colors.black,
                        ),
                        onPressed: onTapArrow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
