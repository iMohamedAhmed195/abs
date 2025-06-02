
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:new_ilearn/features/bottom_navigation/presentation/widget/custom_appbar_widget.dart';

import '../../../exports.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        appBar: CustomAppBar(title: AppStrings.termsOfService.trans),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Introduction
              Text(
                AppStrings.termsOfServiceIntro.trans,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),

              // Section 1
              _buildSection(
                context,
                title: AppStrings.termsSection1Title.trans,
                content: AppStrings.termsSection1Content.trans,
              ),

              // Section 2
              _buildSection(
                context,
                title: AppStrings.termsSection2Title.trans,
                content: AppStrings.termsSection2Content.trans,
              ),

              // Section 3
              _buildSection(
                context,
                title: AppStrings.termsSection3Title.trans,
                content: AppStrings.termsSection3Content.trans,
              ),

              // Section 4
              _buildSection(
                context,
                title: AppStrings.termsSection4Title.trans,
                content: AppStrings.termsSection4Content.trans,
              ),

              // Section 5
              _buildSection(
                context,
                title: AppStrings.termsSection5Title.trans,
                content: AppStrings.termsSection5Content.trans,
              ),

              // Section 6
              _buildSection(
                context,
                title: AppStrings.termsSection6Title.trans,
                content: AppStrings.termsSection6Content.trans,
              ),

              // Section 7
              _buildSection(
                context,
                title: AppStrings.termsSection7Title.trans,
                content: AppStrings.termsSection7Content.trans,
              ),

              // Section 8
              _buildSection(
                context,
                title: AppStrings.termsSection8Title.trans,
                content: AppStrings.termsSection8Content.trans,
              ),

              // Section 9
              _buildSection(
                context,
                title: AppStrings.termsSection9Title.trans,
                content: AppStrings.termsSection9Content.trans,
              ),

              // Section 10
              _buildSection(
                context,
                title: AppStrings.termsSection10Title.trans,
                content: AppStrings.termsSection10Content.trans,
              ),

              // Section 11
              const SizedBox(height: 24),
              Text(
                AppStrings.termsSection11Title.trans,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.termsSection11Content.trans,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ));
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

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    reloadPage(context);

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.termsOfService),
      body: BlocBuilder<SettingsBloc, SettingStates>(
        buildWhen: (previous, current) =>
            current is SettingLoading || current is GetTermsAndCondetionsState,
        builder: (context, state) {
          if (state is SettingLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetTermsAndCondetionsState) {
            if (state.status == true) {
              return ListView(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                children: [
                  TextWidget(text: state.data!.terms ?? '', fontSizeText: 16)
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
    BlocProvider.of<SettingsBloc>(context).add(GetTermsAndCondetionsEvent());
  }
}


*/
