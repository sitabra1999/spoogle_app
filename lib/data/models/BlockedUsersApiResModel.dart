import 'dart:convert';
/// status : 0
/// message : "Blocked Users List"
/// response : [{"id":2,"user_id":2,"block_user_id":4,"status":"1","created_at":"2022-08-04T08:01:33.000000Z","updated_at":"2022-08-04T08:01:33.000000Z","deleted_at":null},{"id":3,"user_id":4,"block_user_id":1,"status":"1","created_at":"2022-08-04T08:01:33.000000Z","updated_at":"2022-08-04T08:01:33.000000Z","deleted_at":null}]

BlockedUsersApiResModel blockedUsersApiResModelFromJson(String str) => BlockedUsersApiResModel.fromJson(json.decode(str));
String blockedUsersApiResModelToJson(BlockedUsersApiResModel data) => json.encode(data.toJson());
class BlockedUsersApiResModel {
  BlockedUsersApiResModel({
      num? status, 
      String? message, 
      List<Response>? response,}){
    _status = status;
    _message = message;
    _response = response;
}

  BlockedUsersApiResModel.fromJson(dynamic json) {
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
BlockedUsersApiResModel copyWith({  num? status,
  String? message,
  List<Response>? response,
}) => BlockedUsersApiResModel(  status: status ?? _status,
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

/// id : 2
/// user_id : 2
/// block_user_id : 4
/// status : "1"
/// created_at : "2022-08-04T08:01:33.000000Z"
/// updated_at : "2022-08-04T08:01:33.000000Z"
/// deleted_at : null

//Response responseFromJson(String str) => Response.fromJson(json.decode(str));
//String responseToJson(Response data) => json.encode(data.toJson());
class Response {
  Response({
      num? id, 
      num? userId, 
      num? blockUserId, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt,}){
    _id = id;
    _userId = userId;
    _blockUserId = blockUserId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _blockUserId = json['block_user_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _userId;
  num? _blockUserId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
Response copyWith({  num? id,
  num? userId,
  num? blockUserId,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
}) => Response(  id: id ?? _id,
  userId: userId ?? _userId,
  blockUserId: blockUserId ?? _blockUserId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get blockUserId => _blockUserId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['block_user_id'] = _blockUserId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}