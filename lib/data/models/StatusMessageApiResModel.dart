import 'dart:convert';
/// status : 1
/// message : "Device Token inserted successfully."

//StatusMessageApiResModel statusMessageApiResModelFromJson(String str) => StatusMessageApiResModel.fromJson(json.decode(str));
//String statusMessageApiResModelToJson(StatusMessageApiResModel data) => json.encode(data.toJson());

class StatusMessageApiResModel {
  StatusMessageApiResModel({
      num? status, 
      String? message,}){
    _status = status;
    _message = message;
}

  StatusMessageApiResModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
  }
  num? _status;
  String? _message;
StatusMessageApiResModel copyWith({  num? status,
  String? message,
}) => StatusMessageApiResModel(  status: status ?? _status,
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