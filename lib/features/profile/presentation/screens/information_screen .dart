import 'package:flutter/material.dart';
import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/features/profile/presentation/managers/update_profile_cubit.dart';
import 'package:new_ilearn/features/profile/presentation/screens/update_profile_screen.dart';
import 'package:new_ilearn/features/profile/presentation/widgets/profileInformation_widget.dart';

import '../../../../exports.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: AppPrefs.user!.user?.phoneNumber ?? '',
          title: AppStrings.phone.trans,
        ),
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: _getGenderType(type: AppPrefs.user!.user?.gender ?? ''),
          title: AppStrings.gender.trans,
        ),
        ProfileInformation(
          onTap: () => _updateProfile(context),
          valueOfTitle: formatDate(AppPrefs.user!.user?.birthDate ?? ''),
          title: AppStrings.dateOfBirth.trans,
        ),
        ProfileInformation(
          valueOfTitle: AppPrefs.user!.user?.email ?? '',
          title: AppStrings.email.trans,
        ),
        ProfileInformation(
          valueOfTitle: AppPrefs.user!.user?.inviteCode.toString() ?? '',
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
      BlocProvider(
        create: (context) => UpdateProfileCubit(cache : ServiceLocator.instance.getIt(),useCase: ServiceLocator.instance.getIt()),
        child: UpdateProfilePage(
          // لما يتوفر باكند ضيف بيانات المستخدم هنا
          // user: user,
        ),
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
