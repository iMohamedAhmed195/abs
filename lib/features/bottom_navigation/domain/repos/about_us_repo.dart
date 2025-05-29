import 'package:new_ilearn/exports.dart';

abstract class AboutUsRepo {
  Future<Either<Failure, ResponseModel>> getAboutUs();
}