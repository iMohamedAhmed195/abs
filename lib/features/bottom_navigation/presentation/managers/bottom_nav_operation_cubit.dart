import '../../../../exports.dart';

class BottomNavOperationCubit extends Cubit<int> {
  BottomNavOperationCubit() : super(0);
  GlobalKey<ScaffoldState>? scaffoldKey;

  closeDrawer() {
    scaffoldKey = GlobalKey();
    scaffoldKey?.currentState?.closeDrawer();
  }

  getNewScaffoldKey() {
    scaffoldKey = GlobalKey();
    return scaffoldKey;
  }

  int index = 0;
  changIndex(int index) {
    this.index = index;

    emit(index);
  }

  goToHome() {
    index = 0;
    emit(index);
    // Routes.bottomNavRoute.moveToCurrrentRouteAndRemoveAll;
  }
}
