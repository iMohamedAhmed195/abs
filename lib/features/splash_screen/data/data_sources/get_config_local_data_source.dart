import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/features/splash_screen/data/models/config_response_model.dart';

import '../../../../exports.dart';

abstract class GetConfigurationLocalDataSource {
  Future< ResponseModel> storeData(ConfigData configData);
  Future< ResponseModel> getData();
}

class GetConfigurationLocalDataSourceImpl extends GetConfigurationLocalDataSource {
  CacheAbstract cache;
  GetConfigurationLocalDataSourceImpl({required this.cache});

  @override
  Future< ResponseModel> getData() => cache.cacheRead(AppPrefs.configKey, fromJson: ConfigData.fromJson);

  @override
  Future< ResponseModel> storeData(ConfigData configData) =>cache.cacheWrite(AppPrefs.configKey, configData.toJson());
}
