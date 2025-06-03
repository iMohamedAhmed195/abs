import 'package:new_ilearn/features/auth/data/model/request_model/edit_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/login_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/register_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/resend_code_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/forget_password_response_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/logout_response_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/register_response_model.dart';
import '../../../../exports.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseModel> login({required LoginRequestModel loginRequestModel});
  Future<ResponseModel> logout();
  Future<ResponseModel> register(
      {required RegisterRequestModel registerRequestModel});
  Future<ResponseModel> verify(
      {required VerifyRequestModel verifyRequestModel});
  Future<ResponseModel> forgetPassword(
      {required EnterEmailRequestModel enterEmailRequestModel});
  Future<ResponseModel> verifyForgetPassword(
      {required VerifyRequestModel verifyRequestModel});
  Future<ResponseModel> resetPassword(
      {required ResetPasswordRequestModel resetPasswordRequestModel});
  Future<ResponseModel> reSendCode({required ReSendRequestModel resendRequestModel});
  Future<ResponseModel> editProfile({required UserModel userEdit});

  // Future<ResponseModel> deleteAccount({required int accountId});
  // Future<ResponseModel> changeNumber({required EnterEmailRequestModel EnterEmailRequestModel});
}

class AuthRemoteDataSourceImpl extends RemoteExecuteImpl
    implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required super.dioConsumer});
  @override
  Future<ResponseModel> login({required LoginRequestModel loginRequestModel}) =>
      addData(
          endPoint: EndPoints.login,
          data: loginRequestModel.toJson(),
          getFromJsonFunction: AuthResponseModel.fromJson);
  @override
  Future<ResponseModel> logout() => addData(
      endPoint: EndPoints.logout,
      getFromJsonFunction: LogoutResponseModel.fromJson);
  @override
  Future<ResponseModel> register(
          {required RegisterRequestModel registerRequestModel}) =>
      addData(
          endPoint: EndPoints.register,
          data: registerRequestModel.toJson(),
          isFormData: true,
          getFromJsonFunction: RegisterResponseModel.fromJson);

  @override
  Future<ResponseModel> verify(
          {required VerifyRequestModel verifyRequestModel}) =>
      addData(
          endPoint: EndPoints.verify,
          data: verifyRequestModel.toJson(),
          getFromJsonFunction: AuthResponseModel.fromJson);
  @override
  Future<ResponseModel> forgetPassword(
          {required EnterEmailRequestModel
          enterEmailRequestModel}) =>
      addData(
          endPoint: EndPoints.forgetPassword,
          data: enterEmailRequestModel.toJson(),
          getFromJsonFunction: ForgetPasswordResponseModel.fromJson);
  @override
  Future<ResponseModel> verifyForgetPassword(
          {required VerifyRequestModel verifyRequestModel}) =>
      addData(
          endPoint: EndPoints.verifyForgetPassword,
          data: verifyRequestModel.toJson(),
          getFromJsonFunction: AuthResponseModel.fromJson);
  @override
  Future<ResponseModel> resetPassword(
          {required ResetPasswordRequestModel resetPasswordRequestModel}) =>
      updateData(
          endPoint: EndPoints.resetPassword,
          data: resetPasswordRequestModel.toJson(),
          getFromJsonFunction: ResponseModel.fromJson);
  @override
  Future<ResponseModel> reSendCode(
          {required ReSendRequestModel resendRequestModel}) =>
      addData(
          endPoint: EndPoints.reSend,
          data: resendRequestModel.toJson(),
          getFromJsonFunction: RegisterResponseModel.fromJson);
  @override
  Future<ResponseModel> editProfile({required UserModel userEdit}) =>updateData(
      endPoint: "${EndPoints.user}/${userEdit.id}",
      data: userEdit.toJson(),
      isFormData: true,
      getFromJsonFunction: AuthResponseModel.fromJson);

  // @override
  // Future<ResponseModel> deleteAccount({required int accountId}) => remoteExecute(
  //     request: dioConsumer.deleteRequest(
  //       path: "${EndPoints.deleteAccount}/$accountId",
  //     ),
  //     fromJsonFunction: LogoutResponseModel.fromJson);
  // @override

  // @override

  // @override
  // Future<ResponseModel> changeNumber({required EnterEmailRequestModel EnterEmailRequestModel}) => remoteExecute(
  //     request: dioConsumer.postRequest(
  //       path: EndPoints.changePhone,
  //       body: EnterEmailRequestModel.toJson(),
  //     ),
  //     fromJsonFunction: ChangeNumberResponseModel.fromJson);
}
