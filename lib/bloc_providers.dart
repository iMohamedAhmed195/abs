import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<BottomNavOperationCubit>(
        create: (context) => BottomNavOperationCubit()),

  ];
}
