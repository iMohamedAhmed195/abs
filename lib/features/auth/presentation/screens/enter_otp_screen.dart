import 'package:new_ilearn/core/widgets/imageUser_widget.dart';
import 'package:new_ilearn/core/widgets/write_otp_section.dart';
import 'package:new_ilearn/features/auth/data/model/request_model/verify_request_model.dart';
import 'package:new_ilearn/features/auth/presentation/managers/auth_cubit.dart';
import '../../../../exports.dart';

class EnterOtpScreen extends StatefulWidget {
  const EnterOtpScreen({super.key, required this.email});
  final String email;
  @override
  State<EnterOtpScreen> createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends State<EnterOtpScreen> {
  String otp = '';
  @override
  void initState() {
    otp='';
    super.initState();

  }
dispose() {
    otp = '';
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
                        text: AppStrings.enterCodeWithForgetPassword.trans,
                        fontSizeText: 17,
                        fontWeight: FontWeight.w300,
                        colorText: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 290.w,
                      child: TextWidget(
                        textAlign: TextAlign.center,
                        text: widget.email,
                        fontSizeText: 17,
                        fontWeight: FontWeight.w400,
                        colorText: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 9),
                    WriteOtpSection(onValueChanged: ({required String otpNumber}) {
                      this.otp = otpNumber;
                    },),
                    15.vs,
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:16.w),
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: CubitErrorWidget(errorType:Errors.OTP_ERROR)
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: ButtonWidget(
                        title: AppStrings.next.trans,
                        onClick: (){
                          checkStringError(context, otp, Errors.OTP_ERROR);
                          if(dontHaveErrors(context)){
                            context.read<AuthCubit>().verify(
                                verifyRequestModel: VerifyRequestModel(
                                    email: widget.email,
                                    verifyCode: otp,)
                                , email: widget.email
                            );
                          }
                        },
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
}
