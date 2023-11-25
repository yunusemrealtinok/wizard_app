import 'package:get/get.dart';

import '../wizard_model.dart';

class WizardProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Wizard.fromJson(map);
      if (map is List) return map.map((item) => Wizard.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Wizard?> getWizard(int id) async {
    final response = await get('wizard/$id');
    return response.body;
  }

  Future<Response<Wizard>> postWizard(Wizard wizard) async =>
      await post('wizard', wizard);
  Future<Response> deleteWizard(int id) async => await delete('wizard/$id');
}
