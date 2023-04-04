/// ringtoneName : "Code Bell Classic"
/// ringtoneVolume : "4.0"
/// isVibrationOn : "false"
/// isRingOn : "true"

class SettingsPrefModel {
  SettingsPrefModel({
      String? ringtoneName,
    double? ringtoneVolume,
      bool? isVibrationOn,
    bool? isRingOn,}){
    _ringtoneName = ringtoneName;
    _ringtoneVolume = ringtoneVolume;
    _isVibrationOn = isVibrationOn;
    _isRingOn = isRingOn;
}

  Map<String, dynamic> toMap() {
    return {
      'ringtoneName': ringtoneName,
      'ringtoneVolume': ringtoneVolume,
      'isVibrationOn': isVibrationOn,
      'isRingOn': isRingOn,
    };
  }

  SettingsPrefModel.fromJson(dynamic json) {
    _ringtoneName = json['ringtoneName'];
    _ringtoneVolume = json['ringtoneVolume'];
    _isVibrationOn = json['isVibrationOn'];
    _isRingOn = json['isRingOn'];
  }
  String? _ringtoneName;
  double? _ringtoneVolume;
  bool? _isVibrationOn;
  bool? _isRingOn;
SettingsPrefModel copyWith({  String? ringtoneName,
  double? ringtoneVolume,
  bool? isVibrationOn,
  bool? isRingOn,
}) => SettingsPrefModel(  ringtoneName: ringtoneName ?? _ringtoneName,
  ringtoneVolume: ringtoneVolume ?? _ringtoneVolume,
  isVibrationOn: isVibrationOn ?? _isVibrationOn,
  isRingOn: isRingOn ?? _isRingOn,
);
  String? get ringtoneName => _ringtoneName;
  double? get ringtoneVolume => _ringtoneVolume;
  bool? get isVibrationOn => _isVibrationOn;
  bool? get isRingOn => _isRingOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ringtoneName'] = _ringtoneName;
    map['ringtoneVolume'] = _ringtoneVolume;
    map['isVibrationOn'] = _isVibrationOn;
    map['isRingOn'] = _isRingOn;
    return map;
  }

}