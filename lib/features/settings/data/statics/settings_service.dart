// settings_service.dart
import 'package:new_ilearn/config/shared_pereferences.dart';
import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';

class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  SettingsState getCurrentSettings() {
    return SettingsState(
      language: ShApp().getLanguageChar,
      nightMode: ShApp().getTheme == ThemeKey.dark.name,
      muteNotifications: ShApp().muteNotification,
    );
  }

  Future<void> updateLanguage(String languageCode) async {
    // TODO: Implement language change
    // await ShApp().setLanguage(languageCode);
  }

  Future<void> updateTheme(bool isDarkMode) async {
    // TODO: Implement theme change
    // await ShApp().setTheme(isDarkMode ? ThemeKey.dark.name : ThemeKey.light.name);
  }

  Future<void> updateNotificationMute(bool isMuted) async {
    // TODO: Implement notification mute
    // await ShApp().setMuteNotification(isMuted);
  }

  Future<void> deleteAccount() async {
    // TODO: Implement delete account logic
  }

  Future<void> inviteFriends() async {
    // TODO: Implement invite friends logic
  }

  String getLanguageDisplayName(String languageCode) {
    return SettingsConstants.languages
        .firstWhere(
          (lang) => lang.code == languageCode,
      orElse: () => const LanguageOption(code: '', displayName: ''),
    )
        .displayName;
  }
}