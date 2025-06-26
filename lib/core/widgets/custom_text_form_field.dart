import '../../exports.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
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
    this.textDirection,
    this.color,
    this.onChanged,
    this.padding,
    this.backgroundColor,
    this.enabled,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  bool obscureText;
  bool isPassword = false;
  TextStyle? style = getRegularTextStyle(fontSize: 12, color: AppColors.darkGray);
  final String? Function(String?)? validator;
  final Widget? prefixSvgIcon;
  final Widget? suffixSvgIcon;
  final Widget? otherSuffixSvgIcon;
  final double? radiusOfContainer;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  final void Function(String val)? onChanged;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool? enabled;
  Color? color = AppColors.borderColor2;
  Color? backgroundColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged ?? (value) {},
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      enabled: widget.enabled ?? true,
      validator: widget.validator,
      maxLines: widget.maxLines ?? 1,
      textInputAction: TextInputAction.done,
      enableInteractiveSelection: true,
      autocorrect: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscuringCharacter: '*',
      textDirection: widget.textDirection ?? TextDirection.ltr,
      style: getRegularTextStyle(fontSize: 16, color: AppColors.primaryColor),
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        contentPadding: widget.padding ?? EdgeInsets.zero,
        hintText: widget.hintText,
        hintStyle: widget.style ?? getRegularTextStyle(fontSize: 16, color: AppColors.borderColor2),
        errorStyle: getRegularTextStyle(fontSize: 16, color: AppColors.red),
        filled: true,
        fillColor: widget.backgroundColor ?? AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radiusOfContainer ?? 12.r)),
          borderSide: BorderSide(color: widget.color ?? AppColors.borderColor2, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radiusOfContainer ?? 12.r)),
          borderSide: BorderSide(color: widget.color ?? AppColors.borderColor2, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radiusOfContainer ?? 12.r)),
          borderSide: BorderSide(color: widget.color ?? AppColors.primaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radiusOfContainer ?? 12.r)),
          borderSide: BorderSide(color: widget.color ?? AppColors.red, width: 1.4),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.radiusOfContainer ?? 12.r)),
          borderSide: BorderSide(color: widget.color ?? AppColors.borderColor2, width: 1.4),
        ),
        prefixIcon:
            widget.prefixSvgIcon != null ? Padding(padding: EdgeInsets.all(10.r), child: widget.prefixSvgIcon) : null,
        suffixIcon: widget.suffixSvgIcon.isNotNull
            ? Padding(
                padding: EdgeInsets.all(10.r), child: widget.suffixSvgIcon)
            :null
        // widget.isPassword
        //         ? GestureDetector(
        //             onTap: () {
        //               setState(() {
        //                 widget.obscureText = !widget.obscureText;
        //               });
        //             },
        //             child: Padding(
        //                 padding: EdgeInsets.all(16.r),
        //                 child: widget.obscureText
        //                     ? SvgPicture.asset(AppAssets.eyeIcon)
        //                     : SvgPicture.asset(AppAssets.eyeOffIcon)),
        //           )
        //         : null,
      ),
      onTap: () => widget.onTap?.call(),
    );
  }
}
