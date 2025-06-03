abstract class EndPoints {
  static const String baseUrl = 'http://179.61.219.156:3000/${api}/v1/'; //base url
  // static const String baseUrl = 'https://new_ilearn.seniorcode.co'; //base url
  static const String api = '/api/';
  static const String profile = '${api}profile/';
  static const String user = '${api}user';
  static const String estate = '${api}estate';
  static const String image = baseUrl;

///////////////////////////// authentication ////////////////////////////
  static const String login = 'auth/signin';
  static const String logout = 'auth/signout';
  static const String register = 'register';
  static const String verify = 'auth/verifyResetCode';
  static const String reSend = 'resend-code';
  static const String changePhone = 'change-phone';
  static const String getBrokers = 'users';
  static const String brokers = 'select/roles';
  static const String verifyForgetPassword = 'auth/verifyResetCode';
  static const String forgetPassword = 'auth/forgotPassword';
  static const String resetPassword = 'auth/resetPassword';
  static const String userLogout = 'logout';
  static const String notification = 'user/notification';
  static const String unReadNotification = 'user/notification/unread-count';
  static const String readNotifications = 'user/notification/read';
  static const String confirmationCode = 'send_sms';
///////////////////////////// home ////////////////////////////
  static const String home = 'dashbaord';
  static const String config = 'select/configuration';

  static const String estateAd = '${api}estate/ad';
  static const String estateRequest = '${api}estate/request';
  static const String completeDeal = '${api}estate/ad/complete-deal';
  static const String completeOrderDeal = '${api}estate/request/complete-deal';
  static const String cities = '${api}select/cities/';
  static const String communicationTool = '${api}select/communication-tool';
  static const String termsAndCondition = '${api}terms-and-conditions';
  static const String aboutnew_ilearn = '${api}about-us';
  static const String new_ilearnValLicense = '${api}val-license';
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

  static var estateMarketAll = '$estateMarket/all/home';

  static var brokerCompletedDeals = '$api/user/complete/deals/';
  static var repostOrderRequest = '$estateRequest/repost';
  static var repostEstate = '$estateAd/repost';
}
