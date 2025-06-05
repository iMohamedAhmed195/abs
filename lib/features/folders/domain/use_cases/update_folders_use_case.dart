
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/repos/add_folders_repo.dart';
import 'package:new_ilearn/features/folders/domain/repos/update_folders_repo.dart';

import '../../../../exports.dart';
import '../repos/get_folders_repo.dart';

class UpdateFoldersUseCase {
  final UpdateFoldersRepo repo;
  UpdateFoldersUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> updateFolders({required NewFoldersModel newFoldersModel,required String? id})  => repo.updateFolder(newFoldersModel: newFoldersModel, id: id);
}