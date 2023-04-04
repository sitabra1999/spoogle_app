/// status : "Success"
/// message : "Country List"

class CountryApiModel {
  CountryApiModel({
      String? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  CountryApiModel.fromJson(dynamic json) {
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
CountryApiModel copyWith({  String? status,
  String? message,
  List<Data>? data,
}) => CountryApiModel(  status: status ?? _status,
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

class Data {
  Data({
      int? id, 
      String? name, 
      String? iso3, 
      String? numericCode, 
      String? iso2, 
      String? phonecode, 
      String? capital, 
      String? currency, 
      String? currencyName, 
      String? currencySymbol, 
      String? tld, 
      String? native, 
      String? region, 
      String? subregion, 
      String? timezones, 
      String? translations, 
      String? latitude, 
      String? longitude, 
      String? emoji, 
      String? emojiU, 
      String? createdAt, 
      String? updatedAt, 
      int? flag, 
      String? wikiDataId,}){
    _id = id;
    _name = name;
    _iso3 = iso3;
    _numericCode = numericCode;
    _iso2 = iso2;
    _phonecode = phonecode;
    _capital = capital;
    _currency = currency;
    _currencyName = currencyName;
    _currencySymbol = currencySymbol;
    _tld = tld;
    _native = native;
    _region = region;
    _subregion = subregion;
    _timezones = timezones;
    _translations = translations;
    _latitude = latitude;
    _longitude = longitude;
    _emoji = emoji;
    _emojiU = emojiU;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _flag = flag;
    _wikiDataId = wikiDataId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _iso3 = json['iso3'];
    _numericCode = json['numeric_code'];
    _iso2 = json['iso2'];
    _phonecode = json['phonecode'];
    _capital = json['capital'];
    _currency = json['currency'];
    _currencyName = json['currency_name'];
    _currencySymbol = json['currency_symbol'];
    _tld = json['tld'];
    _native = json['native'];
    _region = json['region'];
    _subregion = json['subregion'];
    _timezones = json['timezones'];
    _translations = json['translations'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _emoji = json['emoji'];
    _emojiU = json['emojiU'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _flag = json['flag'];
    _wikiDataId = json['wikiDataId'];
  }
  int? _id;
  String? _name;
  String? _iso3;
  String? _numericCode;
  String? _iso2;
  String? _phonecode;
  String? _capital;
  String? _currency;
  String? _currencyName;
  String? _currencySymbol;
  String? _tld;
  String? _native;
  String? _region;
  String? _subregion;
  String? _timezones;
  String? _translations;
  String? _latitude;
  String? _longitude;
  String? _emoji;
  String? _emojiU;
  String? _createdAt;
  String? _updatedAt;
  int? _flag;
  String? _wikiDataId;
Data copyWith({  int? id,
  String? name,
  String? iso3,
  String? numericCode,
  String? iso2,
  String? phonecode,
  String? capital,
  String? currency,
  String? currencyName,
  String? currencySymbol,
  String? tld,
  String? native,
  String? region,
  String? subregion,
  String? timezones,
  String? translations,
  String? latitude,
  String? longitude,
  String? emoji,
  String? emojiU,
  String? createdAt,
  String? updatedAt,
  int? flag,
  String? wikiDataId,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  iso3: iso3 ?? _iso3,
  numericCode: numericCode ?? _numericCode,
  iso2: iso2 ?? _iso2,
  phonecode: phonecode ?? _phonecode,
  capital: capital ?? _capital,
  currency: currency ?? _currency,
  currencyName: currencyName ?? _currencyName,
  currencySymbol: currencySymbol ?? _currencySymbol,
  tld: tld ?? _tld,
  native: native ?? _native,
  region: region ?? _region,
  subregion: subregion ?? _subregion,
  timezones: timezones ?? _timezones,
  translations: translations ?? _translations,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  emoji: emoji ?? _emoji,
  emojiU: emojiU ?? _emojiU,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  flag: flag ?? _flag,
  wikiDataId: wikiDataId ?? _wikiDataId,
);
  int? get id => _id;
  String? get name => _name;
  String? get iso3 => _iso3;
  String? get numericCode => _numericCode;
  String? get iso2 => _iso2;
  String? get phonecode => _phonecode;
  String? get capital => _capital;
  String? get currency => _currency;
  String? get currencyName => _currencyName;
  String? get currencySymbol => _currencySymbol;
  String? get tld => _tld;
  String? get native => _native;
  String? get region => _region;
  String? get subregion => _subregion;
  String? get timezones => _timezones;
  String? get translations => _translations;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get emoji => _emoji;
  String? get emojiU => _emojiU;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get flag => _flag;
  String? get wikiDataId => _wikiDataId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['iso3'] = _iso3;
    map['numeric_code'] = _numericCode;
    map['iso2'] = _iso2;
    map['phonecode'] = _phonecode;
    map['capital'] = _capital;
    map['currency'] = _currency;
    map['currency_name'] = _currencyName;
    map['currency_symbol'] = _currencySymbol;
    map['tld'] = _tld;
    map['native'] = _native;
    map['region'] = _region;
    map['subregion'] = _subregion;
    map['timezones'] = _timezones;
    map['translations'] = _translations;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['emoji'] = _emoji;
    map['emojiU'] = _emojiU;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['flag'] = _flag;
    map['wikiDataId'] = _wikiDataId;
    return map;
  }

}