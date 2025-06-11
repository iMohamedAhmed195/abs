import 'package:new_ilearn/core/utils/theme/theme_cubit.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ilearn/features/splash_screen/presentation/manager/get_configration_cubit.dart';
import 'package:new_ilearn/service_locator.dart';



class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<ThemeCubit>  (
        create: (context) =>  ThemeCubit()),
    BlocProvider<BottomNavOperationCubit>(
        create: (context) => BottomNavOperationCubit()),
    BlocProvider<AuthCubit>(
        create: (context) => ServiceLocator().getIt<AuthCubit>()),
    BlocProvider<ConfigurationCubit>(
        create: (context) => ServiceLocator().getIt<ConfigurationCubit>()..getConfig()),
    ];
}
