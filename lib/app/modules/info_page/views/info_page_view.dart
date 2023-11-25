import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/constants.dart';
import '../controllers/info_page_controller.dart';

class InfoPageView extends GetView<InfoPageController> {
  const InfoPageView({Key? key}) : super(key: key);
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
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: controller.wizard.id!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: controller.wizard.image!.isEmpty
                    ? Image.asset(
                        controller.wizard.getImageUrlFromHouse,
                        width: 450.w,
                        height: 450.h,
                        fit: BoxFit.fitHeight,
                      )
                    : CachedNetworkImage(
                        imageUrl: controller.wizard.getImageUrlFromHouse,
                        width: 450.w,
                        height: 450.h,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                                color: Colors.black),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Name: ',
                  style: kInfoPageTextStyle,
                ),
                Text(
                  controller.wizard.name!,
                  style: kIngoPageModifiedTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Species: ',
                  style: kInfoPageTextStyle,
                ),
                Text(
                  controller.wizard.species!,
                  style: kIngoPageModifiedTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Gender: ',
                  style: kInfoPageTextStyle,
                ),
                Text(
                  controller.wizard.gender!,
                  style: kIngoPageModifiedTextStyle,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  ' Actor: ',
                  style: kInfoPageTextStyle,
                ),
                Text(
                  controller.wizard.actor!.isNotEmpty
                      ? controller.wizard.actor!
                      : 'Unknown',
                  style: kIngoPageModifiedTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
