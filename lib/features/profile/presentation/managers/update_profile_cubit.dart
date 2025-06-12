import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/auth/data/model/response_model/auth_response_model.dart';
import 'package:new_ilearn/features/profile/data/models/profile_model.dart';
import 'package:new_ilearn/features/profile/domain/use_cases/update_profile_use_case.dart';

class UpdateProfileCubit extends Cubit<CubitStates> {
  final UpdateProfileUseCase useCase;
  CacheAbstract cache;
  UpdateProfileCubit({required this.useCase,required this.cache}) : super(LoadingState());
  updateProfile({required ProfileModel profileModel}) => executeWithDialog(
    onSuccess: (data) {


      emit(LoadedState(data: data));
    },
    onError: (massage) {
      emit(FailedState(message: massage));
    },
    startingMessage: "Updating Profile",
    either: useCase.updateProfile(profileModel: profileModel),
  );
}
