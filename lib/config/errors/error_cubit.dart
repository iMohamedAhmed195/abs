

import 'package:new_ilearn/exports.dart';

enum Errors {
  PHONE_ERROR,
  NAME_ERROR,
  PASSWORD_ERROR,
  EMAIL_ERROR,
  OTP_ERROR,
  MATCHING_PASSWORD_ERROR,
  ADD_SURVEY_ERROR,
}

Map<Errors, String> getError = {
  Errors.ADD_SURVEY_ERROR : AppStrings.shouldChooseAllInfoForAddCar.trans
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
