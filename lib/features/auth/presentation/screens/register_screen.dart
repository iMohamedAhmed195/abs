// 📦 Imports
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_ilearn/core/pdf_handle/get_file_cubit.dart';
import 'package:new_ilearn/core/widgets/buttonAnimation_widget.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/AuthenticationThrough_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/buttonIcon_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/terms_agreement_widget.dart';
import '../../../../exports.dart';

// 🧩 Register Screen
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

// 📄 Controllers & State Variables
late TextEditingController _userName;
late TextEditingController _email;
late TextEditingController _password;

bool _passwordForm = true;
String? _errorEmail;
String? _errorPassword;
String? _errorUserName;

late String _status;
late String _gender  ; // unClicked, clicked, success, failed
late String _studyType  ; // unClicked, clicked, success, failed
File? userImage;
String? _countey;
bool _isCreatedWithSocialMedia = true;
bool _isAcceptTermsAndConditions = false;

// 🔧 Main State Class
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
    _gender = 'unClicked';
    _studyType = 'unClicked';
  }

  @override
  void dispose() {
    _userName.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // 🖼️ UI
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            // 🎨 Decorations
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(AppAssets.bubbleRegisterLeft),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppAssets.bubbleRegisterRight),
            ),

            // 🧾 Main Content
            Padding(
              padding: EdgeInsetsDirectional.only(
                top:
                    MediaQuery.of(context).size.height /
                    (MediaQuery.of(context).size.height / 100),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📝 Title
                    TextWidget(
                      text: AppStrings.createAccount.trans,
                      fontSizeText: 32,
                      fontWeight: FontWeight.bold,
                    ),

                    // 📷 User Image
                    BlocProvider(
                      create: (context) => GetFileCubit(),
                      child: Builder(
                        builder:
                            (context) => InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await context.read<GetFileCubit>().pickFile();
                                final picked =
                                    context.read<GetFileCubit>().pickedFile;
                                if (picked != null) {
                                  setState(() {
                                    userImage = picked;
                                  });
                                }
                              },
                              child: DottedBorder(
                                options: CircularDottedBorderOptions(
                                  color: AppColors.primaryColor,
                                  strokeWidth: 1.5,
                                  dashPattern: const [6],
                                ),
                                child: Container(
                                  clipBehavior: Clip.antiAlias,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 24,
                                  ),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child:
                                        userImage != null
                                            ? Image.file(
                                              userImage!,
                                              fit: BoxFit.cover,
                                              height: double.infinity,
                                              width: double.infinity,
                                            )
                                            : Icon(
                                              Icons.camera_alt_outlined,
                                              color: AppColors.primaryColor,
                                              size: 35,
                                            ),
                                  ),
                                ),
                              ),
                            ),
                      ),
                    ),

                    // 🔡 Input Fields
                    FormAuthentication(
                      errorFiled: _errorUserName,
                      textInputType: TextInputType.text,
                      textEditingController: _userName,
                      title: AppStrings.userName.trans,
                      hint: AppStrings.userName.trans,
                    ),
                    FormAuthentication(
                      errorFiled: _errorEmail,
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _email,
                      title: AppStrings.email.trans,
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
                        icon: Icon(
                          _passwordForm
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                        ),
                        color: Theme.of(context).indicatorColor,
                      ),
                      errorFiled: _errorPassword,
                      passwordForm: _passwordForm,
                      textInputType: TextInputType.text,
                      textEditingController: _password,
                      title: AppStrings.password.trans,
                      hint: '.........',
                      textInputAction: TextInputAction.done,
                    ),

                    const SizedBox(height: 5),
                    selectWidget(
                      items: ['male', 'female'],
                      selectedItem: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                      SizedBox(height: 5),selectWidget(
                      items: ['مدرسه', 'جامعه'],
                      selectedItem: _studyType,
                      onChanged: (value) {
                        setState(() {
                          _studyType = value!;
                        });
                      },
                    ),
                    const SizedBox(height: 5),

                    Container(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 12),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(6),
                          border:
                          Border.all(color: Colors.black38, width: 1)),
                      child: DropdownButton<String>(

                          icon: const Icon(Icons.keyboard_arrow_down),
                          alignment: AlignmentDirectional.centerStart,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(6),
                          underline: const Divider(
                            color: Colors.transparent,
                          ),
                          hint: TextWidget(
                            colorText: Colors.black54,
                            text: _countey??'اختر دوله',
                            fontSizeText: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              onTap: () {},
                              value: 'مصر',
                              child: TextWidget(
                                colorText: Colors.black54,
                                text: AppStrings.egypt.trans,
                                fontSizeText: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            DropdownMenuItem<String>(
                              onTap: () {

                              },
                              value: 'السعوديه',
                              child: TextWidget(
                                colorText: Colors.black54,
                                text: AppStrings.ksa.trans,
                                fontSizeText: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                          onChanged: (String? val) {
                            if (val != null) {
                              setState(() {
                                _countey = val;
                              });
                            }
                          }),
                    ),

                    // ✅ Terms Checkbox
                    TermsAgreementWidget(
                      onChanged: (val) {
                        setState(() {
                          _isAcceptTermsAndConditions = val;
                        });
                      },
                    ),

                    const SizedBox(height: 8),

                    // 🎯 Submit Button
                    ButtonAnimation(
                      status: _status,
                      onClickButton: () => signUp(),
                      titleButton: AppStrings.createAccount.trans,
                    ),

                    SizedBox(height: 18.h),

                    // 🔄 Social Auth
                    Center(
                      child: TextWidget(
                        text: AppStrings.logInThrough.trans,
                        fontSizeText: 16,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    const AuthenticationThroughWidget(),

                    SizedBox(height: 12.h),

                    // 🔙 Already have account
                    AuthenticaedIconButtonScreen(
                      onClick:
                          () {
                            Routes.loginRoute.moveTo();
                          },

                      title: AppStrings.alreadyHaveAccount.trans,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectWidget({
    required List<String> items,
    required String selectedItem,
    required void Function(String?) onChanged,
  }) {
    return Row(
      children: [
        for (var item in items)
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: RadioListTile<String>(
                title: TextWidget(
                  text: item  ,
                  fontSizeText: 14,
                ),
                value: item,
                groupValue: selectedItem,
                onChanged: onChanged,
              ),
            ),
          ),
      ],
    );
  }

  // 🧪 Validation
  bool checkForms() {
    return _email.text.isNotEmpty &&
        _password.text.isNotEmpty &&
        _userName.text.isNotEmpty &&
        _password.text.length >= 6 &&
        (_email.text.endsWith('.com') &&
            _email.text.contains('@') &&
            !_email.text.contains(' ')) &&
        _isAcceptTermsAndConditions;
  }

  void getErrorFiled() {
    setState(() {
      _errorEmail =
          _email.text.isNotEmpty
              ? (_email.text.endsWith('.com') &&
                      _email.text.contains('@') &&
                      !_email.text.contains(' '))
                  ? null
                  : 'يجب كتابة الايميل بشكل صحيح'
              : AppStrings.emailFiledEmpty.trans;

      _errorPassword =
          _password.text.isNotEmpty && _password.text.length >= 6
              ? null
              : _password.text.isEmpty
              ? AppStrings.passwordFiledEmpty.trans
              : 'يجب ان تكون كلمة المرور أكبر من 6 احرف';

      _errorUserName =
          _userName.text.isNotEmpty
              ? null
              : AppStrings.usernameFieldRequired.trans;
    });
  }

  // 🔐 Sign Up Button Logic (Frontend Only)
  void signUp() {
    if (!_isAcceptTermsAndConditions) {
      Routes.homeScreen.moveTo();
      // showSnackBar(context: context, message: 'يجب الموافقة على سياسة الاستخدام');
      return;
    }

    if (_status == 'unClicked') {
      getErrorFiled();
      if (checkForms()) {
        setState(() {
          _status = 'clicked';
          _isCreatedWithSocialMedia = false;
        });

        // 🔄 Call backend signup here if needed (currently removed)
      }
    }
  }
}

// 📄 Terms Agreement Checkbox Widget
