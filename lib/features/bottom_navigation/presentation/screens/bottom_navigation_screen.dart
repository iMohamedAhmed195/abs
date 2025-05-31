// import 'package:new_ilearn/core/models/title_icon_model.dart';
// import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
// import '../../../../exports.dart';
// import '../../../../config/services/socket_service.dart';
// import '../../data/static/static_data.dart';
// import '../widget/bottom_navigation_widget.dart';
//
// class BottomNavigationScreens extends StatefulWidget {
//   BottomNavigationScreens({super.key});
//
//   @override
//   State<BottomNavigationScreens> createState() =>
//       _BottomNavigationScreensState();
// }
// final List<TitleIconModel> navBar;
//
// class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (didPop, result) =>
//           context.read<BottomNavOperationCubit>().changIndex(0),
//       child: BlocBuilder<BottomNavOperationCubit, int>(
//         builder: (context, state) {
//           return CustomBackground(
//             scaffoldKey: context.read<BottomNavOperationCubit>().getNewScaffoldKey(),
//             backgroundColor: AppColors.backgroundColor,
//             child: navBarItems[state].screens!,
//             bottomNavRoute: BottomNavigationWidget(navBar: navBarItems),
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     SocketService().close();
//     super.dispose();
//   }
// }
