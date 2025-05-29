import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/widgets/circleStatistics.dart';

import '../../exports.dart';


class ButtonAnimation extends StatelessWidget {
  const ButtonAnimation(
      {super.key,
      required this.status,
      required this.onClickButton,
      required this.titleButton,
      this.showProgress = false,
      this.progressText = '',
      this.progress = 0});

  final String status;
  final Function() onClickButton;
  final String titleButton;
  final bool showProgress;
  final String progressText;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          gradient:
              status == 'success' || status == 'failed' ? null : AppColors.buttonColor,
          color: status == 'success'
              ? Colors.green
              : status == 'failed'
                  ? Colors.red
                  : AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: BoxConstraints(minWidth: 50.w),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        width: status == 'unClicked' ? MediaQuery.of(context).size.width : 50.w,
        height: 48.h,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onClickButton,
          child: Center(
            child: status == 'unClicked'
                ? TextWidget(
                    text: titleButton,
                    fontSizeText: 14,
                    colorText: Colors.white,
                  )
                : status == 'success'
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : status == 'failed'
                        ? const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          )
                        : showProgress && progress < 1
                            ? Center(
                                child: CircleStatistics(
                                  backgroundWidth: 3,
                                  paddingEnd: 0,
                                  backgroundColor: Colors.white60,
                                  colorText: Colors.white,
                                  title: '$progressText%',
                                  percent: progress,
                                  color: Colors.white,
                                  radius: 20,
                                ),
                              )
                            : const CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: Colors.white,
                              ),
          ),
        ),
      ),
    );
  }
}
