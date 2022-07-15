import 'package:directus/directus.dart';
import 'package:flutter_e_commerce/config/api_config.dart';

class DirectusModule {
  static Directus? _instance;

  Future<Directus> getInstance() async {
    if (_instance == null) {
      await DirectusSingleton.init(baseUrl);
    }
    _instance = DirectusSingleton.instance;
    return _instance!;
  }
}
