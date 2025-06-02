
import 'package:flutter/material.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../exports.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: CustomAppBar(title: AppStrings.aboutTheApp.trans),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(bottom: 25),
                padding: const EdgeInsetsDirectional.all(20),
                decoration: BoxDecoration(
                    gradient: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Image.asset(
                  AppAssets.logoName,
                  color: Colors.white,
                  height: 80,
                  width: 80,
                ),
              ),
              TextWidget(
                text: 'Version 1.0.0',
                fontSizeText: 18,
                fontWeight: FontWeight.w600,
                colorText: AppColors.primaryColor,
              ),
            ],
          ),
          const Divider(
            color: Colors.transparent,
          ),
          TextWidget(
            textAlign: TextAlign.center,
            text:
                'Copyright © ${DateTime.now().year} ILearnAi.\n All rights reserved.',
            fontSizeText: 14,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
