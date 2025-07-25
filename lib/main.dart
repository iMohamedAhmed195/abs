import 'package:abs/custom_easy_localization.dart';
import 'package:abs/abs_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:abs/config/services/firebase_service.dart';
import 'config/shared_pereferences.dart' show ShApp;
import 'exports.dart';
import 'firebase_options.dart';
import 'global_bloc_observer.dart';

void main() async {
  await init;

  runApp(CustomEasyLocalization(child: AbsApp()));
}

Future get init async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  await ServiceLocator().init;
 await ShApp().getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseService().init;
  // SocketService().connect;
  //hideAndroidBottomControlBar;

// initialize all dependencies
  await EasyLocalization.ensureInitialized();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}