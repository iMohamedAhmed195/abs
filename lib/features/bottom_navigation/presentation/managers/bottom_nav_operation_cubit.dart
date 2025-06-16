import '../../../../exports.dart';

class BottomNavOperationCubit extends Cubit<int> {
  BottomNavOperationCubit() : super(0);
  GlobalKey<ScaffoldState>? scaffoldKey= GlobalKey<ScaffoldState>();

  closeDrawer() {
    scaffoldKey?.currentState?.closeDrawer();
  }
  openDrawer() {
    scaffoldKey?.currentState?.openDrawer();
  }

  getNewScaffoldKey() {
    scaffoldKey = GlobalKey();
    return scaffoldKey;
  }

  int index = 0;
  changeIndex(int index) {
    this.index = index;
    emit(index);
  }

  goToHome() {
    index = 0;
    emit(index);
    // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
  }
}
