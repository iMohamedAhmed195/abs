import 'package:new_ilearn/features/settings/presentation/widgets/custom_switch.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/tile_widget.dart';

import '../../../../exports.dart';

class NavigationSection extends StatelessWidget {
  final Function(String) onNavigate;
  final VoidCallback onInviteFriends;
  final VoidCallback onGroupsJoined;

  const NavigationSection({
    super.key,
    required this.onNavigate,
    required this.onInviteFriends,
    required this.onGroupsJoined,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSectionWidget(
      showDivider: true,
      children: [
        TileWidget(
          icon: AppAssets.userHeart,
          title: AppStrings.inviteFriends.trans,
          onClickIcon: onInviteFriends,
        ),
        TileWidget(
          icon: AppAssets.groupsIcon,
          title: AppStrings.groupsJoined.trans,
          onClickIcon: onGroupsJoined,
        ),
        TileWidget(
          icon: AppAssets.termsIcon,
          title: AppStrings.termsOfService.trans,
          onClickIcon: () => onNavigate(Routes.termsOfServiceScreen),
        ),
        TileWidget(
          icon: AppAssets.aboutAppIcon,
          title: AppStrings.aboutTheApp.trans,
          onClickIcon: () => onNavigate(Routes.aboutAppScreen),
        ),
        TileWidget(
          icon: AppAssets.privacyPolicyIcon,
          title: AppStrings.privacyPolicy.trans,
          onClickIcon: () => onNavigate( Routes.privacyPolicyScreen),
        ),
      ],
    );
  }
}