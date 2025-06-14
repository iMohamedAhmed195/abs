



import 'package:new_ilearn/features/folders/data/data_sources/get_folder_by_id_remote_date_source.dart';
import 'package:new_ilearn/features/folders/domain/repos/get_folders_by_id_repo.dart';

import '../../../../exports.dart';
import '../../domain/repos/get_books_repo.dart';
import '../data_sources/get_books_remote_date_source.dart';

class GetFolderByIdRepoImp extends GetFoldersByIdRepo {
  final GetFolderByIdRemoteDateSource remoteDataSource;

  GetFolderByIdRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getFolderById({required String id}) =>
      (executeImpl(() => remoteDataSource.getFolderById(id: id)));
}
