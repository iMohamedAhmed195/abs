import '../../../../exports.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final Color? activeColor;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      trackColor: value
          ? WidgetStatePropertyAll(activeColor!)
          : WidgetStatePropertyAll(Theme.of(context).indicatorColor),
      thumbColor: const WidgetStatePropertyAll(Colors.white),
      trackOutlineColor: const WidgetStatePropertyAll(Colors.black12),
      activeColor: activeColor,
      value: value,
      inactiveTrackColor: Colors.black26,
      onChanged: onChanged,
    );
  }
}