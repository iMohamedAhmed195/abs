
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class UpdateFoldersRepo {
  Future<Either<Failure, ResponseModel>> updateFolder({required NewFoldersModel newFoldersModel,required String? id});
}