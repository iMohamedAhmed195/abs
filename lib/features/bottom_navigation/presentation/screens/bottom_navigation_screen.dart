import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ilearn/core/models/title_icon_model.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
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
  final List<TabItem> items = [
    TabItem(icon: Icons.folder, title: AppStrings.folder.trans),
    TabItem(icon: Icons.group, title: AppStrings.groups.trans),
    TabItem(icon: Icons.home, title: AppStrings.home.trans),
    TabItem(icon: Icons.archive, title: AppStrings.archivedBooks.trans),
    TabItem(icon: Icons.person, title: AppStrings.profile.trans),
  ];

  // تخزين الصفحات في ذاكرة التخزين المؤقت
  final List<Widget> _pages = navBarItems.map((item) => item.screens).toList();
@override
  void initState() {
    super.initState();
    context.read<BottomNavOperationCubit>().changIndex(2);
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          context.read<BottomNavOperationCubit>().changIndex(0),
      child: BlocBuilder<BottomNavOperationCubit, int>(
        builder: (context, currentIndex) {
          return CustomBackground(
            appBar: currentIndex == 1
                ? CustomAppBar(
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
            )
                : null,
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
                      // استبدال IndexedStack بـ PageView مع حفظ الحالة
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
            bottomNavRoute: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withAlpha(50), // تقليل شدة اللون
                    blurRadius: 30, // زيادة نصف قطر التموج
                    spreadRadius: 10, // زيادة انتشار الظل
                    offset: Offset(0, -2), // رفع الظل قليلاً لأعلى
                  ),
                ],
              ),
              child: BottomBarInspiredInside(
                chipStyle: ChipStyle(
                  convexBridge: true,
                  color: AppColors.primaryColor,
                  background: AppColors.primaryColor,
                  notchSmoothness: NotchSmoothness.softEdge,
                ),
                sizeInside: 40,
                itemStyle: ItemStyle.circle,
                onTap: _onItemTapped,
                items: items,
                elevation: 0, // إبقاء هذا 0 لأننا نستخدم BoxShadow الخاص بنا
                backgroundColor: AppColors.white,
                countStyle: CountStyle(
                  color: AppColors.white,
                  background: AppColors.primaryColor,
                ),
                color: AppColors.grey,
                colorSelected: AppColors.white,
                indexSelected: currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
    // التأكد من أننا لا نعيد تحميل الصفحة الحالية
    if (context.read<BottomNavOperationCubit>().state != index) {
      context.read<BottomNavOperationCubit>().changIndex(index);

      // Handle specific navigation logic for different tabs
      switch (index) {
        case 1:
        // Folder tab logic
          break;
        case 2:
        // Groups tab logic
        // BlocProvider.of<GroupBloc>(context).add(GetListGroupsEvent());
          break;
        case 3:
        // Archive tab logic
        // BlocProvider.of<FolderBloc>(context).add(
        //     GetFolderEvent(page: 1, isArchive: true, type: 'archive'));
          break;
        case 4:
        // Account tab logic
          break;
        default:
        // Home tab logic
          break;
      }
    }
  }

  @override
  void dispose() {
    SocketService().close();
    super.dispose();
  }
}