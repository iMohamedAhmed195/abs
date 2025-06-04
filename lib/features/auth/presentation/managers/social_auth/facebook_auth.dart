import 'dart:developer';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:new_ilearn/core/models/api_response.dart';

class FaceBookAuth {
  Future<ApiResponse> authWithFaceBook() async {
    try {
      LoginResult account = await FacebookAuth.i.login();
      log('Success Login With FaceBook');
      AccessToken? token = account.accessToken;
      if (token != null) {
        log('token form FaceBook=> ${token.tokenString}');
        return ApiResponse(token.tokenString, true, 200);
      }
    } catch (e) {
      return ApiResponse(e.toString(), false, 0);
    }
    return ApiResponse('هناك خلل ما قد حدث', false, 0);
  }

  Future<void> signOutToFaceBook() async {
    try {
      await FacebookAuth.i.logOut();
    } catch (e) {
      log(e.toString());
    }
  }
}
