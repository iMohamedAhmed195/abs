

import 'package:new_ilearn/exports.dart';

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
}

Map<Errors, String> getError = {
  Errors.OTP_ERROR: AppStrings.otpCodeError.trans,
  Errors.COUNTRY_ERROR: AppStrings.pleaseSelectCountry.trans,
  Errors.GENDER_ERROR: AppStrings.pleaseSelectGender.trans,
  Errors.LEARNING_STAGE_ERROR: AppStrings.pleaseSelectLearningStage.trans,
  Errors.TERMS_AND_CONDITIONS_DATA_ERROR: AppStrings.pleaseAcceptTerms.trans,
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
