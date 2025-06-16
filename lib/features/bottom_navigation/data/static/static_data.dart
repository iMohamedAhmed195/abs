import 'package:new_ilearn/core/models/title_icon_model.dart';
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/archive_screen/presentation/archive_screen.dart';
import 'package:new_ilearn/features/bottom_navigation/data/models/title_icon_model.dart';
import 'package:new_ilearn/features/folders/presentation/folders_screen.dart';
import 'package:new_ilearn/features/folders/presentation/managers/get_folders_cubit.dart';
import 'package:new_ilearn/features/groups/presentation/groups_screen.dart';
import 'package:new_ilearn/features/home/presentation/managers/groups_chat_cubit.dart';
import 'package:new_ilearn/features/home/presentation/managers/statistics_cubit.dart';
import 'package:new_ilearn/features/home/presentation/screens/home_screen.dart';
import 'package:new_ilearn/features/profile/presentation/screens/profile_screen.dart';

import '../../../home/presentation/managers/folders_cubit.dart';

final List<TitleIconModel> navBarItems = [
  TitleIconModel(
    screens: BlocProvider(
      create: (context) => GetFoldersCubit(useCase: ServiceLocator.instance.getIt())..getFolders(),
      child: FoldersScreen(),
    ),
    name: AppStrings.folder.trans,
    coloredIcon: AppAssets.coloredFolder,
    icon: AppAssets.folder,
  ),
  TitleIconModel(
    screens: GroupsScreen(),
    name: AppStrings.groups.trans,
    coloredIcon: AppAssets.coloredGroup,
    icon: AppAssets.group,
  ),
  TitleIconModel(
    screens: MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
          FoldersCubit(useCase: ServiceLocator.instance.getIt())
            ..getGroups(),
        ),
        BlocProvider(
          create:
              (context) =>
          GroupsChatCubit(useCase: ServiceLocator.instance.getIt())
            ..getGroups(),
        ),
        BlocProvider(
          create:
              (context) =>
          StatisticsCubit(useCase: ServiceLocator.instance.getIt())
            ..getStatistics(),
        ),
      ],
      child: HomeScreen(),
    ),
    name: AppStrings.home.trans,
    coloredIcon: AppAssets.homeItemIcon,
    icon: AppAssets.homeItemIcon,
  ),

  TitleIconModel(
    screens: ArchiveScreen(),
    name: AppStrings.archives.trans,
    coloredIcon: AppAssets.coloredArchive,
    icon: AppAssets.archive,
  ),

];

