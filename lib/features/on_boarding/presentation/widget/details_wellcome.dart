

import '../../../../exports.dart';

class DetailsWelcome extends StatelessWidget {
  const DetailsWelcome(
      {super.key,
      required this.subTitle,
      required this.title,
      required this.image,
      this.showButton = false});

  final String title;
  final String subTitle;
  final String image;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
        Image.asset(
          image,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Padding(
          padding:
              EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextWidget(
                  textAlign: TextAlign.center,
                  text: title.trans,
                  fontWeight: FontWeight.bold,
                  fontSizeText: 22),
              SizedBox(
                height: 10.h,
              ),
              TextWidget(
                textAlign: TextAlign.center,
                text: subTitle.trans,
                fontSizeText: 17,
                fontWeight: FontWeight.w300,
              ),
              SizedBox(
                height: 8.h,
              ),
              Visibility(
                visible: showButton,
                child: ButtonWidget(
                  height: MediaQuery.of(context).size.height*0.05,
                  onClick: () {
                    Routes.startScreenRoute.moveTo();
                    // Navigator.pushReplacementNamed(context, '/Start_Screen');
                  },
                  title: AppStrings.letsGo.trans,
                  width: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.width / 123),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
