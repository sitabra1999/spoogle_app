
class DeviceInfoModel {
  String deviceOs;
  String wifiName;
  String wifiBSSID;
  String wifiIPv4;
  String wifiIPv6;
  String wifiGatewayIP;
  String wifiBroadcast;
  String wifiSubmask;

  DeviceInfoModel(this.deviceOs, this.wifiName, this.wifiBSSID, this.wifiIPv4, this.wifiIPv6, this.wifiGatewayIP , this.wifiBroadcast , this.wifiSubmask);

  Map toJson() => {
    'deviceOs': deviceOs,
    'wifiName': wifiName,
    'wifiBSSID': wifiBSSID,
    'wifiIPv4': wifiIPv4,
    'wifiIPv6': wifiIPv6,
    'wifiGatewayIP': wifiGatewayIP,
    'wifiBroadcast': wifiBroadcast,
    'wifiSubmask': wifiSubmask,
  };
}
