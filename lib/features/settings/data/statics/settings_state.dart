// settings_models.dart
import '../../../../exports.dart';

class SettingsState {
  final String language;
  final bool nightMode;
  final bool muteNotifications;

  const SettingsState({
    required this.language,
    required this.nightMode,
    required this.muteNotifications,
  });

  SettingsState copyWith({
    String? language,
    bool? nightMode,
    bool? muteNotifications,
  }) {
    return SettingsState(
      language: language ?? this.language,
      nightMode: nightMode ?? this.nightMode,
      muteNotifications: muteNotifications ?? this.muteNotifications,
    );
  }
}

class LanguageOption {
  final String code;
  final String displayName;

  const LanguageOption({
    required this.code,
    required this.displayName,
  });
}

class SettingsTileModel {
  final String icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? color;

  const SettingsTileModel({
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.color,
  });
}

// settings_constants.dart
class SettingsConstants {
  static const List<LanguageOption> languages = [
    LanguageOption(code: 'ar', displayName: 'العربية'),
    LanguageOption(code: 'en', displayName: 'English'),
  ];

  static const double dropdownWidth = 0.35;
  static const double dropdownHeight = 35.0;
  static const double dividerIndent = 17.0;
  static const EdgeInsetsDirectional listPadding =
  EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 15);
  static const EdgeInsetsDirectional dropdownPadding =
  EdgeInsetsDirectional.symmetric(horizontal: 5);
}