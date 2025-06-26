abstract class EndPoints {
   // static const String baseUrl = 'https://abs.seniorcode.co'; //base url
  static const String baseUrl = 'http://145.14.157.242:3000'; //base url
  static const String api = '/api/v1/';
  static const String profile = '${api}profile';
  static const String user = '${api}user';
  static const String estate = '${api}estate';
  static const String image = "${baseUrl}+${api}";

///////////////////////////// authentication ////////////////////////////
  static const String login = '${api}auth/signin';
  static const String loginWithGoogle = '${api}auth/google';
  static const String loginWithFacebook = '${api}auth/facebook';
  static const String logout = '${api}auth/signout';
  static const String register = '${api}/auth/signup';
  static const String verify = '${api}auth/verify-email';
  static const String reSend = '${api}auth/resend-verification-email';
  static const String changePhone = '${api}change-phone';
  static const String getBrokers = '${api}users';
  static const String brokers = '${api}select/roles';
  static const String verifyForgetPassword = '${api}auth/verifyResetCode';
  static const String forgetPassword = '${api}auth/forgotPassword';
  static const String resetPassword = '${api}auth/resetPassword';
  static const String userLogout = '${api}logout';
  static const String notification = '${api}user/notification';
  static const String unReadNotification = '${api}user/notification/unread-count';
  static const String readNotifications = '${api}user/notification/read';
  static const String confirmationCode = '${api}send_sms';
///////////////////////////// dashboard ////////////////////////////
  static const String homeFolders = '${api}dashboard';
  static const String folders = '${api}categories';
  static const String books = '${api}books';
  static const String statistics = '${api}statistics/dashboard';
  static const String groupsChat = '${api}groupschat';
  static const String terms = '${api}terms';
  static const String policy = '${api}policy';
  static const String appVersions = '${api}app-versions';

  static const String config = '${api}country';
  static const String home = '${api}dashboard';
  static const String reports = '${api}statistics/reports';

  static const String estateAd = '${api}estate/ad';
  static const String estateRequest = '${api}estate/request';
  static const String completeDeal = '${api}estate/ad/complete-deal';
  static const String completeOrderDeal = '${api}estate/request/complete-deal';
  static const String cities = '${api}select/cities/';
  static const String communicationTool = '${api}select/communication-tool';
  static const String termsAndCondition = '${api}terms-and-conditions';
  static const String aboutabs = '${api}about-us';
  static const String absValLicense = '${api}val-license';
  static const String areas = '${api}select/areas';
  static const String rooms = '${api}select/rooms';
  static const String estateType = '${api}select/estate-types';
  static const String extraDetails = '${api}select/extra-details';
  static const String canceledEstateAd = '${api}estate/canceled/ad';
  static const String myOrder = '${api}estate/request';
  static const String chat = '${api}chats';
  static const String getUserChat = '${api}chats/user/';

  static const String estateRequests = '${api}estate/request';
  static const String canceledEstateOrder = '${api}estate/canceled/requests';

  static const String estateMarket = '${api}estate/market';

///////////////////////////// setting ////////////////////////////
  static const String changeRole = '${api}user/change-role';
  static const String setlocation = '${api}user/set-address';
  static const String validLicense = '${api}user/val-license';
  static const String deleteAccount = '${api}user';
  static const String subscriptions = '${api}package';
  static const String subscriptionsEnroll = '${api}user/subscription-enroll';
  static const String subscriptionsPay = '${api}user/subscription-pay';
  static const String myProfile = '${api}setting';

  /// ************************   google apis *********************************
  static const String googleMapsBaseUrl = 'https://maps.googleapis.com/maps/api/';
  static const String autoCompleteApi = 'place/autocomplete/json';
  static const String addressInfo = 'place/details/json';
  static const String direction = 'directions/json';
  static const String citiesEndPoint = 'geocode/json';
  static const String geocodeApi = 'geocode/json';
  static const String googleDirectionApi = 'directions/json';

  static var adAnnouncementToFavorite = '$estateAd/favorite';
  static var addEstateRequestToFavorite = '$estateRequest/favorite';
  static var favoriteAnnouncements = '$user/favorite';

  static var myRequests = '${api}estate/user/requests';
  static const String myAds = '${api}estate/user/ad';
  static const String myDeals = '${api}user/complete/deals';
  static const String contractOrder = '${api}estate/rent-contract';
  static const String myContractOrders = '${api}estate/user/rent-contract';

  static var payForAd = '${estateAd}/pay';
  static var payForContract = '$contractOrder/pay';
  static var payForMarket = '$estateMarket/pay';

  static var district = '${api}select/districts';

  static var removeAdMedia = "$estateAd/delete/media";
  static var removeRequestMedia = "$estateRequest/delete/media";

  static var estateMarketAll = '$estateMarket/all/dashboard';

  static var brokerCompletedDeals = '$api/user/complete/deals/';
  static var repostOrderRequest = '$estateRequest/repost';
  static var repostEstate = '$estateAd/repost';
}
