import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import 'package:new_ilearn/features/auth/domain/repositories/auth_repo.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/login_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/register_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/resend_code_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_request_model.dart';

import '../../../../exports.dart';
import '../../data/model/request_model/edit_model.dart';

class AuthUseCase {
  AuthRepo authRepo;
  AuthUseCase({required this.authRepo});

  Future<Either<Failure, ResponseModel>> login({required LoginRequestModel loginRequestModel}) async =>
      authRepo.login(loginRequestModel: loginRequestModel);
  Future<Either<Failure, ResponseModel>> loginWithGoogle({required String token}) async =>
      authRepo.loginWithGoogle(token: token);
  Future<Either<Failure, ResponseModel>> loginWithFace({required String token}) async =>
      authRepo.loginWithFace(token: token);
  Future<Either<Failure, ResponseModel>> logout() async => authRepo.logout();
  Future<Either<Failure, ResponseModel>> register({required RegisterRequestModel registerRequestModel}) async =>
      authRepo.register(registerRequestModel: registerRequestModel);
  Future<Either<Failure, ResponseModel>> verify({required VerifyRequestModel verifyRequestModel}) async =>
      authRepo.verify(verifyRequestModel: verifyRequestModel);
  Future<Either<Failure, ResponseModel>> forgetPassword({
    required EnterEmailRequestModel enterEmailRequestModel,
  }) async => authRepo.forgetPassword(enterEmailRequestModel: enterEmailRequestModel);
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({required VerifyRequestModel verifyRequestModel}) async =>
      authRepo.verifyForgetPassword(verifyRequestModel: verifyRequestModel);
  Future<Either<Failure, ResponseModel>> resetPassword({
    required ResetPasswordRequestModel resetPasswordRequestModel,
  }) async => authRepo.resetPassword(resetPasswordRequestModel: resetPasswordRequestModel);
  Future<Either<Failure, ResponseModel>> reSendCode({required ReSendRequestModel resendRequestModel}) async =>
      authRepo.reSendCode(resendRequestModel: resendRequestModel);
  Future<Either<Failure, ResponseModel>> editProfile({required UserModel userEdit}) =>
      authRepo.editProfile(userEdit: userEdit);
  // Future<Either<Failure, ResponseModel>> changeNumber(
  //         {required EnterEmailRequestModel
  //             EnterEmailRequestModel}) async =>
  //     authRepo.changeNumber(
  //         EnterEmailRequestModel: EnterEmailRequestModel);

  // Future<Either<Failure, ResponseModel>> deleteAccount(
  //         {required int accountId}) =>
  //     authRepo.deleteAccount(accountId: accountId);
  // Future<Either<Failure, ResponseModel>> setLocation(
  //         {required String addressName,
  //         required double lat,
  //         required double long}) =>
  //     authRepo.setLocation(addressName: addressName, lat: lat, long: long);

  Future<Either<Failure, ResponseModel>> getUser() => authRepo.getUser();
  Future<Either<Failure, ResponseModel>> clearUser() => authRepo.clearUser();
}
