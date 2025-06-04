
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_ilearn/core/utils/app_assets.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import 'package:new_ilearn/features/auth/presentation/managers/social_auth/google_auth.dart';

class AuthenticationThroughWidget extends StatelessWidget {
  const AuthenticationThroughWidget({super.key, this.isLogin = false});

  final bool isLogin;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.read<AuthCubit>().loginWithGoogle();
              // BlocProvider.of<AuthBloc>(context)
              //     .add(AuthWithGoogleEvent(isLogin: isLogin));
            },

            child: Image.asset(AppAssets.google)),
        const SizedBox(
          width: 10,
        ),
        // InkWell(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     onTap: () {
        //       // BlocProvider.of<AuthBloc>(context)
        //       //     .add(AuthWithTwitterEvent(isLogin: isLogin));
        //     },
        //     child: Image.asset(AppAssets.twitter)),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              context.read<AuthCubit>().loginWithFace();
            },
            child: Image.asset(AppAssets.facebook)),
      ],
    );
  }
}
