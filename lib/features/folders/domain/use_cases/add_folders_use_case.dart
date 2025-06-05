
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/repos/add_folders_repo.dart';

import '../../../../exports.dart';
import '../repos/get_folders_repo.dart';

class AddFoldersUseCase {
  final AddFoldersRepo repo;
  AddFoldersUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getFolders({required NewFoldersModel newFoldersModel})  => repo.addFolder(newFoldersModel: newFoldersModel);
}