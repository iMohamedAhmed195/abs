import 'dart:developer';

import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/config/local_notification/local_notification.dart';
import 'package:new_ilearn/core/models/api_response.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/login_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/register_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/resend_code_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_email_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_forget_password_request_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/forget_password_response_model.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/register_response_model.dart';
import 'package:new_ilearn/features/auth/domain/usecase/auth_use_case.dart';
import 'package:new_ilearn/features/auth/presentation/managers/social_auth/facebook_auth.dart';
import 'package:new_ilearn/features/auth/presentation/managers/social_auth/google_auth.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';

import '../../../../exports.dart';

class AuthCubit extends Cubit<CubitStates> {
  AuthUseCase authUseCase;
  AuthCubit({required this.authUseCase}) : super(InitialState());

  UserData? userData;

  login({required LoginRequestModel loginRequestModel}) async {
    await managerExecute<UserData?>(
      authUseCase.login(loginRequestModel: loginRequestModel),
      onSuccess: (UserData? data) async {
        userData = data!;
        getBlocData<BottomNavOperationCubit>().changIndex(0);
        emit(LoadedState<UserData>(data: data));
        // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
      },
      onFail: (message) {
        emit(FailedState(message: message));
      },
    );
  }

  loginWithGoogle() async {
    ApiResponse token = await GoogleAuth().authWithGoogle();
    await managerExecute<UserData?>(
      authUseCase.loginWithGoogle(token:token.message),
      onSuccess: (UserData? data) async {
        userData = data!;
        log('userData.token.toString()${userData!.token.toString()}');
        getBlocData<BottomNavOperationCubit>().changIndex(0);
        emit(LoadedState<UserData>(data: data));
        Routes.bottomNavigationRoute.moveToCurrrentRouteAndRemoveAll;
      },
      onFail: (message) {
        emit(FailedState(message: message));
      },
    );
  }

  loginWithFace() async {
    ApiResponse token = await FaceBookAuth().authWithFaceBook();
    await managerExecute<UserData?>(
      authUseCase.loginWithFace(token:token.message),
      onSuccess: (UserData? data) async {
        userData = data!;
        log('userData.token.toString()${userData!.token.toString()}');
        getBlocData<BottomNavOperationCubit>().changIndex(0);
        emit(LoadedState<UserData>(data: data));
        // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
      },
      onFail: (message) {
        emit(FailedState(message: message));
      },

    );
  }

  logout() async => await executeWithDialog(
        either: authUseCase.logout(),
        startingMessage: AppStrings.waitingForLogout.trans,
        onSuccess: (data) async {
          userData = null;
          AppPrefs.token = null;
          AppPrefs.user = null;
          getBlocData<BottomNavOperationCubit>().changIndex(0);
          // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
          getBlocData<BottomNavOperationCubit>().changIndex(0);
          emit(LoadedState(data: null));
        },
      );

  register({required RegisterRequestModel registerRequestModel}) async {
    await executeWithDialog(
      either: authUseCase.register(registerRequestModel: registerRequestModel),
      startingMessage: AppStrings.waitingForRegistration.trans,
      onSuccess: (data) async {
        emit(LoadedState(data: data ?? 'asd'));
        Routes.enterOtpRoute.moveToWithArgs({
          "email": registerRequestModel.email,
          "isFromForgetPassword": false
        });
      },
      onError: (message) {
        emit(FailedState(message: message));
      }
    );
  }

