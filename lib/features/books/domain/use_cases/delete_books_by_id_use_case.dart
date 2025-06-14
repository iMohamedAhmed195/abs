
import 'package:new_ilearn/features/folders/domain/repos/delete_folders_by_id_repo.dart';
import 'package:new_ilearn/features/folders/domain/repos/get_folders_by_id_repo.dart';

import '../../../../exports.dart';
import '../repos/get_books_repo.dart';

class DeleteFolderByIdUseCase {
  final DeleteFoldersByIdRepo repo;
  DeleteFolderByIdUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> deleteFoldersById({required String id})  => repo.deleteFoldersById(id: id);
}