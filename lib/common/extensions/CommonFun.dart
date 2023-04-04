import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FlutterPageTransition/PageTransition.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/libraries/FlutterToast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/AppMessages.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenNotificationBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

Size getScreenBodySize(BuildContext context) {
  var mediaQuery = MediaQuery.of(context);
  double screenWidth = mediaQuery.size.width;
  double bodySize = mediaQuery.size.height + mediaQuery.padding.top + 65;
  //debugPrint('----screenWidth - bodySize : $screenWidth - $bodySize');
  return Size(screenWidth, bodySize);
}

void openScreen(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

void openScreenWithoutBack(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
    (Route<dynamic> route) => false,
  );
}

void openScreenWithTransition(BuildContext context, pageTransitionType, Widget widget) {
  Navigator.push(
    context,
    PageTransition(
      type: pageTransitionType,
      alignment: Alignment.bottomCenter,
      child: widget,
    ),
  );
}

Future<bool> isInternetConnectionAvailable() async {
  bool isConnectedToInternet = false;
  if (kIsWeb) {
    // running on the web!
    isConnectedToInternet = true;
  } else {
    // NOT running on the web! You can check for additional platforms here.
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (kDebugMode) {
          debugPrint('---- connected');
        }
        isConnectedToInternet = true;
      }
    } on SocketException catch (_) {
      isConnectedToInternet = false;
      if (kDebugMode) {
        debugPrint('---- Not connected');
      }
    }
  }
  return isConnectedToInternet;
}

void showInternetNotAvailableMessage(BuildContext context) {
  edgeAlert(context,
      icon: Icons.wifi_off_outlined, title: AppMessages.warning, description: AppMessages.noInternet, gravity: Gravity.top);
}

String getFirstWordFromText(String txt) {
  return ("$txt ").split(" ")[0]; //add " " to string to be sure there is something to split
}

void showToast(BuildContext context, String message) {
  Toast.show(message, context,
      duration: Toast.lengthLong,
      gravity: Toast.bottom,
      backgroundColor: Colors.black87.withOpacity(0.6),
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: 'Poppins-Regular',
        shadows: [
          Shadow(color: Colors.white),
        ],
      ),
      border: Border.all(color: Colors.white));
}

String convertStrToDoubleStr(String value) => value.isNotEmpty ? double.parse(value).toStringAsFixed(2).toString() : '0';

String add0toSingleStr(String value) => value.length < 2 ? "0$value" : value;

String convertStrToDoubleStrWithZeroDecimal(String value) =>
    value.isNotEmpty ? double.parse(value).toStringAsFixed(0).toString() : '0';

String formatDate(DateTime date) => DateFormat("dd-MM-yyyy").format(date);

String currentDateTime(DateTime date) => DateFormat("dd-MM-yy H:m").format(date);

String formatDateForServer(DateTime date) => DateFormat("yyyy/MM/dd").format(date);

String parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body?.text).documentElement?.text ?? '';
  return parsedString;
}

int getRandomNumberInRange() {
  Random rnd = Random();
  int min = 1;
  int max = 999999;
  return min + rnd.nextInt(max - min);
}

int getRandomNumberInRangeDynamic(int min, int max) {
  Random rnd = Random();
  return min + rnd.nextInt(max - min);
}

String generateRandomString() {
  var r = Random();
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return List.generate(3, (index) => chars[r.nextInt(chars.length)]).join();
}

String getRandomElementFromList() {
  List<String> detectionList = ['Order Confirmed', 'Order Pick Up', 'Order Delivered', 'Order Rejected', 'Promotion'];
  // generate a random index based on the list length
  // and use it to retrieve the element
  return detectionList[Random().nextInt(detectionList.length)];
}

Future<String> pickDate(BuildContext context) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.calendar,
    firstDate: DateTime(1980, 1),
    lastDate: DateTime(2025),
    initialDate: DateTime.now(),
    helpText: 'SELECT DATE',
    // Can be used as title
    cancelText: 'NOT NOW',
    confirmText: 'CONFIRM',
    //selectableDayPredicate: _disableDates,
    /*builder: (context, child) {
          return Theme(
            data: ThemeData(
              primaryColor: Colors.blueAccent,
              disabledColor: Colors.redAccent,
              textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.blueAccent)),
              //accentColor: Colors.blue,
            ),
            //child: child,
          );
        },*/
  );

  if (kDebugMode) {
    print('----Picked Date : $picked');
  }

  return DateFormat("yyyy-MM-dd").format(picked!);
}

String getMonthRange(int previousMonth, int currentMonth) {
  List months = ['Jan', 'Feb', 'Mar', 'April', 'May', 'Jun', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return "${months[previousMonth - 1]} - ${months[currentMonth - 1]}";
}

Future<DateTimeRange> rangeDatePicker(BuildContext context) async {
  DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 100)),
      lastDate: DateTime.now().add(const Duration(days: 100)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            //Header background color
            primaryColor: Colors.orange,
            //Background color
            scaffoldBackgroundColor: Colors.grey[50],
            //Divider color
            dividerColor: Colors.grey,
            //Non selected days of the month color
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.black),
            ),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              //Selected dates background color
              primary: Colors.orange,
              //Month title and week days color
              onSurface: Colors.black,
              //Header elements and selected dates text color
              //onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      });

  //debugPrint('-----Date : $picked');
  return picked!;
}

String convertDateFormat(String date) {
  return DateFormat('dd MMM yyyy').format(DateTime.parse(date)).toString();
}


/*
//Timer reverse countdown. Call at Screen
void startTimer() {
  Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    if (_start == 0) {
      setState(() {
        timer.cancel();
      });
    } else {
      setState(() {
        _start--;
      });
    }
  },
  );
}*/

/*launchUrl(String url) async {
  if (!launchUrl(url)) throw 'Could not launch $url';
}*/

void launchDialer(String phoneNumber) async {
  Uri uri = Uri.parse("tel:$phoneNumber");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not dialer $phoneNumber';
  }
}

Future<void> launchInBrowser(String url) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}

Future<void> launchUniversalLinkIos(String url) async {
  final bool nativeAppLaunchSucceeded = await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalNonBrowserApplication,
  );
  if (!nativeAppLaunchSucceeded) {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    );
  }
}

File convertToFile(XFile xFile) => File(xFile.path);

String formatTimeFromSecond(int secTime) {
  String getParsedTime(String time) {
    if (time.length <= 1) return "0$time";
    return time;
  }

  int min = secTime ~/ 60;
  int sec = secTime % 60;

  String parsedTime = "${getParsedTime(min.toString())} : ${getParsedTime(sec.toString())}";

  return parsedTime;
}

String currentTime(){
  return DateTime.now().second.toString();
}
