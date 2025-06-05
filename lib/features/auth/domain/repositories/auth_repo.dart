import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/login_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/register_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/resend_code_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_email_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_forget_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import '../../../../exports.dart';
import '../../data/model/request_model/edit_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, ResponseModel>> login({required LoginRequestModel loginRequestModel});
  Future<Either<Failure, ResponseModel>> loginWithGoogle({required String token});
  Future<Either<Failure, ResponseModel>> loginWithFace({required String token});
  Future<Either<Failure, ResponseModel>> logout();
  Future<Either<Failure, ResponseModel>> register({required RegisterRequestModel registerRequestModel});
  Future<Either<Failure, ResponseModel>> verify({required VerifyEmailRequestModel verifyRequestModel});
  Future<Either<Failure, ResponseModel>> forgetPassword({required EnterEmailRequestModel enterEmailRequestModel});
  Future<Either<Failure, ResponseModel>> verifyForgetPassword({required VerifyForgetPasswordRequestModel verifyRequestModel});
  Future<Either<Failure, ResponseModel>> resetPassword({required ResetPasswordRequestModel resetPasswordRequestModel});
  Future<Either<Failure, ResponseModel>> reSendCode({required ReSendRequestModel resendRequestModel});
  Future<Either<Failure, ResponseModel>> editProfile({required UserModel userEdit});
  // Future<Either<Failure, ResponseModel>> deleteAccount({required int accountId});
  // Future<Either<Failure, ResponseModel>> changeNumber({required EnterEmailRequestModel EnterEmailRequestModel});
  Future<Either<Failure, ResponseModel>> getUser();
  Future<Either<Failure, ResponseModel>> clearUser();
}
