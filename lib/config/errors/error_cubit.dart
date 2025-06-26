

import 'package:abs/exports.dart';

enum Errors {
  PHONE_ERROR,
  NAME_ERROR,
  PASSWORD_ERROR,
  EMAIL_ERROR,
  OTP_ERROR,
  MATCHING_PASSWORD_ERROR,
  ADD_SURVEY_ERROR,
  COUNTRY_ERROR,
  GENDER_ERROR,
  LEARNING_STAGE_ERROR,
  TERMS_AND_CONDITIONS_DATA_ERROR,
  CHOOSE_IMAGE_OR_FILE_ERROR,
}

Map<Errors, String> getError = {
  Errors.OTP_ERROR: AppStrings.otpCodeError.trans,
};

class ErrorCubit extends Cubit<CubitStates> {
  ErrorCubit() : super(InitialState());
  List<Errors> errors = [];
  addValidatorError(Errors error) {
    if (errors.contains(error).isFalse) {
      print("added error $error");
      errors.add(error);
      emit(ChangeState());
    }
  }

  removeError(Errors error) {
    if (errors.contains(error).isTrue) {
      print("error removed");
      errors.remove(error);

      emit(ChangeState());
    }
  }

  get clearErrors {
    errors.clear();
    emit(ChangeState());
  }
}
