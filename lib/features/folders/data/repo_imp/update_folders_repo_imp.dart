import 'package:new_ilearn/features/folders/data/data_sources/update_folders_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/repos/update_folders_repo.dart';

import '../../../../exports.dart';

class UpdateFoldersRepoImp extends UpdateFoldersRepo {
  final UpdateFoldersRemoteDateSource remoteDataSource;

  UpdateFoldersRepoImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> updateFolder({
    required NewFoldersModel newFoldersModel,
    required String? id,
  }) => executeImpl(
    () => remoteDataSource.updateFolder(
      newFoldersModel: newFoldersModel,
      id: id!,
    ),
  );
}
