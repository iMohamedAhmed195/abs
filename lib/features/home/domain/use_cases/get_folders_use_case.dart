import 'package:new_ilearn/features/home/data/repo_imp/folders_repo_imp.dart';

import '../../../../exports.dart';

class GetFoldersUseCase {
  final FoldersRepoImp repo;
  GetFoldersUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getFolders()  => repo.getFolders();
}