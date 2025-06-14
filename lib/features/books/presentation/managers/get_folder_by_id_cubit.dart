
import 'package:new_ilearn/features/folders/domain/use_cases/get_folder_by_id_use_case.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class GetFolderByIdCubit extends Cubit<CubitStates> {
  final GetFolderByIdUseCase useCase;
  GetFolderByIdCubit({required this.useCase})
      : super(LoadingState());


  getFolders({required String id}) =>
      managerExecute<HomeFoldersDataModel>(

   useCase.getFolders(id: id),

          onSuccess: (data) {
             emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
