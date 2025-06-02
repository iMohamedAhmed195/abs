import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/features/settings/presentation/widgets/tile_widget.dart';

import '../../../../exports.dart';

class DangerZoneSection extends StatelessWidget {
  final VoidCallback onDeleteAccount;

  const DangerZoneSection({
    super.key,
    required this.onDeleteAccount,
  });

  @override
  Widget build(BuildContext context) {
    return TileWidget(
      colorTile: Colors.red,
      icon: AppAssets.deleteAccount,
      trailing: const SizedBox(),
      title: AppStrings.deleteAccount.trans,
      onClickIcon: () => _showDeleteDialog(context),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    dialog(
      context: context,
      title: AppStrings.deleteAccount.trans,
      subTitle: AppStrings.deleteAccountDetails.trans,
      titleButtonAccess: AppStrings.delete.trans,
      titleButtonReject: AppStrings.cancel.trans,
      onClickAccessButton: onDeleteAccount,
      onClickRejectButton: () => Navigator.pop(context),
    );
  }
}