  verifyForgetPassword({required VerifyForgetPasswordRequestModel verifyRequestModel, required String email}) async {
    await executeWithDialog(
      either: authUseCase.verifyForgetPassword(
        verifyRequestModel: verifyRequestModel,
      ),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        Routes.newPasswordRoute.moveToWithArgs(
          {
            "email": email,
          }
        );
        // isForgetPassword
        //     ? Routes.resetPasswordRoute.moveTo()
        //     : Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
      },
    );
  }

  verifyEmail({required VerifyEmailRequestModel verifyRequestModel, required String email}) async {
    await executeWithDialog(
      either: authUseCase.verify(
        verifyRequestModel: verifyRequestModel,
      ),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        Routes.loginRoute.moveTo();
      },
    );
  }

  reSendCode({required ReSendRequestModel resendRequestModel}) async {
    await executeWithDialog<UserDataModel>(
      either: authUseCase.reSendCode(resendRequestModel: resendRequestModel),
      startingMessage: AppStrings.sendAgain.trans,
      onSuccess: (UserDataModel? data) async {
        checkNotificationPermissionAndDoOperation(
          getContext,
          onSuccess: () {
            NotificationsService().showSimpleNotification(
                title: AppStrings.verificationAccount.trans,
                description: data!.verificationCode.toString());
          },
        );
      },
    );
  }

  forgetPassword({required EnterEmailRequestModel enterEmailRequestModel,}) async {
    await executeWithDialog<ForgetPasswordDataModel>(
      either: authUseCase.forgetPassword(
          enterEmailRequestModel: enterEmailRequestModel),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        // checkNotificationPermissionAndDoOperation(
        //   getContext,
        //   onSuccess: () {
        //     NotificationsService().showSimpleNotification(
        //         title: AppStrings.verificationAccount.trans,
        //         description: data!.confirmationCode.toString());
        //   },
        // );
        Routes.enterOtpRoute.moveToAndRemoveCurrent(args: {
          "email": enterEmailRequestModel.email,
          "isFromForgetPassword":true,
        });
      },
    );
  }

  resetPassword({required ResetPasswordRequestModel resetPasswordRequestModel}) async {
    await executeWithDialog(
      either: authUseCase.resetPassword(
          resetPasswordRequestModel: resetPasswordRequestModel),
      startingMessage: AppStrings.verificationAccount.trans,
      onSuccess: (data) async {
        Routes.loginRoute.moveToCurrrentRouteAndRemoveAll;
      },
    );
  }

  editProfile({required UserModel userEdit}) {
    executeWithDialog<UserData>(
      either: authUseCase.editProfile(userEdit: userEdit),
      startingMessage: AppStrings.waitingForEditProfile.trans,
      onSuccess: (data) {
        userData?.user = data!.user;
        // getBlocData<BottomNavOperationCubit>().goToHome();
        emit(LoadedState(data: userData));
      },
    );
  }

  // changeNumber(
  //     {required EnterEmailRequestModel EnterEmailRequestModel,
  //     required bool isForgetPassword}) async {
  //   await executeWithDialog<ChangeNumberUserDataModel>(
  //     either: authUseCase.changeNumber(
  //         EnterEmailRequestModel: EnterEmailRequestModel),
  //     startingMessage: AppStrings.changeNumber.trans,
  //     onSuccess: (data) async {
  //       changeNumberUserModel = data!.user;
  //       Routes.enterOtpRoute.moveToWithArgs({
  //         "id": EnterEmailRequestModel.id,
  //         "phone": EnterEmailRequestModel.phoneNumber,
  //         'isForgetPassword': isForgetPassword
  //       });
  //     },
  //   );
  // }
  //

  // deleteAccount() => executeWithDialog(
  //       either: authUseCase.deleteAccount(accountId: userData!.user!.id!),
  //       startingMessage: AppStrings.deletingAccount,
  //       onSuccess: (_) {
  //         userData = null;
  //         getBlocData<BottomNavOperationCubit>().closeDrawer();
  //         emit(LoadedState(data: null));
  //         Routes.bottomNavRoute.moveTo();
  //       },
  //     );

  Future<UserData?> getUser() async => managerExecute<UserData>(
        authUseCase.getUser(),
        onSuccess: (data) {
          userData = data;
        },
      );
  clearUser() => managerExecute(
        authUseCase.clearUser(),
        onSuccess: (data) {
          userData = null;
          // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;

          emit(LoadedState(data: null));
        },
      );
}
