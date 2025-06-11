
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/splash_screen/domain/use_cases/get_config_use_case.dart';

import '../../data/models/config_response_model.dart';

class   ConfigurationCubit extends Cubit<CubitStates> {
  final GetConfigUseCase getConfigUseCase;
  ConfigurationCubit({required this.getConfigUseCase}) : super(LoadingState());
  ConfigData? configData;
  Future<ConfigData?> getConfig() async => await managerExecute<ConfigData?>(
        getConfigUseCase.getConfig(),
        onSuccess: (ConfigData? data) {
          configData = data;
          emit(LoadedState<ConfigData>(data: data!));
        },
        onFail: (String message) {
          emit(FailedState(message: message));
        },
        onNetworkFail: (message, data) {
          if (data != null) {
            configData = data;
            emit(LoadedState<ConfigData>(data: data));
          }
          showModalBottomSheet(
            context: getContext,
            useRootNavigator: true,
            builder: (context) => Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsetsDirectional.symmetric(vertical: 50.h, horizontal: 20.w),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: getSemiBoldTextStyle(fontSize: 20.h),
              ),
            ),
          );
        },
      );
}
