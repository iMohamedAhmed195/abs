import 'package:new_ilearn/core/models/title_icon_model.dart';
import 'package:new_ilearn/exports.dart';
import 'package:new_ilearn/features/archive_screen/presentation/archive_screen.dart';
import 'package:new_ilearn/features/bottom_navigation/data/models/title_icon_model.dart';
import 'package:new_ilearn/features/folders/presentation/folders_screen.dart';
import 'package:new_ilearn/features/groups/presentation/groups_screen.dart';
import 'package:new_ilearn/features/home/presentation/screens/home_screen.dart';
 import 'package:new_ilearn/features/profile/presentation/screens/profile_page.dart';

final List<TitleIconModel> navBarItems = [

  TitleIconModel(
    screens: FoldersScreen(),
  ),
  TitleIconModel(
    screens: GroupsScreen(),
  ),  TitleIconModel(
    screens: HomeScreen(),
  ),

  TitleIconModel(
    screens: ArchiveScreen(),
  ),

  TitleIconModel(
    screens: ProfileScreen(),
  ),
];

