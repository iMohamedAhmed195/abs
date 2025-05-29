

import '../../exports.dart';

class AuthenticatedIconButtonScreen extends StatelessWidget {
  const AuthenticatedIconButtonScreen(
      {super.key,
      required this.onClick,
      this.showSubTitle = false,
      required this.title,
      this.subTitle = ''});

  final Function() onClick;
  final bool showSubTitle;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 20.h),
      child: InkWell(
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: title,
              fontSizeText: 15,
              fontWeight: FontWeight.w300,
            ),
            Visibility(
              visible: showSubTitle,
              child: TextWidget(
                text: subTitle,
                fontSizeText: 15,
                fontWeight: FontWeight.w300,
                colorText: Colors.blue,
              ),
            ),
             SizedBox(
              width: 6.w,
            ),
            InkWell(
              onTap: onClick,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.primaryColor,
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
