// settings_screen.dart
import 'package:flutter/material.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';
import 'package:new_ilearn/features/settings/data/statics/settings_service.dart';
import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/appearance_section.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/danger_zone_section.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/language_section.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/navigation_section.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/notification_section.dart';
import '../../../../exports.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SettingsState _settings;
  final SettingsService _settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings() {
    _settings = _settingsService.getCurrentSettings();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(appBar: CustomAppBar(title: AppStrings.settings.trans),
      child: ListView(
        padding: SettingsConstants.listPadding,
        children: [
          LanguageSection(
            settings: _settings,
            onLanguageChanged: _handleLanguageChange,
          ),
          AppearanceSection(
            settings: _settings,
            onThemeChanged: _handleThemeChange,
          ),
          NotificationSection(
            settings: _settings,
            onNotificationChanged: _handleNotificationChange,
            onCustomNotificationTap: _navigateToCustomNotifications,
          ),
          NavigationSection(
            onNavigate: _navigateToPage,
            onInviteFriends: _handleInviteFriends,
            onGroupsJoined: _handleGroupsJoined,
          ),
          DangerZoneSection(
            onDeleteAccount: _handleDeleteAccount,
          ),
        ],
      ),
    );
  }

  // Event Handlers
  void _handleLanguageChange(String? selectedLanguage) {
    if (selectedLanguage != null && selectedLanguage != _settings.language) {
      setState(() {
        _settings = _settings.copyWith(language: selectedLanguage);
      });
      _settingsService.updateLanguage(selectedLanguage);
    }
  }

  void _handleThemeChange(bool isDarkMode) {
    if (isDarkMode != _settings.nightMode) {
      setState(() {
        _settings = _settings.copyWith(nightMode: isDarkMode);
      });
      _settingsService.updateTheme(isDarkMode);
    }
  }

  void _handleNotificationChange(bool isMuted) {
    if (isMuted != _settings.muteNotifications) {
      setState(() {
        _settings = _settings.copyWith(muteNotifications: isMuted);
      });
      _settingsService.updateNotificationMute(isMuted);
    }
  }

  void _handleInviteFriends() {
    _settingsService.inviteFriends();
  }

  void _handleGroupsJoined() {
    Navigator.pop(context);
  }

  void _handleDeleteAccount() {
    _settingsService.deleteAccount();
    Navigator.pop(context); // Close dialog after action
  }

  // Navigation
  void _navigateToPage(String routePage) {

    Navigator.pushNamed(context, '$routePage');
  }

  void _navigateToCustomNotifications() {
    Routes.notificationRoute.moveTo();
   }
}