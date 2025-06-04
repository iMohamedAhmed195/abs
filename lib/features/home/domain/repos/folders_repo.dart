import 'package:new_ilearn/features/home/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class FoldersRepo {
  Future<Either<Failure, ResponseModel>> getFolders();
}