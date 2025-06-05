
import 'package:new_ilearn/features/folders/domain/use_cases/delete_folder_by_id_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folder_by_id_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class DeleteFolderByIdCubit extends Cubit<CubitStates> {
  final DeleteFolderByIdUseCase useCase;
  DeleteFolderByIdCubit({required this.useCase})
      : super(LoadingState());


  deleteFolder({required String id}) =>
      executeWithDialog(either:

   useCase.deleteFoldersById(id: id),

          onSuccess: (data) {
             emit(LoadedState(data: data));
          },startingMessage:  'loading'.tr(),
          onError: (message) => emit(FailedState(message: message)));
}
