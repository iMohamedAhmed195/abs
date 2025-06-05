
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_folders_use_case.dart';

import '../../../../exports.dart';

class FoldersCubit extends Cubit<CubitStates> {
  final GetHomeFoldersUseCase useCase;
  FoldersCubit({required this.useCase})
      : super(LoadingState());


  getGroups() =>
      managerExecute<HomeFoldersDataModel>(

   useCase.getFolders(),

          onSuccess: (data) {
            print("getGroups");
            emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
