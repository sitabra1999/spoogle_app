/// countryId : ""
/// countryName : ""
/// countryCode : ""
/// countryFlag : ""

class CountryModel {
  CountryModel({
      String? countryId, 
      String? countryName, 
      String? countryCode, 
      String? countryFlag,}){
    _countryId = countryId;
    _countryName = countryName;
    _countryCode = countryCode;
    _countryFlag = countryFlag;
}

  CountryModel.fromJson(dynamic json) {
    _countryId = json['countryId'];
    _countryName = json['countryName'];
    _countryCode = json['countryCode'];
    _countryFlag = json['countryFlag'];
  }
  String? _countryId;
  String? _countryName;
  String? _countryCode;
  String? _countryFlag;
CountryModel copyWith({  String? countryId,
  String? countryName,
  String? countryCode,
  String? countryFlag,
}) => CountryModel(  countryId: countryId ?? _countryId,
  countryName: countryName ?? _countryName,
  countryCode: countryCode ?? _countryCode,
  countryFlag: countryFlag ?? _countryFlag,
);
  String? get countryId => _countryId;
  String? get countryName => _countryName;
  String? get countryCode => _countryCode;
  String? get countryFlag => _countryFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['countryId'] = _countryId;
    map['countryName'] = _countryName;
    map['countryCode'] = _countryCode;
    map['countryFlag'] = _countryFlag;
    return map;
  }

}