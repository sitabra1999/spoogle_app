class ApiConstants {
  ApiConstants._();

  // "https://codebell-7d378.web.app?ph=9564636037"
  // "https://codebell-7d378.web.app?ph=7757058838"
  // https://codebell-7d378.web.app?ph=9373564041
  // https://codebell.io:8086/

  //Socket URL https://shoploka.in:8086
  //static const String socketUrl = 'socket.notebrains.com';
  //static const String socketUrl = 'shoploka.in';
  static const String socketUrl = 'codebell.io';
  static const String socketIpUrl = 'http://52.12.80.229:8086/';
  static const String socketDemoUrl = 'demo.cloudwebrtc.com';

  //REST API DATA
  static const String bearerToken = 'Jll7q0BSijLOrzaOSm5Dr5hW9cJRZAJKOzvDlxjKCXepwAeZ7JR6YP5zQqnw';
  static const String baseUrl = "https://spoogle.in/dev/api/";



  // Spoogle apis

  static const String login = "login";
  static const String resgister = "register";
  static const String forgotPassword = "forgot-password";


  //Code bell apis
  static const String updateDeviceToken = "createdevicetoken";
  static const String getDeviceToken = "getdevicetoken";
  static const String profile = "profile";
  static const String deleteProfile = "deleteprofile";
  static const String getAllUsers = "getallusers";
  static const String addCallForwdUser = "addcallfrwduser";
  static const String removeCallFrwdUser = "removecallfrwduser";
  static const String blockUser = "blockuser";
  static const String getBlockUsers = "getblockusers";
  static const String unblockUser = "unblockuser";
  static const String advertisements = "advertisements";
  static const String getVisitors = "getvisitors";
  static const String distributors = "distributors";
  static const String addcall = "addcall";


  //Spoogle api end points

  static const String eventCalender = "events/event-calenders";
  static const String whatTheySaid = "what-they-said";
  static const String standings = "standings";
  static const String sports = "sports";

  //News APIs
  static const String news = "news";
  static const String breakingNews = "breaking-news";
  static const String newsLikes = "news/news-like";
  static const String newsDetails = "news/details";

  //Stories APIs
  static const String stories = "stories";
  static const String storiesDetails = "stories/details";
  static const String storiesLike = "stories/stories-like";
  static const String storiesDownVote = "stories/stories-downvote";
  static const String storiesUpVote = "stories/stories-upvote";
  static const String storiesComment = "stories/store-comment";

  //Media APIs
  static const String mediaVideo = "media-video";
  static const String mediaVideoDetails = "media-video/details";
  static const String mediaVideoLike = "media-video/media-video-like";
  static const String mediaVideoComments = "media-video/store-comment";


  static const String notifications = "Notifications";

}
