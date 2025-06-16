import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/bottom_navigation_widget.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
import 'package:new_ilearn/features/home/presentation/widgets/appBar_widget.dart';
import '../../../../exports.dart';
import '../../../../config/services/socket_service.dart';
import '../../data/static/static_data.dart';

class BottomNavigationScreens extends StatefulWidget {
  BottomNavigationScreens({super.key});

  @override
  State<BottomNavigationScreens> createState() => _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {

  // تخزين الصفحات في ذاكرة التخزين المؤقت
  final List<Widget?> _pages = navBarItems.map((item) => item.screens).toList();
@override
  void initState() {
    super.initState();
    context.read<BottomNavOperationCubit>().changeIndex(2);
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
            appBar: currentIndex == 1 ? CustomAppBar(
              title: AppStrings.groups.trans,
              leading: false,
              actions: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(AppAssets.searchIcon),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ) : null,
            showSafeArea: false,
            scaffoldKey: context.read<BottomNavOperationCubit>().getNewScaffoldKey(),
            backgroundColor: AppColors.white,
            child: Stack(
              children: [
                if (currentIndex != 1) ...[
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(AppAssets.bubbleDashBordLight),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(AppAssets.bubbleDashBord),
                  ),
                ],
                Column(
                  children: [
                    if (currentIndex != 4 && currentIndex != 1)
                      AppBarDashBord(
                        image: AppAssets.person,
                        point: 10,
                      ),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(), // لمنع التمرير الجانبي
                        itemCount: _pages.length,
                        controller: PageController(initialPage: currentIndex),
                        itemBuilder: (context, index) {
                          return Offstage(
                            offstage: currentIndex != index,
                            child: _pages[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<BottomNavOperationCubit>().changeIndex(2),
              backgroundColor: AppColors.primaryColor,
              child: CustomSVGImage(asset: AppAssets.homeItemIcon),
              elevation: 0,
              shape: CircleBorder(),
            ),
            floatingDirection: FloatingActionButtonLocation.centerDocked,
            drawer: Drawer(
              width: 250.w,
              backgroundColor: AppColors.white,
              child:Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xff00167D), Color(0xff0075E7)]
                  ),
                ),
                child: Column(
                  children: [
                    90.vs,
                    SizedBox(
                      width: 120.w,
                        height: 120.h,
                        child: CustomPngImage(image: AppAssets.logoWhite,isAsset: true,)
                    )
                  ],
                ),
              ),
            ),
            bottomNavRoute:BottomNavigationWidget(navBar: navBarItems,),
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