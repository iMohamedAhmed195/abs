
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class AddFoldersRepo {
  Future<Either<Failure, ResponseModel>> addFolder({required NewFoldersModel newFoldersModel});
}