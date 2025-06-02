import 'package:new_ilearn/features/settings/data/statics/settings_state.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/custom_switch.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/switch_widget.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/tile_widget.dart';

import '../../../../exports.dart';

class NotificationSection extends StatelessWidget {
  final SettingsState settings;
  final Function(bool) onNotificationChanged;
  final VoidCallback onCustomNotificationTap;

  const NotificationSection({
    super.key,
    required this.settings,
    required this.onNotificationChanged,
    required this.onCustomNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSectionWidget(
      children: [
        TileWidget(
          icon: AppAssets.volumeIcon,
          title: AppStrings.muteNotifications.trans,
          trailing: CustomSwitch(
            value: settings.muteNotifications,
            onChanged: onNotificationChanged,
          ),
        ),
        if (!settings.muteNotifications)
          TileWidget(
            icon: AppAssets.notificationIconSetting,
            title: AppStrings.customNotification.trans,
            onClickIcon: onCustomNotificationTap,
          ),
      ],
    );
  }
}