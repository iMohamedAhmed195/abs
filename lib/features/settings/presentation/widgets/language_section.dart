import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/language_dropdown.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/tile_widget.dart';

import '../../../../exports.dart';

class LanguageSection extends StatelessWidget {
  final SettingsState settings;
  final Function(String?) onLanguageChanged;

  const LanguageSection({
    super.key,
    required this.settings,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TileWidget(
      icon: AppAssets.languageIcon,
      title: AppStrings.language.trans,
      trailing: LanguageDropdownWidget(
        currentLanguage: settings.language,
        onChanged: onLanguageChanged,
      ),
    );
  }
}