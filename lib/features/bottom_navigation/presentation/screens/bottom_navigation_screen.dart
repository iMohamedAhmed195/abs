import 'package:abs/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:abs/features/bottom_navigation/presentation/widget/bottom_navigation_widget.dart';
import 'package:abs/features/bottom_navigation/presentation/widget/app_bar_for_dashboard_section.dart';
import '../../../../exports.dart';
import '../../../../config/services/socket_service.dart';
import '../../data/static/static_data.dart';

class BottomNavigationScreens extends StatefulWidget {
  BottomNavigationScreens({super.key});

  @override
  State<BottomNavigationScreens> createState() => _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  final List<Widget> _pages = navBarItems.map((item) => item.screens).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<BottomNavOperationCubit>().closeDrawer();
      },
      child: BlocBuilder<BottomNavOperationCubit, int>(
        builder: (context, currentIndex) {
          return CustomBackground(
            showSafeArea: false,
            scaffoldKey: context.read<BottomNavOperationCubit>().getNewScaffoldKey(),
            backgroundColor: AppColors.white,
            child: Column(
              children: [
                50.vs,
                AppBarForDashboardSection(),
                Expanded(
                  child: IndexedStack(
                    index: currentIndex,
                    children: _pages,
                  ),
                ),
              ],
            ),
            bottomNavRoute: BottomNavigationWidget(navBar: navBarItems),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    SocketService().close();
    super.dispose();
  }
}
