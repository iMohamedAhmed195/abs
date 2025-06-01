import 'package:new_ilearn/core/models/title_icon_model.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/item_page_navigation.dart';
import '../../../../exports.dart';
import '../../../../config/services/socket_service.dart';
import '../../data/static/static_data.dart';
import '../widget/bottom_navigation_widget.dart';

class BottomNavigationScreens extends StatefulWidget {
  BottomNavigationScreens({super.key});

  @override
  State<BottomNavigationScreens> createState() => _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => context.read<BottomNavOperationCubit>().changIndex(0),
      child: BlocBuilder<BottomNavOperationCubit, int>(
        builder: (context, state) {
          return CustomBackground(
            showSafeArea: false,
            scaffoldKey: context.read<BottomNavOperationCubit>().getNewScaffoldKey(),
            backgroundColor: AppColors.white,
            appBar:
                context.read<BottomNavOperationCubit>().index == 2
                    ? CustomAppBar(
                      title: AppStrings.groups.trans,
                      leading: false,
                      actions: [
                        InkWell(onTap: () {}, child: SvgPicture.asset(AppAssets.searchIcon)),
                        const SizedBox(width: 5),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add, color: Theme.of(context).iconTheme.color)),
                        const SizedBox(width: 5),
                      ],
                    )
                    : null,
            child: navBarItems[state].screens,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              shape: const CircleBorder(),
              onPressed: () {
                context.read<BottomNavOperationCubit>().changIndex(0);
              },
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Center(child: SvgPicture.asset(AppAssets.homeItemIcon)),
              ),
            ),
            floatingDirection: FloatingActionButtonLocation.centerDocked,
            bottomNavRoute: BottomAppBar(
              height: 75.h,
              color: AppColors.white,
              shape: CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemPageNavigation(
                        onClickItem: () {
                          context.read<BottomNavOperationCubit>().changIndex(1);
                        },
                        title: AppStrings.folder.trans,
                        indexPage: state,
                        indexThisItem: 1,
                        selectedItemImage: AppAssets.folderIconFill,
                        unSelectedItemImage: AppAssets.folderIconUnFill,
                      ),
                      ItemPageNavigation(
                        onClickItem: () {
                          context.read<BottomNavOperationCubit>().changIndex(2);
                          // BlocProvider.of<GroupBloc>(context)
                          //     .add(GetListGroupsEvent());
                        },
                        title: AppStrings.groups.trans,
                        indexPage: state,
                        indexThisItem: 2,
                        selectedItemImage: AppAssets.groupFillColor,
                        unSelectedItemImage: AppAssets.group,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ItemPageNavigation(
                        onClickItem: () {
                          context.read<BottomNavOperationCubit>().changIndex(3);
                          // BlocProvider.of<FolderBloc>(context).add(
                          //     GetFolderEvent(
                          //         page: 1,
                          //         isArchive: true,
                          //         type: 'archive'));
                        },
                        title: AppStrings.archiveItem.trans,
                        indexPage: state,
                        indexThisItem: 3,
                        selectedItemImage: AppAssets.archiveItemIconFill,
                        unSelectedItemImage: AppAssets.archiveItemIconUnFill,
                      ),
                      ItemPageNavigation(
                        onClickItem: () {
                          context.read<BottomNavOperationCubit>().changIndex(4);
                        },
                        title: AppStrings.account.trans,
                        indexPage: state,
                        indexThisItem: 4,
                        selectedItemImage: AppAssets.userItemIconSelected,
                        unSelectedItemImage: AppAssets.userItemIconUnSelected,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
