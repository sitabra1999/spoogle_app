/// status : "Success"
/// message : "Registration Form Details"
/// data : {"title":["Mr.","Mrs."],"marital_status":{"Married":"Married","Widowed":"Widowed","Separated":"Separated","Divorced":"Divorced","Single":"Single"},"gender":[{"id":1,"gender":"Male","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/male.png"},{"id":2,"gender":"Female","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/female.png"},{"id":3,"gender":"LGBT","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/male.png"},{"id":4,"gender":"Transgender","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/other.png"}],"profession":[{"id":1,"profession_name":"Student","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/student.png"},{"id":2,"profession_name":"Salaried","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/salaried.png"},{"id":3,"profession_name":"Self-employed","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/self-salaried.png"},{"id":4,"profession_name":"Farmer","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/self-salaried.png"},{"id":5,"profession_name":"Military","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/salaried.png"}],"resident_type":["Rented","Own"],"company_type":["PRIVATE_LIMITED","MULTINATIONAL","CENTRAL_LLP","PARTNERSHIP_FIRM","HUF","PSU","OTHER"],"employment_type":["FULL_TIME","PART_TIME","CONTRACT"],"document_type":[{"id":1,"document_name":"Pan","age_limit":1,"api_endpoint":"v3/client/kyc/pan/verify","status":"1","created_at":"2022-03-11T13:38:20.000000Z","updated_at":"2022-03-11T13:38:20.000000Z"},{"id":2,"document_name":"Voter ID","age_limit":1,"api_endpoint":"v3/client/kyc/fetch_id_data/PAN","status":"1","created_at":"2022-03-11T13:38:28.000000Z","updated_at":"2022-03-11T13:38:28.000000Z"},{"id":3,"document_name":"Driving Licance","age_limit":0,"api_endpoint":"v3/client/kyc/fetch_id_data/DRIVING_LICENSE","status":"1","created_at":"2022-03-11T13:38:36.000000Z","updated_at":"2022-03-11T13:38:36.000000Z"}]}

