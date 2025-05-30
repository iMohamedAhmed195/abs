import '../../../../exports.dart';

class TermsAgreementWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const TermsAgreementWidget({super.key, required this.onChanged});

  @override
  State<TermsAgreementWidget> createState() => _TermsAgreementWidgetState();
}

class _TermsAgreementWidgetState extends State<TermsAgreementWidget> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Theme(
          data: Theme.of(
            context,
          ).copyWith(unselectedWidgetColor: Theme.of(context).primaryColor),
          child: Checkbox(
            value: _isAgreed,
            onChanged: (value) {
              setState(() {
                _isAgreed = value ?? false;
                widget.onChanged(_isAgreed);
              });
            },
            activeColor: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to privacy policy if needed
            },
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: AppStrings.iAgreeTo.trans,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                    text: AppStrings.privacyPolicy.trans,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
