
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';

import '../../../../exports.dart';

class GetFoldersCubit extends Cubit<CubitStates> {
  final GetFoldersUseCase useCase;
  GetFoldersCubit({required this.useCase})
      : super(LoadingState());


  getFolders() =>
      managerExecute<FoldersDataModel>(

   useCase.getFolders(),

          onSuccess: (data) {
             emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
