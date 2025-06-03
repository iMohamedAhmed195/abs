import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pinput/pinput.dart';

import '../../../../exports.dart';

class WriteOtpSection extends StatelessWidget {
  const WriteOtpSection({super.key, required this.onValueChanged});
  final Function({required String otpNumber }) onValueChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 4,
              defaultPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                textStyle:
                    getRegularTextStyle(fontSize: 36, color: AppColors.black),
                decoration: BoxDecoration(
                 color: AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                textStyle:
                    getRegularTextStyle(fontSize: 20, color: AppColors.primaryColor),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              followingPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                textStyle:
                    getRegularTextStyle(fontSize: 20, color: AppColors.black),
                decoration: BoxDecoration(
                 color: AppColors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              submittedPinTheme: PinTheme(
                width: 50.w,
                height: 50.h,
                textStyle:
                    getRegularTextStyle(fontSize: 20, color: AppColors.primaryColor),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onCompleted: (value) {
                onValueChanged.call(otpNumber: value);
                log(value);
              },
              onChanged: (value) {
                removeError(context, Errors.OTP_ERROR);
              },
            ),
          ),
        ),
      ],
    );
  }
}
