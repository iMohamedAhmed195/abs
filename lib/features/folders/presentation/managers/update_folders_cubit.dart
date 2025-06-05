
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/update_folders_use_case.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class UpdateFoldersCubit extends Cubit<CubitStates> {
  final UpdateFoldersUseCase useCase;
  UpdateFoldersCubit({required this.useCase})
      : super(LoadingState());


  updateFolders({required NewFoldersModel newFoldersModel,required String? id}) =>
      managerExecute<FoldersDataModel>(

   useCase.updateFolders(newFoldersModel: newFoldersModel, id: id),

          onSuccess: (data) {
            print("getGroups");
            emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
