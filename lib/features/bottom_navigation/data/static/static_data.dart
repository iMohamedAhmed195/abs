import 'package:abs/core/models/title_icon_model.dart';
import 'package:abs/exports.dart';
import 'package:abs/features/dashboard/presentation/screens/dashboard_screen.dart';

final List<TitleIconModel> navBarItems = [
  TitleIconModel(
    screens: DashboardScreen(),
    name: AppStrings.home.trans,
    icon: AppAssets.homeSvg,
  ),
  TitleIconModel(
    screens: DashboardScreen(),
    name: AppStrings.shipments.trans,
    icon: AppAssets.shipmentsSvg,
  ),
  TitleIconModel(
    screens: DashboardScreen(),
    name: AppStrings.receipts.trans,
    icon: AppAssets.receiptsSvg,
  ),

  TitleIconModel(
    screens: DashboardScreen(),
    name: AppStrings.path.trans,
    icon: AppAssets.pathSvg,
  ),
  TitleIconModel(
    screens: DashboardScreen(),
    name: AppStrings.myProfile.trans,
    icon: AppAssets.myProfileSvg,
  ),

];

