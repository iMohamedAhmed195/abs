
import 'package:new_ilearn/features/home/data/models/statistics_model.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_folders_use_case.dart';
import 'package:new_ilearn/features/home/domain/use_cases/get_statistics_use_case.dart';

import '../../../../exports.dart';

class StatisticsCubit extends Cubit<CubitStates> {
  final GetStatisticsUseCase useCase;
  StatisticsCubit({required this.useCase})
      : super(LoadingState());


  getStatistics() =>
      managerExecute<StatisticsDataModel>(
           useCase.getStatistics(),
           onSuccess: (data) {
            emit(LoadedState(data: data));
          },
          onFail: (message) => emit(FailedState(message: message)));
}
