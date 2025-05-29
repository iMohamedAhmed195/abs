import '../../../../exports.dart';

class LoginHeaderBackGroundSection extends StatelessWidget {
  const LoginHeaderBackGroundSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(alignment: Alignment.topLeft, child: Image.asset(AppAssets.bubbleLoginLeftLight)),
        Align(alignment: Alignment.topLeft, child: Image.asset(AppAssets.bubbleLoginLeft)),
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height / (MediaQuery.of(context).size.height / 50),
          ),
          child: Align(alignment: Alignment.topRight, child: Image.asset(AppAssets.bubbleLoginRight)),
        ),
      ],
    );
  }
}
