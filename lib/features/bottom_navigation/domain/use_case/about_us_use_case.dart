import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/bottom_navigation/domain/repos/about_us_repo.dart';

 class AboutUsUseCase {
 final AboutUsRepo aboutUsRepo;

 AboutUsUseCase({required this.aboutUsRepo});

  Future<Either<Failure, ResponseModel>> getAboutUs()=> aboutUsRepo.getAboutUs();
}