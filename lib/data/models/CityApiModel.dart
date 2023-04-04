/// status : "Success"
/// message : "City List"
/// data : [{"id":67800,"name":"Rabat","state_id":101,"state_code":"45","country_id":135,"country_code":"MT","latitude":"35.88152000","longitude":"14.39872000","created_at":"2019-10-05T19:08:24.000000Z","updated_at":"2019-10-05T19:08:24.000000Z","flag":1,"wikiDataId":"Q44381"},{"id":67816,"name":"Victoria","state_id":101,"state_code":"45","country_id":135,"country_code":"MT","latitude":"36.04444000","longitude":"14.23972000","created_at":"2019-10-05T19:08:24.000000Z","updated_at":"2019-10-05T19:08:24.000000Z","flag":1,"wikiDataId":"Q752348"}]

class CityApiModel {
  CityApiModel({
      String? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CityApiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<Data>? _data;
CityApiModel copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => CityApiModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 67800
/// name : "Rabat"
/// state_id : 101
/// state_code : "45"
/// country_id : 135
/// country_code : "MT"
/// latitude : "35.88152000"
/// longitude : "14.39872000"
/// created_at : "2019-10-05T19:08:24.000000Z"
/// updated_at : "2019-10-05T19:08:24.000000Z"
/// flag : 1
/// wikiDataId : "Q44381"

class Data {
  Data({
      int? id, 
      String? name, 
      int? stateId, 
      String? stateCode, 
      int? countryId, 
      String? countryCode, 
      String? latitude, 
      String? longitude, 
      String? createdAt, 
      String? updatedAt, 
      int? flag, 
      String? wikiDataId,}){
    _id = id;
    _name = name;
    _stateId = stateId;
    _stateCode = stateCode;
    _countryId = countryId;
    _countryCode = countryCode;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _flag = flag;
    _wikiDataId = wikiDataId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _stateId = json['state_id'];
    _stateCode = json['state_code'];
    _countryId = json['country_id'];
    _countryCode = json['country_code'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _flag = json['flag'];
    _wikiDataId = json['wikiDataId'];
  }
  int? _id;
  String? _name;
  int? _stateId;
  String? _stateCode;
  int? _countryId;
  String? _countryCode;
  String? _latitude;
  String? _longitude;
  String? _createdAt;
  String? _updatedAt;
  int? _flag;
  String? _wikiDataId;
Data copyWith({  int? id,
  String? name,
  int? stateId,
  String? stateCode,
  int? countryId,
  String? countryCode,
  String? latitude,
  String? longitude,
  String? createdAt,
  String? updatedAt,
  int? flag,
  String? wikiDataId,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  stateId: stateId ?? _stateId,
  stateCode: stateCode ?? _stateCode,
  countryId: countryId ?? _countryId,
  countryCode: countryCode ?? _countryCode,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  flag: flag ?? _flag,
  wikiDataId: wikiDataId ?? _wikiDataId,
);
  int? get id => _id;
  String? get name => _name;
  int? get stateId => _stateId;
  String? get stateCode => _stateCode;
  int? get countryId => _countryId;
  String? get countryCode => _countryCode;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get flag => _flag;
  String? get wikiDataId => _wikiDataId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['state_id'] = _stateId;
    map['state_code'] = _stateCode;
    map['country_id'] = _countryId;
    map['country_code'] = _countryCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['flag'] = _flag;
    map['wikiDataId'] = _wikiDataId;
    return map;
  }

}