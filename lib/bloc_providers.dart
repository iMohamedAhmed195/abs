import 'package:abs/core/utils/theme/theme_cubit.dart';
import 'package:abs/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<ThemeCubit>  (
        create: (context) =>  ThemeCubit()),
    BlocProvider<BottomNavOperationCubit>(
        create: (context) => BottomNavOperationCubit()),

    ];
}
