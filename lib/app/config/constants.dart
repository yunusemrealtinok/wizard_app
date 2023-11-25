import 'package:flutter/material.dart';

const kColorTitle = Color(0xffd3a625);
const kColorTitleImg = Color(0xffEFEDE5);
const kColorGryffindor = Color(0xffc50000);
const kColorSlytherin = Color(0xff009403);
const kColorHufflepuff = Color(0xfffff4b1);
const kColorRavenclaw = Color(0xff9ba2ff);
const kColorWizardItemDefault = Colors.white;

const TextStyle kWizardNameTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 27,
);

const TextStyle kInfoPageTextStyle = TextStyle(
  color: kColorTitle,
  fontSize: 35,
);
TextStyle kIngoPageModifiedTextStyle = kInfoPageTextStyle.copyWith(
  color: Colors.white,
);

/*
   Color getColorFromHouse(String house) {
    if (_houseColorMap.containsKey(house)) {
      return _houseColorMap[house] ?? Colors.white;
    } else {
      return Colors.white;
    }
  }

   final Map<String, String> _houseImageMap = {
    "Gryffindor": 'images/gryffindor.png',
    "Slytherin": 'images/slytherin.png',
    "Hufflepuff": 'images/hufflepuf.png',
    "Ravenclaw": 'images/ravenclaw.png',
  };

   Widget getImageFromHouse(String house, String image) {
    if (_houseImageMap.containsKey(house) && image.isEmpty) {
      return SizedBox(
        width: 80.w,
        height: 80.h,
        child: Image.asset(_houseImageMap[house] ?? 'images/deathly.png'),
      );
    } else if (house.isEmpty) {
      return SizedBox(
        width: 80.w,
        height: 80.h,
        child: Image.asset('images/deathly.png'),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: image,
        width: 80.w,
        height: 80.h,
        fit: BoxFit.fitHeight,
        placeholder: (context, url) =>
            const CircularProgressIndicator(color: Colors.black),
      );
    }
  }*/
