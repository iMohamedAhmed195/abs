import 'package:new_ilearn/features/settings/data/statics/settings_service.dart';
import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';

import '../../../../exports.dart';

class LanguageDropdownWidget extends StatelessWidget {
  final String currentLanguage;
  final Function(String?) onChanged;

  const LanguageDropdownWidget({
    super.key,
    required this.currentLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: SettingsConstants.dropdownPadding,
      width: MediaQuery.of(context).size.width * SettingsConstants.dropdownWidth,
      height: SettingsConstants.dropdownHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Theme.of(context).highlightColor,
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        dropdownColor: AppColors.white,
        icon: const Icon(Icons.keyboard_arrow_down),
        alignment: AlignmentDirectional.center,
        isExpanded: true,
        borderRadius: BorderRadius.circular(6),
        underline: const Divider(color: Colors.transparent),
        hint: TextWidget(
          text: SettingsService().getLanguageDisplayName(currentLanguage),
          fontSizeText: 16,
          fontWeight: FontWeight.bold,
        ),
        items: _buildLanguageItems(),
        onChanged: onChanged,
      ),
    );
  }
  List<DropdownMenuItem<String>> _buildLanguageItems() {
    return SettingsConstants.languages
        .map((language) => DropdownMenuItem<String>(
      value: language.code,
      child: TextWidget(
        text: language.displayName,
        fontSizeText: 16,
        fontWeight: FontWeight.bold,
      ),
    ))
        .toList();
  }
}