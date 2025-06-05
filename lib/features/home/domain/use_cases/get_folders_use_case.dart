 import 'package:new_ilearn/features/home/domain/repos/folders_repo.dart';

import '../../../../exports.dart';

class GetHomeFoldersUseCase {
  final FoldersRepo repo;
  GetHomeFoldersUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getFolders()  => repo.getFolders();
}