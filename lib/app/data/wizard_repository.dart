import 'package:wizard_app/app/data/wizard.dart';

import '../modules/home/wizard_model.dart';

abstract class WizardRepository {
  List<Wizard> getWizardList();
}

class MockWizardRepository extends WizardRepository {
  @override
  List<Wizard> getWizardList() {
    /* List<Wizard> wizardList = [];
    for(var element in result){
      wizardList.add(Wizard.fromJson(element));
    }*/
    List<Wizard> wizardList = result.map((e) => Wizard.fromJson(e)).toList();
    return wizardList;
  }
}
