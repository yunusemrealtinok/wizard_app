import 'package:hive_flutter/adapters.dart';

import '../modules/home/wizard_model.dart';

class HiveManager {
  HiveManager._();

  static HiveManager instance = HiveManager._();

  late Box<Wizard> wizardBox;

  Future<void> init() async {
    await Hive.initFlutter();
    await openBoxes();
  }

  Future<void> openBoxes() async {
    Hive.registerAdapter(WizardAdapter());
    Hive.registerAdapter(WandAdapter());

    wizardBox = await Hive.openBox<Wizard>('wizard');
  }
}

extension WizardExtension on HiveManager {
  List<Wizard> get getFavorites {
    return wizardBox.values.toList();
  }

  Future<void> addFavorite(Wizard wizardModel) async {
    await wizardBox.add(wizardModel);
  }

  Future<void> deleteFavorite(Wizard wizardModel) async {
    for (var entry in wizardBox.toMap().entries) {
      if (entry.value == wizardModel) {
        await wizardBox.delete(entry.key);
      }
    }
  }
}
