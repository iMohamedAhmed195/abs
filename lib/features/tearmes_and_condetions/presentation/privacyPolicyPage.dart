
// New code
import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../exports.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.privacyPolicy.trans),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.privacyPolicyIntro.trans,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),

            // Section 1
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection1Title.trans,
              content: AppStrings.privacyPolicySection1Content.trans,
            ),

            // Section 2
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection2Title.trans,
              content: AppStrings.privacyPolicySection2Content.trans,
            ),

            // Section 3
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection3Title.trans,
              content: AppStrings.privacyPolicySection3Content.trans,
            ),

            // Section 4
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection4Title.trans,
              content: AppStrings.privacyPolicySection4Content.trans,
            ),

            // Section 5
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection5Title.trans,
              content: AppStrings.privacyPolicySection5Content.trans,
            ),

            // Section 6
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection6Title.trans,
              content: AppStrings.privacyPolicySection6Content.trans,
            ),

            // Section 7
            _buildSection(
              context,
              title: AppStrings.privacyPolicySection7Title.trans,
              content: AppStrings.privacyPolicySection7Content.trans,
            ),

            // Contact section
            const SizedBox(height: 24),
            Text(
              AppStrings.privacyPolicyContactTitle.trans,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppStrings.privacyPolicyContactContent.trans,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        ..._formatContent(content),
        const SizedBox(height: 16),
      ],
    );
  }

  List<Widget> _formatContent(String content) {
    // Split by newlines and create widgets for each line
    return content.split('\n').map((line) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          line,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
      );
    }).toList();
  }
}

/*

// Old Code 
@ -1,65 +1,137 @@
import 'package:ilearn/Views/ErrorPages/notInternet_page.dart';
import 'package:ilearn/Views/ErrorPages/somthingError_page.dart';
import 'package:ilearn/Views/Settings/Bloc/setting_events.dart';
import 'package:ilearn/Views/Settings/Bloc/setting_states.dart';
import 'package:ilearn/Views/Settings/Bloc/termsAndCondetions_bloc.dart';
import 'package:ilearn/Widgets/customAppBar_widget.dart';
import 'package:ilearn/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    reloadPage(context);
    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.privacyPolicy),
      body: BlocBuilder<SettingsBloc, SettingStates>(
        buildWhen: (previous, current) =>
            current is SettingLoading || current is GetPrivacyPolicyState,
        builder: (context, state) {
          if (state is SettingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetPrivacyPolicyState) {
            if (state.status == true) {
              return ListView(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                children: [
                  TextWidget(text: state.data!.policy ?? '', fontSizeText: 16)
                ],
              );
            } else {
              if (state.statusCode == 408) {
                return NotInternetPage(
                  mainAxisAlignment: MainAxisAlignment.center,
                  tryAgain: () => reloadPage(context),
                );
              } else {
                return ErrorPage(
                    tryAgain: () => reloadPage(context),
                    error: state.message ?? '',
                    statusCode: state.statusCode ?? 0);
              }
            }
          }
          return ErrorPage(
              tryAgain: () {
                reloadPage(context);
              },
              error: state.message ?? '',
              statusCode: state.statusCode ?? 0);
        },
      ),
    );
  }

  reloadPage(BuildContext context) {
    BlocProvider.of<SettingsBloc>(context)
        .add(GetPrivacyPolicyEvent());
 


}
*/
