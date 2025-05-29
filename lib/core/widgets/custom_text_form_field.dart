// ignore_for_file: must_be_immutable

import '../../exports.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      required this.obscureText,
      this.validator,
      this.prefixSvgIcon,
      this.style,
      this.suffixSvgIcon,
      this.onTap,
      this.radiusOfContainer,
      this.otherSuffixSvgIcon,
      required this.controller,
      required this.isPassword,
      this.maxLines,
      this.color,
      this.textAlign,
      this.textAlignVertical,
      this.padding,
      this.backgroundColor,
      this.enabled});
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  bool obscureText;
  bool isPassword = false;
  TextStyle? style =
      getRegularTextStyle(fontSize: 12, color: AppColors.darkGray);
  final String? Function(String?)? validator;
  final Widget? prefixSvgIcon;
  final Widget? suffixSvgIcon;
  final Widget? otherSuffixSvgIcon;
  final double? radiusOfContainer;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final int? maxLines;
  final bool? enabled;
  Color? color = AppColors.borderColor2;
  Color? backgroundColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 24,
            color: AppColors.black.withOpacity(0.08)
          )
        ],
        borderRadius: BorderRadius.circular(10.r),
        border: Border(
          right: BorderSide(color: AppColors.primaryColor,width: 1.5)
        )
      ),
      child: Center(
        child: TextFormField(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          enabled: widget.enabled ?? true,
          validator: widget.validator,
          maxLines: widget.maxLines ?? 1,
          autocorrect: true,
          textAlign:widget.textAlign ?? TextAlign.right,
          textAlignVertical:widget.textAlignVertical ??  TextAlignVertical.top,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscuringCharacter: '*',
          style: getRegularTextStyle(fontSize: 12, color: AppColors.primaryColor,),
          decoration: InputDecoration(
            contentPadding: widget.padding ?? EdgeInsets.zero,
            hintText: widget.hintText,
            hintStyle: widget.style ?? getRegularTextStyle(fontSize: 12, color: AppColors.borderColor2),
            errorStyle: getRegularTextStyle(fontSize: 12, color: AppColors.red),
            border: InputBorder.none,
            prefixIcon: widget.prefixSvgIcon != null ? Padding(
                    padding: EdgeInsets.all(10.r),
                    child: widget.prefixSvgIcon,
                  )
                : null,
            suffixIcon: widget.suffixSvgIcon.isNotNull
                ? Padding(
                    padding: EdgeInsets.all(10.r), child: widget.suffixSvgIcon)
                : widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.obscureText = !widget.obscureText;
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.all(10.r),
                            child: widget.obscureText
                                ? SvgPicture.asset(AppAssets.eyeIcon)
                                : SvgPicture.asset(AppAssets.eyeOffIcon)),
                      )
                    : null,
          ),
          onTap: () => widget.onTap?.call(),
        ),
      ),
    );
  }
}
