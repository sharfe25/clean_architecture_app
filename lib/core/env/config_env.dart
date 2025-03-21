
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'env_model.dart';

class ConfigENV {
  ConfigENV.internal();

  late EnvModel appEnv;
  static final ConfigENV _instance = ConfigENV.internal();
  static ConfigENV get intance => _instance;
  EnvModel get getAppEnv => appEnv;

  Future<void> loadEnvironment({String fileName = '.env' }) async {
    await dotenv.load(fileName: fileName);

    appEnv = EnvModel(
      apiUrl: dotenv.env['API_URL'] ?? '',
      envDeploy: dotenv.env['ENV'] ?? '',
    );
  }
}
