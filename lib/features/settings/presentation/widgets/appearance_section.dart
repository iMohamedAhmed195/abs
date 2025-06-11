import 'package:new_ilearn/core/utils/theme/theme_cubit.dart';
import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/switch_widget.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/tile_widget.dart';

import '../../../../exports.dart';

class AppearanceSection extends StatelessWidget {
  final bool value  ;
  final Function(bool) onThemeChanged;

  const AppearanceSection({
    super.key,
    required this.value,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TileWidget(
      icon: AppAssets.themicon,
      title: AppStrings.nightMode.trans,
      trailing: CustomSwitch(
        value: value,
        onChanged: onThemeChanged,
      ),
    );
  }
}
