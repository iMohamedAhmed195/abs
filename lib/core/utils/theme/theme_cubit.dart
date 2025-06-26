import 'package:abs/config/constants/app_prefs.dart';
import '../../../exports.dart';

class ThemeCubit extends Cubit<CubitStates> {
  ThemeCubit() : super(InitialState()) {
    loadTheme();
  }


  bool _isDark = false;

  bool get isDark => _isDark;

  Future<void> loadTheme() async {
    _isDark = await AppPrefs.getDarkMode;
    emit(ChangeState());
  }

  Future<void> changeThemeMode() async {
    _isDark = !_isDark;
    emit(ChangeState());
    await AppPrefs.setDarkMode(_isDark);
    print('isDark: $_isDark');
    emit(ChangeState());
  }
}