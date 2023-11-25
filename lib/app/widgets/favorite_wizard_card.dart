import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteWizardCard extends StatelessWidget {
  const FavoriteWizardCard(
      {super.key,
      required this.wizardName,
      required this.imagePath,
      required this.onTap,
      required this.deleteFavorite,
      required this.isNetwork});
  final String wizardName;
  final String imagePath;
  final bool isNetwork;
  final Function() onTap;
  final Function() deleteFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: isNetwork
                      ? Image.asset(imagePath).image
                      : NetworkImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 280.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 30.0.w,
                  ),
                  Text(
                    wizardName,
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    onPressed: deleteFavorite,
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
