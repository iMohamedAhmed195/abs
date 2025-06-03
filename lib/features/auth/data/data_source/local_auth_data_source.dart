import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import '../../../../exports.dart';

abstract class AuthLocalDataSource {
  Future<ResponseModel> cacheUser({required UserData user});
  Future<ResponseModel> getUser();
  Future<ResponseModel> clearUser();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  CacheAbstract cache;
  AuthLocalDataSourceImpl({required this.cache});

  @override
  Future<ResponseModel> cacheUser({required UserData user}) =>
      cache.cacheWrite(AppPrefs.prefsUserKey, user.toJson(), afterCaching: () {
        AppPrefs.user = user;
        AppPrefs.token = user.token;
      });

  @override
  Future<ResponseModel> getUser() =>
      cache.cacheRead<UserData>(AppPrefs.prefsUserKey, fromJson: UserData.fromJson, afterCaching: (UserData data) {
        AppPrefs.user = data;
        AppPrefs.token = data.token;
      });

  @override
  Future<ResponseModel> clearUser() => cache.cacheRemove(
        key: AppPrefs.prefsUserKey,
        afterRemoving: () {
          AppPrefs.user = null;
          AppPrefs.token = null;
        },
      );
}
