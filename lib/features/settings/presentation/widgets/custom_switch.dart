import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';

import '../../../../exports.dart';

class SettingsSectionWidget extends StatelessWidget {
  final List<Widget> children;
  final bool showDivider;

  const SettingsSectionWidget({
    super.key,
    required this.children,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            endIndent: SettingsConstants.dividerIndent,
            indent: SettingsConstants.dividerIndent,
          ),
        ...children,
      ],
    );
  }
}