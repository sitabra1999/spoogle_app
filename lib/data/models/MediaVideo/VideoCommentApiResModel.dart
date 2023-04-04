import 'dart:convert';
/// status : 1
/// message : "Your comment has been successfully submitted!"

VideoCommentApiResModel videoCommentApiResModelFromJson(String str) => VideoCommentApiResModel.fromJson(json.decode(str));
String videoCommentApiResModelToJson(VideoCommentApiResModel data) => json.encode(data.toJson());
class VideoCommentApiResModel {
  VideoCommentApiResModel({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  VideoCommentApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
VideoCommentApiResModel copyWith({  num? status,
  String? message,
}) => VideoCommentApiResModel(  status: status ?? _status,
  message: message ?? _message,
);
  num? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}