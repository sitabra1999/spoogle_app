
import 'package:permission_handler/permission_handler.dart';


//How to use
/*
requestPermission('PermissionName').then((isPermissionGranted) {});
*/

Future<bool> requestPermission(String permissionName) async {
  late PermissionStatus permissionStatus;
  switch (permissionName){
    case 'Location':
      permissionStatus = await Permission.location.request();
      break;

    case 'Camera':
      permissionStatus = await Permission.camera.request();
      break;

    case 'Contact':
      permissionStatus = await Permission.contacts.request();
      break;

    case 'Storage':
      permissionStatus = await Permission.storage.request();
      break;

    case 'Photos':
      permissionStatus = await Permission.photos.request();
      break;

    case 'Microphone':
      permissionStatus = await Permission.microphone.request();
      break;

    case 'AccessMediaLocation':
      permissionStatus = await Permission.accessMediaLocation.request();
      break;

    case 'NotificationCriticalAlerts':
      permissionStatus = await Permission.criticalAlerts.request();
      break;
  }

  return permissionStatus == PermissionStatus.granted? true: false;
}


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.


/*

 void sendUserDataToServer() async {
    try {
      String deviceType = Platform.isAndroid ? 'Android' : 'iOS';
      String platformVersion = await DeviceInformation.platformVersion;
      //String imeiNo = await DeviceInformation.deviceIMEINumber;
      String modelName = await DeviceInformation.deviceModel;
      String manufacturer = await DeviceInformation.deviceManufacturer;
      //String apiLevel =  await DeviceInformation.apiLevel.toString();
      //String deviceName = await DeviceInformation.deviceName;
      //String productName = await DeviceInformation.productName;
      //String cpuType = await DeviceInformation.cpuName;
      //String hardware = await DeviceInformation.hardware;

      String operatingSystem = Platform.operatingSystem;
      String operatingSystemVersion = Platform.operatingSystemVersion;
      String localeName = Platform.localeName;
      String numberOfProcessors = Platform.numberOfProcessors.toString();


      if (kDebugMode) {
        print('----platformVersion, manufacturer, modelName : $platformVersion, $manufacturer - $modelName');
        print('----operatingSystem, operatingSystemVersion, localeName, numberOfProcessors, deviceType : '
            '$operatingSystem, $operatingSystemVersion, $localeName, $numberOfProcessors, $numberOfProcessors, $deviceType');
      }

      userCurrentPosition();

    } on PlatformException {
      String platformVersion = 'Failed to get platform version.';
      print('---- platformVersion: $platformVersion');
    }
  }

 */

/*
Future<Position> userCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  Position currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print('---- Latitude, Longitude:  ${currentLocation.latitude}, ${currentLocation.longitude}');

  return await Geolocator.getCurrentPosition();
}


Future<bool> getLocPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.

  Position currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  if (kDebugMode) {
    print('---- Latitude, Longitude:  ${currentLocation.latitude}, ${currentLocation.longitude}');
  }

  return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
}*/
