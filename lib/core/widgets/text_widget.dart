

import '../../exports.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.colorText,
      this.fontWeight = FontWeight.w400,
      required this.fontSizeText,
      this.textAlign,
      this.textOverflow,
      this.maxLine});

  final String text;
  final Color? colorText;
  final FontWeight fontWeight;
  final double fontSizeText;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLine,
        overflow: textOverflow,
        style: TextStyle(
            fontFamily: 'Almarai',
            color: colorText ?? Theme.of(context).textTheme.titleLarge!.color,
            fontWeight: fontWeight,
            fontSize: fontSizeText.sp),
      ),
    );
  }
}