class RegisterFormDetailsApiModel {
  RegisterFormDetailsApiModel({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RegisterFormDetailsApiModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
RegisterFormDetailsApiModel copyWith({  String? status,
  String? message,
  Data? data,
}) => RegisterFormDetailsApiModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// title : ["Mr.","Mrs."]
/// marital_status : {"Married":"Married","Widowed":"Widowed","Separated":"Separated","Divorced":"Divorced","Single":"Single"}
/// gender : [{"id":1,"gender":"Male","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/male.png"},{"id":2,"gender":"Female","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/female.png"},{"id":3,"gender":"LGBT","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/male.png"},{"id":4,"gender":"Transgender","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/other.png"}]
/// profession : [{"id":1,"profession_name":"Student","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/student.png"},{"id":2,"profession_name":"Salaried","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/salaried.png"},{"id":3,"profession_name":"Self-employed","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/self-salaried.png"},{"id":4,"profession_name":"Farmer","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/self-salaried.png"},{"id":5,"profession_name":"Military","icon":"http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/salaried.png"}]
/// resident_type : ["Rented","Own"]
/// company_type : ["PRIVATE_LIMITED","MULTINATIONAL","CENTRAL_LLP","PARTNERSHIP_FIRM","HUF","PSU","OTHER"]
/// employment_type : ["FULL_TIME","PART_TIME","CONTRACT"]
/// document_type : [{"id":1,"document_name":"Pan","age_limit":1,"api_endpoint":"v3/client/kyc/pan/verify","status":"1","created_at":"2022-03-11T13:38:20.000000Z","updated_at":"2022-03-11T13:38:20.000000Z"},{"id":2,"document_name":"Voter ID","age_limit":1,"api_endpoint":"v3/client/kyc/fetch_id_data/PAN","status":"1","created_at":"2022-03-11T13:38:28.000000Z","updated_at":"2022-03-11T13:38:28.000000Z"},{"id":3,"document_name":"Driving Licance","age_limit":0,"api_endpoint":"v3/client/kyc/fetch_id_data/DRIVING_LICENSE","status":"1","created_at":"2022-03-11T13:38:36.000000Z","updated_at":"2022-03-11T13:38:36.000000Z"}]

class Data {
  Data({
      List<String>? title, 
      MaritalStatus? maritalStatus, 
      List<Gender>? gender, 
      List<Profession>? profession, 
      List<String>? residentType, 
      List<String>? companyType, 
      List<String>? employmentType, 
      List<DocumentType>? documentType,}){
    _title = title;
    _maritalStatus = maritalStatus;
    _gender = gender;
    _profession = profession;
    _residentType = residentType;
    _companyType = companyType;
    _employmentType = employmentType;
    _documentType = documentType;
}

  Data.fromJson(dynamic json) {
    _title = json['title'] != null ? json['title'].cast<String>() : [];
    _maritalStatus = json['marital_status'] != null ? MaritalStatus.fromJson(json['marital_status']) : null;
    if (json['gender'] != null) {
      _gender = [];
      json['gender'].forEach((v) {
        _gender?.add(Gender.fromJson(v));
      });
    }
    if (json['profession'] != null) {
      _profession = [];
      json['profession'].forEach((v) {
        _profession?.add(Profession.fromJson(v));
      });
    }
    _residentType = json['resident_type'] != null ? json['resident_type'].cast<String>() : [];
    _companyType = json['company_type'] != null ? json['company_type'].cast<String>() : [];
    _employmentType = json['employment_type'] != null ? json['employment_type'].cast<String>() : [];
    if (json['document_type'] != null) {
      _documentType = [];
      json['document_type'].forEach((v) {
        _documentType?.add(DocumentType.fromJson(v));
      });
    }
  }
  List<String>? _title;
  MaritalStatus? _maritalStatus;
  List<Gender>? _gender;
  List<Profession>? _profession;
  List<String>? _residentType;
  List<String>? _companyType;
  List<String>? _employmentType;
  List<DocumentType>? _documentType;
Data copyWith({  List<String>? title,
  MaritalStatus? maritalStatus,
  List<Gender>? gender,
  List<Profession>? profession,
  List<String>? residentType,
  List<String>? companyType,
  List<String>? employmentType,
  List<DocumentType>? documentType,
}) => Data(  title: title ?? _title,
  maritalStatus: maritalStatus ?? _maritalStatus,
  gender: gender ?? _gender,
  profession: profession ?? _profession,
  residentType: residentType ?? _residentType,
  companyType: companyType ?? _companyType,
  employmentType: employmentType ?? _employmentType,
  documentType: documentType ?? _documentType,
);
  List<String>? get title => _title;
  MaritalStatus? get maritalStatus => _maritalStatus;
  List<Gender>? get gender => _gender;
  List<Profession>? get profession => _profession;
  List<String>? get residentType => _residentType;
  List<String>? get companyType => _companyType;
  List<String>? get employmentType => _employmentType;
  List<DocumentType>? get documentType => _documentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    if (_maritalStatus != null) {
      map['marital_status'] = _maritalStatus?.toJson();
    }
    if (_gender != null) {
      map['gender'] = _gender?.map((v) => v.toJson()).toList();
    }
    if (_profession != null) {
      map['profession'] = _profession?.map((v) => v.toJson()).toList();
    }
    map['resident_type'] = _residentType;
    map['company_type'] = _companyType;
    map['employment_type'] = _employmentType;
    if (_documentType != null) {
      map['document_type'] = _documentType?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// document_name : "Pan"
/// age_limit : 1
/// api_endpoint : "v3/client/kyc/pan/verify"
/// status : "1"
/// created_at : "2022-03-11T13:38:20.000000Z"
/// updated_at : "2022-03-11T13:38:20.000000Z"

class DocumentType {
  DocumentType({
      int? id, 
      String? documentName, 
      int? ageLimit, 
      String? apiEndpoint, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _documentName = documentName;
    _ageLimit = ageLimit;
    _apiEndpoint = apiEndpoint;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  DocumentType.fromJson(dynamic json) {
    _id = json['id'];
    _documentName = json['document_name'];
    _ageLimit = json['age_limit'];
    _apiEndpoint = json['api_endpoint'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _documentName;
  int? _ageLimit;
  String? _apiEndpoint;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
DocumentType copyWith({  int? id,
  String? documentName,
  int? ageLimit,
  String? apiEndpoint,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => DocumentType(  id: id ?? _id,
  documentName: documentName ?? _documentName,
  ageLimit: ageLimit ?? _ageLimit,
  apiEndpoint: apiEndpoint ?? _apiEndpoint,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get documentName => _documentName;
  int? get ageLimit => _ageLimit;
  String? get apiEndpoint => _apiEndpoint;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['document_name'] = _documentName;
    map['age_limit'] = _ageLimit;
    map['api_endpoint'] = _apiEndpoint;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// profession_name : "Student"
/// icon : "http://3.6.41.121/CampusDunia_backend/storage/uploads/profession/student.png"

class Profession {
  Profession({
      int? id, 
      String? professionName, 
      String? icon,}){
    _id = id;
    _professionName = professionName;
    _icon = icon;
}

  Profession.fromJson(dynamic json) {
    _id = json['id'];
    _professionName = json['profession_name'];
    _icon = json['icon'];
  }
  int? _id;
  String? _professionName;
  String? _icon;
Profession copyWith({  int? id,
  String? professionName,
  String? icon,
}) => Profession(  id: id ?? _id,
  professionName: professionName ?? _professionName,
  icon: icon ?? _icon,
);
  int? get id => _id;
  String? get professionName => _professionName;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['profession_name'] = _professionName;
    map['icon'] = _icon;
    return map;
  }

}

/// id : 1
/// gender : "Male"
/// icon : "http://3.6.41.121/CampusDunia_backend/storage/uploads/gender/male.png"

class Gender {
  Gender({
      int? id, 
      String? gender, 
      String? icon,}){
    _id = id;
    _gender = gender;
    _icon = icon;
}

  Gender.fromJson(dynamic json) {
    _id = json['id'];
    _gender = json['gender'];
    _icon = json['icon'];
  }
  int? _id;
  String? _gender;
  String? _icon;
Gender copyWith({  int? id,
  String? gender,
  String? icon,
}) => Gender(  id: id ?? _id,
  gender: gender ?? _gender,
  icon: icon ?? _icon,
);
  int? get id => _id;
  String? get gender => _gender;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['gender'] = _gender;
    map['icon'] = _icon;
    return map;
  }

}

/// Married : "Married"
/// Widowed : "Widowed"
/// Separated : "Separated"
/// Divorced : "Divorced"
/// Single : "Single"

class MaritalStatus {
  MaritalStatus({
      String? married, 
      String? widowed, 
      String? separated, 
      String? divorced, 
      String? single,}){
    _married = married;
    _widowed = widowed;
    _separated = separated;
    _divorced = divorced;
    _single = single;
}

  MaritalStatus.fromJson(dynamic json) {
    _married = json['Married'];
    _widowed = json['Widowed'];
    _separated = json['Separated'];
    _divorced = json['Divorced'];
    _single = json['Single'];
  }
  String? _married;
  String? _widowed;
  String? _separated;
  String? _divorced;
  String? _single;
MaritalStatus copyWith({  String? married,
  String? widowed,
  String? separated,
  String? divorced,
  String? single,
}) => MaritalStatus(  married: married ?? _married,
  widowed: widowed ?? _widowed,
  separated: separated ?? _separated,
  divorced: divorced ?? _divorced,
  single: single ?? _single,
);
  String? get married => _married;
  String? get widowed => _widowed;
  String? get separated => _separated;
  String? get divorced => _divorced;
  String? get single => _single;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Married'] = _married;
    map['Widowed'] = _widowed;
    map['Separated'] = _separated;
    map['Divorced'] = _divorced;
    map['Single'] = _single;
    return map;
  }

}