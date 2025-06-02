import 'package:shared_preferences/shared_preferences.dart';

enum Keys { skipWelcomeScreen, languageChar, theme, muteNotification }

enum InformationUser {
  userName,
  userEmail,
  userPhone,
  userImage,
  userGender,
  userBirthDate,
  token,
  userId,
  goalQuiz,
  inviteCode,
  goalBook
}

enum ThemeKey { light, dark }

enum NotificationType {
  noticeJoiningGroup,
  noticeJoiningNewMember,
  noticeAcceptanceJoinGroup,
  newMessageNotification,
  statisticsReminderNotice,
  noticeInvitationJoinGroup
}

class ShApp {
  late SharedPreferences _sharedPreferences;

  static final ShApp _instance = ShApp._();

  ShApp._();

  factory ShApp() {
    return _instance;
  }

  Future<void> getInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

//-------------config Shared-------------------
  Future<void> saveLanguageChar({required String languageChar}) async {
    await _sharedPreferences.setString(
        Keys.languageChar.toString(), languageChar);
  }

  Future<void> saveTheme({required ThemeKey them}) async {
    await _sharedPreferences.setString(Keys.theme.toString(), them.name);
  }

  Future<void> notificationActive({required bool muteNotification}) async {
    await _sharedPreferences.setBool(
        Keys.muteNotification.toString(), muteNotification);
  }

  String get getLanguageChar =>
      _sharedPreferences.getString(Keys.languageChar.toString()) ?? 'ar';

  String get getTheme =>
      _sharedPreferences.getString(Keys.theme.toString()) ??
      ThemeKey.light.name;

  bool get muteNotification =>
      _sharedPreferences.getBool(Keys.muteNotification.toString()) ?? false;

//-----------close config----------------

//-----------startAppAndAuth--------------------
  Future<void> saveStartAppStatus({required bool isShowed}) async {
    await _sharedPreferences.setBool(
        Keys.skipWelcomeScreen.toString(), isShowed);
  }

  bool get isShowedStartApp =>
      _sharedPreferences.getBool(Keys.skipWelcomeScreen.toString()) ?? false;

//--------------- close startApp-------------------

//----------- userInformation------------------
  Future<void> saveUserInformation(
      {required String name,
      required String email,
      required String token,
      String? imageUrl,
      String? gender,
      String? phoneNumber,
      String? birthDate,
      String? inviteCode,
      required String goalBook,
      required String goalQuiz,
      required String userId}) async {
    await _sharedPreferences.setString(InformationUser.token.toString(), token);
    await _sharedPreferences.setString(
        InformationUser.userName.toString(), name);
    await _sharedPreferences.setString(
        InformationUser.userEmail.toString(), email);
    await _sharedPreferences.setString(
        InformationUser.userPhone.toString(), phoneNumber ?? '');
    await _sharedPreferences.setString(
        InformationUser.userGender.toString(), gender ?? '');
    await _sharedPreferences.setString(
        InformationUser.userImage.toString(), imageUrl ?? '');
    await _sharedPreferences.setString(
        InformationUser.userBirthDate.toString(), birthDate ?? '');
    await _sharedPreferences.setString(
        InformationUser.userId.toString(), userId ?? '');
    await _sharedPreferences.setString(
        InformationUser.goalBook.toString(), goalBook);
    await _sharedPreferences.setString(
        InformationUser.goalQuiz.toString(), goalQuiz);
    await _sharedPreferences.setString(
        InformationUser.inviteCode.toString(), inviteCode.toString());
  }

  String get userName =>
      _sharedPreferences.getString(InformationUser.userName.toString()) ?? '';

  String get userEmail =>
      _sharedPreferences.getString(InformationUser.userEmail.toString()) ?? '';

  String get userId =>
      _sharedPreferences.getString(InformationUser.userId.toString()) ?? '';

  String? get userImage =>
      _sharedPreferences.getString(InformationUser.userImage.toString());

  String? get inviteCode =>
      _sharedPreferences.getString(InformationUser.inviteCode.toString());

  String? get gender =>
      _sharedPreferences.getString(InformationUser.userGender.toString());

  String? get phoneNumber =>
      _sharedPreferences.getString(InformationUser.userPhone.toString());

  String? get userBirthDate =>
      _sharedPreferences.getString(InformationUser.userBirthDate.toString());

  String get token =>
      _sharedPreferences.getString(InformationUser.token.toString()) ?? '';

  String get goalQuiz =>
      _sharedPreferences.getString(InformationUser.goalQuiz.toString()) ?? '4';

  String get goalBook =>
      _sharedPreferences.getString(InformationUser.goalBook.toString()) ?? '4';

  Future<void> clearData() async {
    await _sharedPreferences.clear();
    await saveStartAppStatus(isShowed: true);
  }

//----------- notifications------------------

  Future<void> setNotificationsAvailable({
    required NotificationType type,
    required bool notification,
  }) async {
    await _sharedPreferences.setBool(type.toString(), notification);
  }

  bool get noticeJoiningGroup =>
      _sharedPreferences
          .getBool(NotificationType.noticeJoiningGroup.toString()) ??
      !ShApp().muteNotification;

  bool get noticeJoiningNewMember =>
      _sharedPreferences
          .getBool(NotificationType.noticeJoiningNewMember.toString()) ??
      !ShApp().muteNotification;

  bool get noticeAcceptanceJoinGroup =>
      _sharedPreferences
          .getBool(NotificationType.noticeAcceptanceJoinGroup.toString()) ??
      !ShApp().muteNotification;

  bool get newMessageNotification =>
      _sharedPreferences
          .getBool(NotificationType.newMessageNotification.toString()) ??
      !ShApp().muteNotification;

  bool get statisticsReminderNotice =>
      _sharedPreferences
          .getBool(NotificationType.statisticsReminderNotice.toString()) ??
      !ShApp().muteNotification;

  bool get noticeInvitationJoinGroup =>
      _sharedPreferences
          .getBool(NotificationType.noticeInvitationJoinGroup.toString()) ??
      !ShApp().muteNotification;
}
