
import 'package:new_ilearn/features/home/domain/use_cases/get_folders_use_case.dart';

import '../../../../exports.dart';

class FoldersCubit extends Cubit<CubitStates> {
  final GetFoldersUseCase useCase;
  FoldersCubit({required this.useCase})
      : super(LoadingState());


  getGroups() =>
      managerExecute(

   useCase.getFolders(),

          onSuccess: (data) {
            print("getGroups");
            emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
