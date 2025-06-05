
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/data/models/groups_chat_model.dart' hide Items;
import 'package:new_ilearn/features/home/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_groups_chat_use_case.dart';

import '../../../../exports.dart';

class GroupsChatCubit extends Cubit<CubitStates> {
  final GetGroupsChatUseCase useCase;
  GroupsChatCubit({required this.useCase})
      : super(LoadingState());


  getGroups() =>
      managerExecute<GroupsDataChatModel>(
   useCase.
          getStatistics(),

          onSuccess: (data) {


            emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
