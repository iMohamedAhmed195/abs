import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_ilearn/core/models/title_icon_model.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/managers/bottom_nav_operation_cubit.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
import '../../../../exports.dart';
import '../../../../config/services/socket_service.dart';
import '../../data/static/static_data.dart';

class BottomNavigationScreens extends StatefulWidget {
  BottomNavigationScreens({super.key});

  @override
  State<BottomNavigationScreens> createState() =>
      _BottomNavigationScreensState();
}

class _BottomNavigationScreensState extends State<BottomNavigationScreens> {
  // Define your bottom navigation items
  final List<TabItem> items = [
    TabItem(icon: Icons.folder, title: 'Folder'),
    TabItem(icon: Icons.group, title: 'Groups'),
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.archive, title: 'Archive'),
    TabItem(icon: Icons.person, title: 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:
          (didPop, result) =>
              context.read<BottomNavOperationCubit>().changIndex(0),
      child: BlocBuilder<BottomNavOperationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar:
                context.read<BottomNavOperationCubit>().index == 2
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
            body: CustomBackground(
              showSafeArea: false,
              scaffoldKey:
                  context.read<BottomNavOperationCubit>().getNewScaffoldKey(),
              backgroundColor: AppColors.white,
              child: navBarItems[state].screens,
            ),
            bottomNavigationBar: BottomBarInspiredInside(
              chipStyle:   ChipStyle(convexBridge: true,color: AppColors.primaryColor,background: AppColors.primaryColor),
              sizeInside: 40,
              itemStyle: ItemStyle.circle,
              onTap: _onItemTapped,
              items: items,
              elevation: 0,
              backgroundColor: AppColors.white,
              countStyle: CountStyle(
                color: AppColors.white,
                background: AppColors.primaryColor,
              ),
              color: AppColors.grey,

              animated: true,
              colorSelected: AppColors.white,
              indexSelected: state,
            ),
          );
        },
      ),
    );
  }

  void _onItemTapped(int index) {
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

  @override
  void dispose() {
    SocketService().close();
    super.dispose();
  }
}
