import 'package:new_ilearn/features/home/data/date_sources/folders_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/date_sources/groups_chat_remote_date_source.dart';
import 'package:new_ilearn/features/home/data/models/home_folders_model.dart';
import 'package:new_ilearn/features/home/domain/repos/folders_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/groups_chat_repo.dart';

import '../../../../exports.dart';

class GroupsChatRepoImp extends GroupsChatRepo {
  final GroupsChatRemoteDateSource remoteDataSource;

  GroupsChatRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getGroups() =>
      (executeImpl(() => remoteDataSource.getGroups()));


}
