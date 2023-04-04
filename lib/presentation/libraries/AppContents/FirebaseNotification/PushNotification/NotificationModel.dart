import 'dart:convert';
/// channelKey : "incoming_call"
/// payload : {"peerName":"Imdadul haque","peerDeviceToken":"cbx-qMXrRTK2OpAwL5PGYn:APA91bGzG9YuiZTRzv0QD_HTLPI7WDW9kDXrXp2-CF96AbZawnoBgSwFM5Vh7YH6-6nbv9-EzWcLUQgVOuzilAv9jgwm2ZpPEq1hx40uDOzlonH6B3Wly7TVcxkVEbSG3oUHJEXEyLdl","peerImage":"https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg","peerUserId":"8","peerMobile":"xyz321"}
/// largeIcon : "https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg"
/// showWhen : true
/// notificationLayout : "BigPicture"
/// autoDismissible : true
/// privacy : "Private"
/// id : 351549
/// title : "Incoming Call"
/// body : "from Imdadul haque"
/// bigPicture : "https://torranceca.files.wordpress.com/2019/10/netflix.jpg"

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));
String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());
class NotificationModel {
  NotificationModel({
      String? channelKey, 
      Payload? payload, 
      String? largeIcon, 
      bool? showWhen, 
      String? notificationLayout, 
      bool? autoDismissible, 
      String? privacy, 
      num? id, 
      String? title, 
      String? body, 
      String? bigPicture,}){
    _channelKey = channelKey;
    _payload = payload;
    _largeIcon = largeIcon;
    _showWhen = showWhen;
    _notificationLayout = notificationLayout;
    _autoDismissible = autoDismissible;
    _privacy = privacy;
    _id = id;
    _title = title;
    _body = body;
    _bigPicture = bigPicture;
}

  NotificationModel.fromJson(dynamic json) {
    _channelKey = json['channelKey'];
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _largeIcon = json['largeIcon'];
    _showWhen = json['showWhen'];
    _notificationLayout = json['notificationLayout'];
    _autoDismissible = json['autoDismissible'];
    _privacy = json['privacy'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
    _bigPicture = json['bigPicture'];
  }
  String? _channelKey;
  Payload? _payload;
  String? _largeIcon;
  bool? _showWhen;
  String? _notificationLayout;
  bool? _autoDismissible;
  String? _privacy;
  num? _id;
  String? _title;
  String? _body;
  String? _bigPicture;
NotificationModel copyWith({  String? channelKey,
  Payload? payload,
  String? largeIcon,
  bool? showWhen,
  String? notificationLayout,
  bool? autoDismissible,
  String? privacy,
  num? id,
  String? title,
  String? body,
  String? bigPicture,
}) => NotificationModel(  channelKey: channelKey ?? _channelKey,
  payload: payload ?? _payload,
  largeIcon: largeIcon ?? _largeIcon,
  showWhen: showWhen ?? _showWhen,
  notificationLayout: notificationLayout ?? _notificationLayout,
  autoDismissible: autoDismissible ?? _autoDismissible,
  privacy: privacy ?? _privacy,
  id: id ?? _id,
  title: title ?? _title,
  body: body ?? _body,
  bigPicture: bigPicture ?? _bigPicture,
);
  String? get channelKey => _channelKey;
  Payload? get payload => _payload;
  String? get largeIcon => _largeIcon;
  bool? get showWhen => _showWhen;
  String? get notificationLayout => _notificationLayout;
  bool? get autoDismissible => _autoDismissible;
  String? get privacy => _privacy;
  num? get id => _id;
  String? get title => _title;
  String? get body => _body;
  String? get bigPicture => _bigPicture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelKey'] = _channelKey;
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    map['largeIcon'] = _largeIcon;
    map['showWhen'] = _showWhen;
    map['notificationLayout'] = _notificationLayout;
    map['autoDismissible'] = _autoDismissible;
    map['privacy'] = _privacy;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    map['bigPicture'] = _bigPicture;
    return map;
  }

}

/// peerName : "Imdadul haque"
/// peerDeviceToken : "cbx-qMXrRTK2OpAwL5PGYn:APA91bGzG9YuiZTRzv0QD_HTLPI7WDW9kDXrXp2-CF96AbZawnoBgSwFM5Vh7YH6-6nbv9-EzWcLUQgVOuzilAv9jgwm2ZpPEq1hx40uDOzlonH6B3Wly7TVcxkVEbSG3oUHJEXEyLdl"
/// peerImage : "https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg"
/// peerUserId : "8"
/// peerMobile : "xyz321"

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
String payloadToJson(Payload data) => json.encode(data.toJson());
class Payload {
  Payload({
      String? peerName, 
      String? peerDeviceToken, 
      String? peerImage, 
      String? peerUserId, 
      String? peerMobile,}){
    _peerName = peerName;
    _peerDeviceToken = peerDeviceToken;
    _peerImage = peerImage;
    _peerUserId = peerUserId;
    _peerMobile = peerMobile;
}

  Payload.fromJson(dynamic json) {
    _peerName = json['peerName'];
    _peerDeviceToken = json['peerDeviceToken'];
    _peerImage = json['peerImage'];
    _peerUserId = json['peerUserId'];
    _peerMobile = json['peerMobile'];
  }
  String? _peerName;
  String? _peerDeviceToken;
  String? _peerImage;
  String? _peerUserId;
  String? _peerMobile;
Payload copyWith({  String? peerName,
  String? peerDeviceToken,
  String? peerImage,
  String? peerUserId,
  String? peerMobile,
}) => Payload(  peerName: peerName ?? _peerName,
  peerDeviceToken: peerDeviceToken ?? _peerDeviceToken,
  peerImage: peerImage ?? _peerImage,
  peerUserId: peerUserId ?? _peerUserId,
  peerMobile: peerMobile ?? _peerMobile,
);
  String? get peerName => _peerName;
  String? get peerDeviceToken => _peerDeviceToken;
  String? get peerImage => _peerImage;
  String? get peerUserId => _peerUserId;
  String? get peerMobile => _peerMobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['peerName'] = _peerName;
    map['peerDeviceToken'] = _peerDeviceToken;
    map['peerImage'] = _peerImage;
    map['peerUserId'] = _peerUserId;
    map['peerMobile'] = _peerMobile;
    return map;
  }

}