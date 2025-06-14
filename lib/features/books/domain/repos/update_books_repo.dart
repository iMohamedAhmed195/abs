
import 'package:new_ilearn/features/folders/data/models/folders_model.dart';

import '../../../../exports.dart';

abstract class UpdateBooksRepo {
  Future<Either<Failure, ResponseModel>> updateBooks({required NewFoldersModel newFoldersModel,required String? id});
}