



import '../../../../exports.dart';
import '../../domain/repos/get_folders_repo.dart';
import '../data_sources/get_folders_remote_date_source.dart';

class GetFoldersRepoImp extends GetFoldersRepo {
  final GetFoldersRemoteDataSource remoteDataSource;

  GetFoldersRepoImp({required this.remoteDataSource});
  @override
  Future<Either<Failure, ResponseModel>> getFolders() =>
      (executeImpl(() => remoteDataSource.getFolders()));
}
