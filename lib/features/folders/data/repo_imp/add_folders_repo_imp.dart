



import 'package:new_ilearn/features/folders/data/data_sources/add_folders_remote_date_source.dart';
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';
import 'package:new_ilearn/features/folders/domain/repos/add_folders_repo.dart';

import '../../../../exports.dart';

class AddFoldersRepoImp extends AddFoldersRepo {
  final AddFoldersRemoteDateSource remoteDataSource;

  AddFoldersRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> addFolder({required NewFoldersModel newFoldersModel}) =>
      (executeImpl(() => remoteDataSource.addFolder(newFoldersModel: newFoldersModel)));


}
