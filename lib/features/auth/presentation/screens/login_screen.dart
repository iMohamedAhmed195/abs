import 'package:new_ilearn/core/widgets/buttonAnimation_widget.dart';
import 'package:new_ilearn/core/widgets/buttonIcon_widget.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/AuthenticationThrough_widget.dart';
import 'package:new_ilearn/features/auth/presentation/widget/login_header_back_ground_section.dart';
import 'package:new_ilearn/features/auth/presentation/widget/login_title_header_section.dart';
import 'package:new_ilearn/features/auth/presentation/widget/social_login_section.dart';
import '../../../../exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
   TextEditingController email=TextEditingController();
   TextEditingController password= TextEditingController();
  String? _errorEmail;
  String? _errorPassword;
  late String status; //unClicked  clicked  success  failed
  bool passwordForm = true;
  @override
  void initState() {
    super.initState();
    status = 'unClicked';
    _errorEmail = null;
    passwordForm = true;
    _errorPassword = null;
  }

  @override
  void dispose() {
    // email.dispose();
    // password.dispose();
    passwordForm = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      showSafeArea: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeaderBackGroundSection(),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoginTitleHeaderSection(),
                  FormAuthentication(
                    errorFiled: _errorEmail,
                    textInputType: TextInputType.emailAddress,
                    textEditingController: email,
                    title: AppStrings.email.trans,
                    hint: AppStrings.email.trans,
                  ),
                  FormAuthentication(
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (password.text.isNotEmpty) {
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
                    textEditingController: password,
                    title: AppStrings.password.trans,
                    hint: AppStrings.password.trans,
                    textInputAction: TextInputAction.done,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: TextButton(
                      onPressed: () {
                        forgetPassword();
                      },
                      child: TextWidget(
                        text: AppStrings.forgotPassword.trans,
                        fontSizeText: 16,
                        colorText: Theme.of(context).textTheme.titleMedium!.color,
                      ),
                    ),
                  ),
                  15.vs,
                  ButtonAnimation(status: status, onClickButton: () => login(), titleButton: AppStrings.login.trans),
                  SocialLoginSection(),
                  10.vs,
                  AuthenticatedIconButtonScreen(
                    showSubTitle: true,
                    subTitle: AppStrings.createAccount.trans,
                    onClick: () => Navigator.pushReplacementNamed(context, Routes.registerRoute),
                    title: AppStrings.dontHaveAccount.trans,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkForms() {
    if (email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        password.text.length >= 6 &&
        (email.text.endsWith('.com') && email.text.contains('@') && !email.text.contains(' '))) {
      return true;
    } else {
      return false;
    }
  }

  void getErrorFiled(bool forgetPassword) {
    setState(() {
      _errorEmail =
          email.text.isNotEmpty
              ? email.text.endsWith('.com') && email.text.contains('@') && !email.text.contains(' ')
                  ? null
                  : 'يجب كتابة الايميل بشكل صحيح'
              : AppStrings.emailFiledEmpty.trans;
      if (!forgetPassword) {
        _errorPassword =
            password.text.isNotEmpty && password.text.length >= 6
                ? null
                : password.text.isEmpty
                ? AppStrings.passwordFiledEmpty.trans
                : 'يجب ان تكون كلمة المرور أكبر من 6 احرف';
      }
    });
  }

  void login() {
    getErrorFiled(false);
    if (checkForms()) {
      setState(() {
        status = 'clicked'; // clicked button
      });
      // BlocProvider.of<AuthBloc>(context)
      //     .add(SignInEvent(email.text, password.text));
    }
  }

  void forgetPassword() {
    Routes.forgetPasswordRoute.moveTo();
  }
}
