
import '../../../../exports.dart';
import '../repos/get_folders_repo.dart';

class GetFoldersUseCase {
  final GetFoldersRepo repo;
  GetFoldersUseCase({required this.repo});

  Future<Either<Failure, ResponseModel>> getFolders()  => repo.getFolders();
}