import 'dart:convert';
/// status : 1
/// message : "Visitor list of today"
/// response : [{"id":1,"user_id":5,"user_name":"Imdadul haque","call_to":8,"call_to_user":"Imdadul haque","call_type":"missedcall","call_type_msg":"Missed Video Call","call_to_phone":"9564636037","call_to_image":"https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg","duration":"2:30 mins","visitor_type":"Delivery","visitor_name":"Sudhanshu Sing","visitor_image":"https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg","message_type":"text","text_message":"I was there to deliver you package. Please call me on 9564635343 this no. I will get back to you","audio_message":"","video_message":"","date":"26/08/2022","time":"01:22 pm","delivery":"","call_action":"Outgoing"},{"id":2,"user_id":5,"user_name":"Sudhangshu","call_to":8,"call_to_user":"Imdadul haque","call_type":"missedcall","call_type_msg":"Missed Video Call","call_to_phone":"9564636037","call_to_image":"https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg","duration":"2:30 mins","visitor_type":"Delivery","visitor_name":"Sudhanshu Sing","visitor_image":"https://notebrains.com/dev/codebell/uploads/user/stockerassdsd-1661342640.png","message_type":"text","text_message":"I was there to deliver you package. Please call me on 9564635343 this no. I will get back to you","audio_message":"","video_message":"","date":"26/08/2022","time":"01:39 pm","delivery":"","call_action":"Incoming"}]

