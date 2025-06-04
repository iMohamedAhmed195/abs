import 'package:new_ilearn/features/home/data/repo_imp/folders_repo_imp.dart';
import 'package:new_ilearn/features/home/domain/repos/folders_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/groups_chat_repo.dart';
import 'package:new_ilearn/features/home/domain/repos/statistics_repo.dart';

import '../../../../exports.dart';

class GetGroupsChatUseCase {
  final GroupsChatRepo repo;
  GetGroupsChatUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getStatistics() => repo.getGroups();
}