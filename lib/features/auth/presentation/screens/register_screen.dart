import 'dart:developer';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart' as BorderType;

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/widgets/buttonAnimation_widget.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/AuthenticationThrough_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/buttonIcon_widget.dart';

import '../../../../exports.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

late TextEditingController _userName;
late TextEditingController _email;
late TextEditingController _password;
bool _passwordForm = true;
String? _errorEmail;
String? _errorPassword;
String? _errorUserName;

late String _status;
File? userImage;
bool _isCreatedWithSocialMedia = true;
bool _isAcceptTermsAndConditions = false;

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
    _passwordForm = true;
    _isCreatedWithSocialMedia = true;
    _userName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _status = 'unClicked';
  }

  @override
  void dispose() {
    _userName.dispose();
    _passwordForm = true;
    _email.dispose();
    _isCreatedWithSocialMedia = true;
    _status = 'unClicked';
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(AppAssets.bubbleRegisterLeft),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.bubbleRegisterRight)),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height /
                    (MediaQuery.of(context).size.height / 100)),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: AppStrings.createAccount,
                    fontSizeText: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {

                    },
                    child: DottedBorder(options:CircularDottedBorderOptions(
                      color:  AppColors.primaryColor,
                      strokeWidth: 1.5,
                      dashPattern: const [6],
                    )
                      , child: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        shape: BoxShape.circle, // يجعل الشكل دائري
                      ),
                      child: Center(
                        child: userImage != null
                            ? Image.file(
                          userImage!,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        )
                            : Icon(
                          Icons.camera_alt_outlined,
                          color:    AppColors.primaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                    ),
                  ),
                  FormAuthentication(
                    errorFiled: _errorUserName,
                    textInputType: TextInputType.text,
                    textEditingController: _userName,
                    title: AppStrings.userName,
                    hint: AppStrings.userName,
                  ),
                  FormAuthentication(
                    errorFiled: _errorEmail,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _email,
                    title: AppStrings.email,
                    hint: 'fa23@gmail.com',
                  ),
                  FormAuthentication(
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_password.text.isNotEmpty) {
                          setState(() {
                            _passwordForm = !_passwordForm;
                          });
                        }
                      },
                      icon: Icon(_passwordForm
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded),
                      color: Theme.of(context).indicatorColor,
                    ),
                    errorFiled: _errorPassword,
                    passwordForm: _passwordForm,
                    textInputType: TextInputType.text,
                    textEditingController: _password,
                    title: AppStrings.password,
                    hint: '.........',
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TermsAgreementWidget(onChanged: (val) {
                    setState(() {
                      _isAcceptTermsAndConditions = val;
                    });
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  ButtonAnimation(
                      status: _status,
                      onClickButton: () => signUp(),
                      titleButton: AppStrings.createAccount),
                  SizedBox(
                    height: 18.h,
                  ),
                  Center(
                    child: TextWidget(
                        text: AppStrings.logInThrough, fontSizeText: 16),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const AuthenticationThroughWidget(),
                  SizedBox(
                    height: 12.h,
                  ),
                  AuthenticaedIconButtonScreen(
                    onClick: () => Navigator.pushReplacementNamed(
                        context, '/Login_Screen'),
                    title: AppStrings.alreadyHaveAccount,
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  bool checkForms() {
    if (_email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _userName.text.isNotEmpty &&
        _password.text.length >= 6 &&
        (_email.text.endsWith('.com') &&
            _email.text.contains('@') &&
            !_email.text.contains(' ')) &&
        _isAcceptTermsAndConditions) {
      return true;
    } else {
      return false;
    }
  }

  void getErrorFiled() {
    setState(() {
      _errorEmail = _email.text.isNotEmpty
          ? _email.text.endsWith('.com') &&
                  _email.text.contains('@') &&
                  !_email.text.contains(' ')
              ? null
              : 'يجب كتابة الايميل بشكل صحيح'
          : AppStrings.emailFiledEmpty;

      _errorPassword = _password.text.isNotEmpty && _password.text.length >= 6
          ? null
          : _password.text.isEmpty
              ? AppStrings.passwordFiledEmpty
              : 'يجب ان تكون كلمة المرور أكبر من 6 احرف';
      _errorUserName =
          _userName.text.isNotEmpty ? null : AppStrings.usernameFieldRequired;
    });
  }

  void signUp() {
    if (_isAcceptTermsAndConditions == false) {
      // showSnackBar(
      //     context: context,
      //     message: 'يجب الموافقة على سياسة الاستخدام',
      //     visibleMessage: false);
      return;
    } else {
      if (_status == 'unClicked') {
        getErrorFiled();
        if (checkForms()) {
          setState(() {
            _status = 'clicked'; // clicked button
            _isCreatedWithSocialMedia = false;
          });
          // BlocProvider.of<AuthBloc>(context).add(SignupEvent(
          //     _userName.text, _email.text, _password.text, userImage));
          // log(_email.text);
        }
      }
    }
  }
}

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
          data: Theme.of(context).copyWith(
            unselectedWidgetColor:
                Theme.of(context).primaryColor, // Border color
          ),
          child: Checkbox(
            value: _isAgreed,
            onChanged: (value) {
              setState(() {
                _isAgreed = value ?? false;
                widget.onChanged(_isAgreed);
              });
            },
            activeColor: Theme.of(context).primaryColor, // Checked color
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Navigate to Privacy Policy screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const PrivacyPolicyPage(),
              //   ),
              // );
            },
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: AppStrings.iAgreeTo,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  TextSpan(
                    text: AppStrings.privacyPolicy,
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