VisitorsApiResModel visitorsApiResModelFromJson(String str) => VisitorsApiResModel.fromJson(json.decode(str));
String visitorsApiResModelToJson(VisitorsApiResModel data) => json.encode(data.toJson());
class VisitorsApiResModel {
  VisitorsApiResModel({
      num? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  VisitorsApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  num? _status;
  String? _message;
  List<Response>? _response;
VisitorsApiResModel copyWith({  num? status,
  String? message,
  List<Response>? response,
}) => VisitorsApiResModel(  status: status ?? _status,
  message: message ?? _message,
  response: response ?? _response,
);
  num? get status => _status;
  String? get message => _message;
  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// user_id : 5
/// user_name : "Imdadul haque"
/// call_to : 8
/// call_to_user : "Imdadul haque"
/// call_type : "missedcall"
/// call_type_msg : "Missed Video Call"
/// call_to_phone : "9564636037"
/// call_to_image : "https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg"
/// duration : "2:30 mins"
/// visitor_type : "Delivery"
/// visitor_name : "Sudhanshu Sing"
/// visitor_image : "https://notebrains.com/dev/codebell/uploads/user/WhatsApp Image-1660719956.jpeg"
/// message_type : "text"
/// text_message : "I was there to deliver you package. Please call me on 9564635343 this no. I will get back to you"
/// audio_message : ""
/// video_message : ""
/// date : "26/08/2022"
/// time : "01:22 pm"
/// delivery : ""
/// call_action : "Outgoing"

Response responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? id, 
      num? userId, 
      String? userName, 
      num? callTo, 
      String? callToUser, 
      String? callType, 
      String? callTypeMsg, 
      String? callToPhone, 
      String? callToImage, 
      String? duration, 
      String? visitorType, 
      String? visitorName, 
      String? visitorImage, 
      String? messageType, 
      String? textMessage, 
      String? audioMessage, 
      String? videoMessage, 
      String? date, 
      String? time, 
      String? delivery, 
      String? callAction,}){
    _id = id;
    _userId = userId;
    _userName = userName;
    _callTo = callTo;
    _callToUser = callToUser;
    _callType = callType;
    _callTypeMsg = callTypeMsg;
    _callToPhone = callToPhone;
    _callToImage = callToImage;
    _duration = duration;
    _visitorType = visitorType;
    _visitorName = visitorName;
    _visitorImage = visitorImage;
    _messageType = messageType;
    _textMessage = textMessage;
    _audioMessage = audioMessage;
    _videoMessage = videoMessage;
    _date = date;
    _time = time;
    _delivery = delivery;
    _callAction = callAction;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _callTo = json['call_to'];
    _callToUser = json['call_to_user'];
    _callType = json['call_type'];
    _callTypeMsg = json['call_type_msg'];
    _callToPhone = json['call_to_phone'];
    _callToImage = json['call_to_image'];
    _duration = json['duration'];
    _visitorType = json['visitor_type'];
    _visitorName = json['visitor_name'];
    _visitorImage = json['visitor_image'];
    _messageType = json['message_type'];
    _textMessage = json['text_message'];
    _audioMessage = json['audio_message'];
    _videoMessage = json['video_message'];
    _date = json['date'];
    _time = json['time'];
    _delivery = json['delivery'];
    _callAction = json['call_action'];
  }
  num? _id;
  num? _userId;
  String? _userName;
  num? _callTo;
  String? _callToUser;
  String? _callType;
  String? _callTypeMsg;
  String? _callToPhone;
  String? _callToImage;
  String? _duration;
  String? _visitorType;
  String? _visitorName;
  String? _visitorImage;
  String? _messageType;
  String? _textMessage;
  String? _audioMessage;
  String? _videoMessage;
  String? _date;
  String? _time;
  String? _delivery;
  String? _callAction;
Response copyWith({  num? id,
  num? userId,
  String? userName,
  num? callTo,
  String? callToUser,
  String? callType,
  String? callTypeMsg,
  String? callToPhone,
  String? callToImage,
  String? duration,
  String? visitorType,
  String? visitorName,
  String? visitorImage,
  String? messageType,
  String? textMessage,
  String? audioMessage,
  String? videoMessage,
  String? date,
  String? time,
  String? delivery,
  String? callAction,
}) => Response(  id: id ?? _id,
  userId: userId ?? _userId,
  userName: userName ?? _userName,
  callTo: callTo ?? _callTo,
  callToUser: callToUser ?? _callToUser,
  callType: callType ?? _callType,
  callTypeMsg: callTypeMsg ?? _callTypeMsg,
  callToPhone: callToPhone ?? _callToPhone,
  callToImage: callToImage ?? _callToImage,
  duration: duration ?? _duration,
  visitorType: visitorType ?? _visitorType,
  visitorName: visitorName ?? _visitorName,
  visitorImage: visitorImage ?? _visitorImage,
  messageType: messageType ?? _messageType,
  textMessage: textMessage ?? _textMessage,
  audioMessage: audioMessage ?? _audioMessage,
  videoMessage: videoMessage ?? _videoMessage,
  date: date ?? _date,
  time: time ?? _time,
  delivery: delivery ?? _delivery,
  callAction: callAction ?? _callAction,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get userName => _userName;
  num? get callTo => _callTo;
  String? get callToUser => _callToUser;
  String? get callType => _callType;
  String? get callTypeMsg => _callTypeMsg;
  String? get callToPhone => _callToPhone;
  String? get callToImage => _callToImage;
  String? get duration => _duration;
  String? get visitorType => _visitorType;
  String? get visitorName => _visitorName;
  String? get visitorImage => _visitorImage;
  String? get messageType => _messageType;
  String? get textMessage => _textMessage;
  String? get audioMessage => _audioMessage;
  String? get videoMessage => _videoMessage;
  String? get date => _date;
  String? get time => _time;
  String? get delivery => _delivery;
  String? get callAction => _callAction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['call_to'] = _callTo;
    map['call_to_user'] = _callToUser;
    map['call_type'] = _callType;
    map['call_type_msg'] = _callTypeMsg;
    map['call_to_phone'] = _callToPhone;
    map['call_to_image'] = _callToImage;
    map['duration'] = _duration;
    map['visitor_type'] = _visitorType;
    map['visitor_name'] = _visitorName;
    map['visitor_image'] = _visitorImage;
    map['message_type'] = _messageType;
    map['text_message'] = _textMessage;
    map['audio_message'] = _audioMessage;
    map['video_message'] = _videoMessage;
    map['date'] = _date;
    map['time'] = _time;
    map['delivery'] = _delivery;
    map['call_action'] = _callAction;
    return map;
  }

}