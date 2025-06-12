

import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/core/widgets/dialog.dart';
import 'package:new_ilearn/core/widgets/errorBox_widget.dart';
import 'package:new_ilearn/core/widgets/form_widget.dart';
import 'package:new_ilearn/features/profile/data/models/profile_model.dart';
import 'package:new_ilearn/features/profile/presentation/managers/update_profile_cubit.dart';

import '../../../../exports.dart';
import '../../../auth/data/model/response_model/auth_response_model.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late TextEditingController _userName;
  late TextEditingController _userPhone;
   String? _genderType;
  late TextEditingController _userEmail;
  late TextEditingController _dateOfBirth;
   final  UserModel? userData=AppPrefs.user!.user;

  String? _errorName;
  String? _errorEmail;
  String? _errorUpdate;
  String? _errorPhoneNumber;
  bool _loading = false;
 _loadUserData()  {

    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    _userName = TextEditingController(text: userData!.username?? '');
    _userPhone = TextEditingController(text: userData!.phoneNumber?? '');
    _userEmail = TextEditingController(text: userData!.email?? '');
    _dateOfBirth = TextEditingController(text:  formatDate(userData!.birthDate?? ''));
    _genderType = userData!.gender;
    _loadUserData();

  }

  @override
  void dispose() {
    _userEmail.dispose();
    _userName.dispose();
    _userPhone.dispose();
    _dateOfBirth.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),
            _buildForm(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(9), topLeft: Radius.circular(9)),
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 4,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          const SizedBox(height: 10),
          TextWidget(text: AppStrings.updateProfile, fontSizeText: 16),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErrorBoxWidget(errorTitle: _errorUpdate),
          SizedBox(height: 10.h),
          FormAuthentication(
            errorFiled: _errorName,
            textInputType: TextInputType.text,
            textEditingController: _userName,
            hint: AppStrings.userName,
            title: AppStrings.userName,
          ),
          FormAuthentication(
            limitChar: 10,
            prefixIcon: CountryCodePicker(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              textStyle: const TextStyle(color: Colors.black26),
              initialSelection: 'PS',
              onChanged: (value) => log(value.toString()),
            ),
            textInputType: TextInputType.number,
            errorFiled: _errorPhoneNumber,
            textEditingController: _userPhone,
            hint: AppStrings.phone,
            title: AppStrings.phone,
          ),
          _buildGenderDropdown(),
          const SizedBox(height: 16),
          _buildDatePicker(),
          FormAuthentication(
            errorFiled: _errorEmail,
            textInputType: TextInputType.emailAddress,
            textEditingController: _userEmail,
            hint: AppStrings.email,
            title: AppStrings.email,
          ),
          const SizedBox(height: 16),
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: AppStrings.gender, fontSizeText: 16),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black38),
          ),
          child: DropdownButton<String>(
            value: _genderType,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(value: 'male', child: Text(AppStrings.male)),
              DropdownMenuItem(value: 'female', child: Text(AppStrings.female)),
            ],
            onChanged: (value) {
              if (value != null) setState(() => _genderType = value);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return InkWell(
      onTap: () async {
        DateTime? dateTime = await showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          lastDate: DateTime(2030),
          initialDate: DateTime.now(),
          cancelText: AppStrings.cancel,
          locale: const Locale('ar'),
        );
        if (dateTime != null) {
          setState(() => _dateOfBirth.text = formatDate(dateTime.toString()));
        }
      },
      child: FormAuthentication(
        suffixIcon: SvgPicture.asset(AppAssets.dateOfBirth, height: 25, width: 25),
        enabled: false,
        textInputType: TextInputType.none,
        textEditingController: _dateOfBirth,
        hint: AppStrings.dateOfBirth,
        title: AppStrings.dateOfBirth,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            title: AppStrings.save,
            multiWidget: _loading
                ? Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Colors.white,
                size: 25,
              ),
            )
                : null,
            onClick: updateProfile,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ButtonWidget(
            title: AppStrings.cancel,
            colorButton: Colors.transparent,
            colorBorder: Theme.of(context).highlightColor,
            colorTitleButton: Theme.of(context).textTheme.titleLarge!.color!,
            onClick: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  void errorForm() {
    setState(() {
      _errorName = _userName.text.isNotEmpty ? null : AppStrings.thisFieldRequired;
      _errorEmail = _userEmail.text.isNotEmpty ? null : AppStrings.thisFieldRequired;
      _errorPhoneNumber = _userPhone.text.isNotEmpty
          ? (_userPhone.text.length == 9 ? null : AppStrings.errorPhoneUpdate)
          : AppStrings.thisFieldRequired;
    });
  }

  bool checkForm() {
    return _userName.text.isNotEmpty &&
        _userEmail.text.isNotEmpty &&
        !_loading &&
        _errorPhoneNumber == null;
  }

  void updateProfile() {

   context.read<UpdateProfileCubit>().updateProfile(profileModel: ProfileModel(
     name: _userName.text,
     email: _userEmail.text,
     gender: _genderType,
     birthDate: _dateOfBirth.text,
     phone: _userPhone.text,
   ));
    errorForm();
    if (checkForm()) {
      setState(() {
        _loading = true;
        _errorUpdate = null;
      });

      // ✅ مكان تنفيذ العملية - مثلاً عرض رسالة نجاح فقط
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _loading = false);
        Navigator.pop(context);
      });
    }
  }
}
