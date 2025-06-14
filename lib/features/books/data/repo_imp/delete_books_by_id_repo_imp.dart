



import 'package:new_ilearn/features/folders/data/data_sources/delete_folder_by_id_remote_date_source.dart';
import 'package:new_ilearn/features/folders/domain/repos/delete_folders_by_id_repo.dart';

import '../../../../exports.dart';

class DeleteFolderByIdRepoImp extends DeleteFoldersByIdRepo {
  final DeleteFolderByIdRemoteDateSource remoteDataSource;

  DeleteFolderByIdRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> deleteFoldersById({required String id}) =>
      (executeImpl(() => remoteDataSource.deleteFolderById(id: id)));


}
