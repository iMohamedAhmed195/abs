import 'package:new_ilearn/features/auth/presentation/widget/AuthenticationThrough_widget.dart';

import '../../../../exports.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 18.h),
        Center(child: TextWidget(text: AppStrings.logInThrough.trans, fontSizeText: 16)),
        SizedBox(height: 12.h),
        const AuthenticationThroughWidget(isLogin: true),
      ],
    );
  }
}
