
import 'package:new_ilearn/features/folders/domain/repos/get_folders_by_id_repo.dart';

import '../../../../exports.dart';
import '../repos/get_folders_repo.dart';

class GetFolderByIdUseCase {
  final GetFoldersByIdRepo repo;
  GetFolderByIdUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getFolders({required String id})  => repo.getFolderById(id: id);
}