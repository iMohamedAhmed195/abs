import 'package:flutter/material.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/core/widgets/text_widget.dart';

class FormAuthentication extends StatelessWidget {
  const FormAuthentication(
      {super.key,
      required this.textInputType,
      required this.textEditingController,
      required this.hint,
      required this.title,
      this.textInputAction = TextInputAction.next,
      this.passwordForm = false,
      this.marginBottom = 16,
      this.suffixIcon,
      this.enabled = true,
      this.prefixIcon,
      this.errorFiled,
      this.limitChar,
      this.fillColor,this.onChange});

  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool passwordForm;
  final double marginBottom;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final String? errorFiled;
  final int? limitChar;
  final Color? fillColor;
final Function(String val) ?onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: marginBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: title, fontSizeText: 14),
          const SizedBox(
            height: 8,
          ),
          TextFiledWidget(
            onChange: onChange,
              maxLength: limitChar,
              textStyle: TextStyle(
                  color: Theme.of(context).textTheme.titleLarge!.color!),
              hintColor: Theme.of(context).textTheme.titleMedium!.color!,
              fillColor: fillColor ?? Theme.of(context).splashColor,
              error: errorFiled,
              suffixIcon: prefixIcon,
              enabled: enabled,
              prefixIcon: suffixIcon,
              thisPassword: passwordForm,
              textInputAction: textInputAction,
              hintText: hint,
              type: textInputType,
              textEditingController: textEditingController),
        ],
      ),
    );
  }
}
