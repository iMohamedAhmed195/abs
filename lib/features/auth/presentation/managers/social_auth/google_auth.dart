import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_ilearn/core/models/api_response.dart';

class GoogleAuth {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['email', 'profile', 'openid']);

  Future<ApiResponse> authWithGoogle() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        log('Suucess Login With Google');
        GoogleSignInAuthentication auth = await account.authentication;
        log('token form google=>${auth.accessToken}');
        log('idToken form google=>${auth.idToken}');
        log('name form google=>${account.displayName}');
        log('email form google=>${account.email}');
        if (auth.accessToken != null) {
          return ApiResponse('${auth.accessToken}', true, 200);
        }
      }
    } catch (e) {
      return ApiResponse(e.toString(), false, 0);
    }
    return ApiResponse('هناك خلل ما قد حدث', false, 0);
  }

  Future<void> signOutToGoogle() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
