import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/features/profile/presentation/screens/updateProfile_pge.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/profileInformation_widget.dart';

import '../../../../exports.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات ثابتة للعرض
    const String phoneNumber = "01123456789";
    const String gender = "male";
    const String birthDate = "1995-05-20";
    const String email = "ahmed@example.com";
    const String memberId = "123165498764551";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: phoneNumber,
          title: AppStrings.phone.trans,
        ),
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: _getGenderType(type: gender),
          title: AppStrings.gender.trans,
        ),
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: formatDate(birthDate),
          title: AppStrings.dateOfBirth.trans,
        ),
        ProfileInformation(
          valueOfTitle: email,
          title: AppStrings.email.trans,
        ),
        ProfileInformation(
          valueOfTitle: memberId,
          title: AppStrings.memberId.trans,
        ),
        const SizedBox(height: 32),
        ButtonWidget(
          title: AppStrings.updateProfile.trans,
          onClick: () => _updateProfile(context),
        ),
        const SizedBox(height: 16),
        ButtonWidget(
          colorButton: const Color(0xffFEECEB),
          colorTitleButton: const Color(0xffF6695E),
          title: AppStrings.logOut.trans,
          onClick: () async {
            await dialog(
              context: context,
              title: AppStrings.logOut.trans,
              subTitle: AppStrings.logOutDescription.trans,
              titleButtonAccess: AppStrings.exit.trans,
              titleButtonReject: AppStrings.cancel.trans,
              onClickAccessButton: () {
                // مكان لتسجيل الخروج لاحقًا
              },
              onClickRejectButton: () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ],
    );
  }

  void _updateProfile(BuildContext context) {
    showModelSheetWidget(
      context,
        UpdateProfilePage(
        // لما يتوفر باكند ضيف بيانات المستخدم هنا
        // user: user,
      ),
    );
  }

  static String _getGenderType({required String type}) {
    switch (type) {
      case 'male':
        return AppStrings.male.trans;
      case 'female':
        return AppStrings.female.trans;
      default:
        return '';
    }
  }
}
