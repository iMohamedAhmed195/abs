import '../../../../exports.dart';

class LoginTitleHeaderSection extends StatelessWidget {
  const LoginTitleHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(text: AppStrings.login.trans, fontSizeText: 32, fontWeight: FontWeight.bold),
        SizedBox(height: 8.h),
        Row(
          children: [
            TextWidget(text: AppStrings.welcomeBack.trans, fontSizeText: 19, fontWeight: FontWeight.w300),
            SizedBox(width: 10.w),
            const Icon(Icons.favorite, color: Colors.black, size: 15),
          ],
        ),
        SizedBox(height: 18.h),
      ],
    );
  }
}
