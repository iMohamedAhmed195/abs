import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ilearn/service_locator.dart';



class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<BottomNavOperationCubit>(
        create: (context) => BottomNavOperationCubit()),
    BlocProvider<AuthCubit>(
        create: (context) => ServiceLocator().getIt<AuthCubit>()),
  ];
}
