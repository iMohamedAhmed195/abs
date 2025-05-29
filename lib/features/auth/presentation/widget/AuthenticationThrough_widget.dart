
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';

class AuthenticationThroughWidget extends StatelessWidget {
  const AuthenticationThroughWidget({super.key, this.isLogin = false});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              // BlocProvider.of<AuthBloc>(context)
              //     .add(AuthWithGoogleEvent(isLogin: isLogin));
            },
            child: Image.asset(AppAssets.google)),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              // BlocProvider.of<AuthBloc>(context)
              //     .add(AuthWithTwitterEvent(isLogin: isLogin));
            },
            child: Image.asset(AppAssets.twitter)),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              // BlocProvider.of<AuthBloc>(context)
              //     .add(AuthWithFaceBookEvent(isLogin: isLogin));
            },
            child: Image.asset(AppAssets.facebook)),
      ],
    );
  }
}
