import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/core/widgets/textFiled_widget.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/enter_phone_number_request_model.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import '../../../../exports.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

bool isEnterCode = false;

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _errorEmail;
  @override
  void initState() {
    super.initState();
    _errorEmail = null;
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
                    ImageUser(image: AppAssets.person),
                    19.vs,
                    TextWidget(
                      text: AppStrings.passwordRecovery.trans,
                      fontSizeText: 21,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 9),
                    SizedBox(
                      width: 290.w,
                      child: TextWidget(
                        textAlign: TextAlign.center,
                        text: AppStrings.enterYourEmail.trans,
                        fontSizeText: 17,
                        fontWeight: FontWeight.w300,
                        colorText: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      child: TextFiledWidget(
                        type: TextInputType.emailAddress,
                        textEditingController: emailController,
                        hintText: AppStrings.email.trans,
                        error: _errorEmail,
                        suffixIcon: const Icon(Icons.email_outlined),
                        onChange: (val) {},
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ButtonWidget(
                        title: AppStrings.next.trans,
                        onClick: login,
                      ),
                    ),
                    15.vs,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ButtonWidget(
                        title: AppStrings.cancel.trans,
                        colorTitleButton: AppColors.black,
                        colorButton: AppColors.transparent,
                        onClick: () {
                          Routes.loginRoute.moveTo();
                        },
                      ),
                    ),
                    15.vs,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void getErrorFiled(bool forgetPassword) {
    setState(() {
      _errorEmail =
      emailController.text.isNotEmpty
          ? emailController.text.endsWith('.com') && emailController.text.contains('@') && !emailController.text.contains(' ')
          ? null
          : 'يجب كتابة الايميل بشكل صحيح'
          : AppStrings.emailFiledEmpty.trans;
    });
  }
  bool checkForms() {
    if (emailController.text.isNotEmpty &&
        (emailController.text.endsWith('.com') && emailController.text.contains('@') && !emailController.text.contains(' '))) {
      return true;
    } else {
      return false;
    }
  }
  void login() {
    getErrorFiled(false);
    if (checkForms()) {
     context.read<AuthCubit>().forgetPassword(enterEmailRequestModel: EnterEmailRequestModel(email: emailController.text));
    }
  }
  // bool checkEnterCode() {
  //   return (_numberOneCode.text.isNotEmpty &&
  //           _numberTowCode.text.isNotEmpty &&
  //           _numberThreeCode.text.isNotEmpty &&
  //           _numberForeCode.text.isNotEmpty)
  //       ? true
  //       : false;
  // }
  //
  // String code() {
  //   return _numberOneCode.text +
  //       _numberTowCode.text +
  //       _numberThreeCode.text +
  //       _numberForeCode.text;
  // }
  //
  // successCode() {
  //   if (checkEnterCode()) {
  //     BlocProvider.of<AuthBloc>(context)
  //         .add(VerifyResetCodeEvent(widget.email, code()));
  //     // setState(() {
  //     //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  //     // });
  //   }
  // }
}
