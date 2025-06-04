import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/reset_password_request_model.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import '../../../../exports.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.email,});
  final String email;
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

late TextEditingController _newPassword;
late TextEditingController _confirmPassword;
String? _errorConfirmPassword;
String? _errorPassword;
bool showNewPasswordForm = false;
bool showConfirmPasswordForm = false;

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool passwordForm = true;
  bool confirmPasswordForm = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    _errorConfirmPassword = null;
    _errorPassword = null;
  }

  @override
  void dispose() {
    showNewPasswordForm = false;
    showConfirmPasswordForm = false;
    passwordForm = true;
    confirmPasswordForm = true;
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(AppAssets.bubbleForgetPasswordLight),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(AppAssets.bubbleForgetPassword),
                        ),
                      ],
                    ),
                    ImageUser(
                      image: AppAssets.person,
                    ),
                    TextWidget(
                      text: AppStrings.newPassword.trans,
                      fontSizeText: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    TextWidget(
                      textAlign: TextAlign.center,
                      text: AppStrings.newPasswordDescription.trans,
                      fontSizeText: 19,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: FormAuthentication(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_newPassword.text.isNotEmpty) {
                              setState(() {
                                passwordForm = !passwordForm;
                              });
                            }
                          },
                          icon: Icon(passwordForm ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                          color: Theme.of(context).indicatorColor,
                        ),
                        errorFiled: _errorPassword,
                        marginBottom: 8,
                        passwordForm: passwordForm,
                        textInputType: TextInputType.text,
                        textEditingController: _newPassword,
                        title: AppStrings.password.trans,
                        hint: AppStrings.password.trans,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: FormAuthentication(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_confirmPassword.text.isNotEmpty) {
                              setState(() {
                                confirmPasswordForm = !confirmPasswordForm;
                              });
                            }
                          },
                          icon: Icon(confirmPasswordForm ? Icons.visibility_off_rounded : Icons.visibility_rounded),
                          color: Theme.of(context).indicatorColor,
                        ),
                        errorFiled: _errorPassword,
                        marginBottom: 8,
                        passwordForm: confirmPasswordForm,
                        textInputType: TextInputType.text,
                        textEditingController: _confirmPassword,
                        title: AppStrings.confirmPassword.trans,
                        hint: AppStrings.confirmPassword.trans,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ButtonWidget(
                              title: AppStrings.save.trans,
                              onClick: () => saveNewPassword()),
                        ),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: TextWidget(
                              text: AppStrings.cancel.trans,
                              fontSizeText: 15,
                              fontWeight: FontWeight.w300,
                            )),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool checkForms() {
    if (_newPassword.text.isNotEmpty &&
        _confirmPassword.text.isNotEmpty &&
        _newPassword.text == _confirmPassword.text) {
      return true;
    } else {
      return false;
    }
  }

  errorForms() {
    setState(() {
      _errorPassword = _newPassword.text.isNotEmpty ? null : 'هذا الحقل مطلوب ';
      _errorConfirmPassword =
          _confirmPassword.text.isNotEmpty ? null : 'هذا الحقل مطلوب ';
      if (_confirmPassword.text != _newPassword.text){
        _errorPassword =  AppStrings.newPasswordNotMatchError.trans;
      _errorConfirmPassword =  AppStrings.confirmPasswordNotMatchError.trans;
      }

    });
  }

  saveNewPassword() {
    errorForms();
    if (checkForms()) {
     context.read<AuthCubit>().resetPassword(
       resetPasswordRequestModel: ResetPasswordRequestModel(
         email:widget.email,
         password:_newPassword.text,
       ),
     );
    }
  }
}
