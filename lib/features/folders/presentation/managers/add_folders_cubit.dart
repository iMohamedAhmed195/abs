
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/add_folders_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class AddFoldersCubit extends Cubit<CubitStates> {
  final AddFoldersUseCase useCase;
  AddFoldersCubit({required this.useCase})
      : super(LoadingState());


  addFolders({required NewFoldersModel newFoldersModel}) => executeWithDialog (either:

   useCase.getFolders(newFoldersModel: newFoldersModel),startingMessage:"Adding Folder" ,

          onSuccess: (data) {
             emit(LoadedState(data: data));
          },
          onError: (message) => emit(FailedState(message: message)));
}
