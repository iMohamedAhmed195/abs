import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/bottom_navigation/domain/repos/how_we_work_repo.dart';

 class HowWeWorkUseCase {
 final HowWeWorkRepo howWeWorkRepo;

 HowWeWorkUseCase({required this.howWeWorkRepo});

  Future<Either<Failure, ResponseModel>> getHowWeWork()=> howWeWorkRepo.getHowWeWork();
}