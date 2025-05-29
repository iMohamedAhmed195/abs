import 'package:new_ilearn/custom_easy_localization.dart';
import 'package:new_ilearn/i_learn_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_ilearn/config/services/firebase_service.dart';
import 'exports.dart';
import 'firebase_options.dart';
import 'global_bloc_observer.dart';

void main() async {
  await init;

  runApp(CustomEasyLocalization(child: ILearnApp()));
}

Future get init async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  await ServiceLocator().init;

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