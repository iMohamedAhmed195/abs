import 'package:new_ilearn/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/login_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/register_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/resend_code_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import 'package:new_ilearn/features/auth/domain/repositories/auth_repo.dart';
import '../../../../config/constants/app_prefs.dart';
import '../../../../exports.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepoImpl({required this.authRemoteDataSource, required this.authLocalDataSource});

  @override
  Future<Either<Failure, ResponseModel>> login({required LoginRequestModel loginRequestModel}) =>
      executeImpl<UserData>(() => authRemoteDataSource.login(loginRequestModel: loginRequestModel),
          localWrite: (data) => authLocalDataSource.cacheUser(user: data..user?.fcm = loginRequestModel.deviceToken));
  @override
  Future<Either<Failure, ResponseModel>> loginWithGoogle({required String token}) =>
      executeImpl<UserData>(() => authRemoteDataSource.loginWithGoogle(token: token),
          localWrite: (data) => authLocalDataSource.cacheUser(user: data..user?.fcm = 'loginRequestModel.deviceToken')
      );
  @override
  Future<Either<Failure, ResponseModel>> loginWithFace({required String token}) =>
      executeImpl<UserData>(() => authRemoteDataSource.loginWithFace(token: token),
          localWrite: (data) => authLocalDataSource.cacheUser(user: data..user?.fcm = 'loginRequestModel.deviceToken')
      );
  @override
  Future<Either<Failure, ResponseModel>> logout() => executeImpl<Null>(
        () => authRemoteDataSource.logout(),
        localWrite: (data) => authLocalDataSource.clearUser(),
      );
  @override
  Future<Either<Failure, ResponseModel>> register({required RegisterRequestModel registerRequestModel}) => executeImpl(
        () => authRemoteDataSource.register(registerRequestModel: registerRequestModel),
  );

  @override
  Future<Either<Failure, ResponseModel>> verify({required VerifyRequestModel verifyRequestModel}) => executeImpl(
        () => authRemoteDataSource.verify(verifyRequestModel: verifyRequestModel),
      );
  @override
  Future<Either<Failure, ResponseModel>> forgetPassword({required EnterEmailRequestModel enterEmailRequestModel}) =>
      executeImpl(
            () => authRemoteDataSource.forgetPassword(enterEmailRequestModel: enterEmailRequestModel),
      );

  @override
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({required VerifyRequestModel verifyRequestModel}) => executeImpl(
        () => authRemoteDataSource.verifyForgetPassword(verifyRequestModel: verifyRequestModel),
      );

  @override
  Future<Either<Failure, ResponseModel>> resetPassword({required ResetPasswordRequestModel resetPasswordRequestModel}) =>
      executeImpl(
        () => authRemoteDataSource.resetPassword(resetPasswordRequestModel: resetPasswordRequestModel),
      );
  @override
  Future<Either<Failure, ResponseModel>> reSendCode({required ReSendRequestModel resendRequestModel}) => executeImpl(
        () => authRemoteDataSource.reSendCode(resendRequestModel: resendRequestModel),
  );
  @override
  Future<Either<Failure, ResponseModel>> editProfile(
          {required UserModel userEdit}) =>
      executeImpl<UserData>(() => authRemoteDataSource.editProfile(userEdit:userEdit), localWrite: (data) async {
        return authLocalDataSource.cacheUser(user: data..token=AppPrefs.token);
      });

  // @override
  // Future<Either<Failure, ResponseModel>> deleteAccount({required int accountId}) =>
  //     executeImpl<Null>(() => authRemoteDataSource.deleteAccount(accountId: accountId), localWrite: (data) async {
  //       return authLocalDataSource.clearUser();
  //     });






  //
  // @override
  // Future<Either<Failure, ResponseModel>> changeNumber({required EnterEmailRequestModel EnterEmailRequestModel}) =>
  //     executeImpl(
  //       () => authRemoteDataSource.changeNumber(EnterEmailRequestModel: EnterEmailRequestModel),
  //     );

  @override
  Future<Either<Failure, ResponseModel>> getUser() => executeCache(() => authLocalDataSource.getUser());


  @override
  Future<Either<Failure, ResponseModel>> clearUser() => executeCache(() => authLocalDataSource.clearUser());
}
