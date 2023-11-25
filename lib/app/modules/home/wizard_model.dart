import 'package:hive/hive.dart';

import '../../config/assets.dart';
import '../../config/constants.dart';
part 'wizard_model.g.dart';

@HiveType(typeId: 0)
class Wizard {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<String>? alternateNames;
  @HiveField(3)
  String? species;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? house;
  @HiveField(6)
  String? dateOfBirth;
  @HiveField(7)
  int? yearOfBirth;
  @HiveField(8)
  bool? wizard;
  @HiveField(9)
  String? ancestry;
  @HiveField(10)
  String? eyeColour;
  @HiveField(11)
  String? hairColour;
  @HiveField(12)
  Wand? wand;
  @HiveField(13)
  String? patronus;
  @HiveField(14)
  bool? hogwartsStudent;
  @HiveField(15)
  bool? hogwartsStaff;
  @HiveField(16)
  String? actor;
  @HiveField(17)
  bool? alive;
  @HiveField(18)
  String? image;

  Wizard(
      {this.id,
      this.name,
      this.alternateNames,
      this.species,
      this.gender,
      this.house,
      this.dateOfBirth,
      this.yearOfBirth,
      this.wizard,
      this.ancestry,
      this.eyeColour,
      this.hairColour,
      this.wand,
      this.patronus,
      this.hogwartsStudent,
      this.hogwartsStaff,
      this.actor,
      this.alive,
      this.image});

  get getColorFromHouse {
    switch (house) {
      case "Gryffindor":
        return kColorGryffindor;
      case "Hufflepuff":
        return kColorHufflepuff;
      case "Slytherin":
        return kColorSlytherin;
      case "Ravenclaw":
        return kColorRavenclaw;
      default:
        kColorWizardItemDefault;
    }
  }

  get getImageUrlFromHouse {
    if (house?.isEmpty ?? true) {
      return kWeaselDraco;
    }

    if (image!.isEmpty) {
      switch (house) {
        case 'Gryffindor':
          return kGriffindorHouseImg;
        case 'Hufflepuff':
          return kHufflepuffHouseImg;
        case 'Slytherin':
          return kSlytherinHouseImg;
        case 'Ravenclaw':
          return kRavenClawHouseImg;
        default:
          return kDeathlyImg;
      }
    } else {
      return image!;
    }
  }

  Wizard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternateNames = json['alternate_names'].cast<String>();
    species = json['species'];
    gender = json['gender'];
    house = json['house'];
    dateOfBirth = json['dateOfBirth'];
    yearOfBirth = json['yearOfBirth'];
    wizard = json['wizard'];
    ancestry = json['ancestry'];
    eyeColour = json['eyeColour'];
    hairColour = json['hairColour'];
    wand = json['wand'] != null ? Wand?.fromJson(json['wand']) : null;
    patronus = json['patronus'];
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor'];
    alive = json['alive'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alternate_names'] = alternateNames;
    data['species'] = species;
    data['gender'] = gender;
    data['house'] = house;
    data['dateOfBirth'] = dateOfBirth;
    data['yearOfBirth'] = yearOfBirth;
    data['wizard'] = wizard;
    data['ancestry'] = ancestry;
    data['eyeColour'] = eyeColour;
    data['hairColour'] = hairColour;
    if (wand != null) {
      data['wand'] = wand?.toJson();
    }
    data['patronus'] = patronus;
    data['hogwartsStudent'] = hogwartsStudent;
    data['hogwartsStaff'] = hogwartsStaff;
    data['actor'] = actor;
    data['alive'] = alive;
    data['image'] = image;
    return data;
  }
}

@HiveType(typeId: 1)
class Wand {
  @HiveField(0)
  String? wood;
  @HiveField(1)
  String? core;
  @HiveField(2)
  double? length;

  Wand({this.wood, this.core, this.length});

  Wand.fromJson(Map<String, dynamic> json) {
    wood = json['wood'];
    core = json['core'];
    length = json['length']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['wood'] = wood;
    data['core'] = core;
    data['length'] = length;
    return data;
  }
}
