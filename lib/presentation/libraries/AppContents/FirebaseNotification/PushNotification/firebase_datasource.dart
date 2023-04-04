import 'dart:async';
import 'dart:convert';
import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:http/http.dart' show Response;

import 'http_datasource.dart';


class FirebaseDataSource extends HttpDataSource {
  /// ************************************************************************************
  ///
  /// SINGLETON CONSTRUCTOR PATTERN
  ///
  /// ************************************************************************************

  static FirebaseDataSource? _instance;
  factory FirebaseDataSource() {
    _instance ??= FirebaseDataSource._internalConstructor();
    return _instance!;
  }

  FirebaseDataSource._internalConstructor()
      : super(
        baseAPI:'fcm.googleapis.com',
        isUsingHttps: true,
        isCertificateHttps: false
      );
  
//   /// ************************************************************************************
//   ///
//   /// FETCH DATA METHODS
//   ///
//   /// ************************************************************************************

  Future<String> _notificationModel({Map<String, dynamic> body = const {}}) async {
    String firebaseServerKey = 'AAAAM5WJNBg:APA91bFLTHqVgWQyNAjn2pe1mzo0ibmeYTGws6OvEM1OtIleAubIP0F6ZLqk9zoxljBc4YX6lNmfrwrM8T3PiA3HPwcymeLVy2B15VvhoLstAQyqAmcgvUT6rIxPR-axYQeuzJ0NOFT-';

    Response? response = await fetchData(
        directory: '/fcm/send',
        headers: {
          'Authorization': 'key=$firebaseServerKey',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(body));

    if (response?.statusCode == 200) {
      return response!.bodyBytes.toString();
    }

    return '';
  }

  Future<String> pushNotificationCall({
    required String firebaseAppToken,
    required int notificationId,
    required String title,
    required String body,
    required String peerImage,
    required String peerMob,
    required Map<String, String> payload,
  }) async {
    return await _notificationModel(
        body: getFirebaseContentForCall(firebaseAppToken: firebaseAppToken, notificationId: notificationId, body: body,
            peerImage: peerImage, peerMob: peerMob, payload: payload),
    );
  }

  Map<String, dynamic> getFirebaseContentForCall({required String firebaseAppToken,required int notificationId,
    required String body, required String peerImage, required String peerMob, required Map<String, String> payload}) {
    return {
      'to': firebaseAppToken,
      'mutable_content' : true,
      'content_available': true,
      'priority': 'high',
      'data': {
        'content': {
          'id': notificationId,
          'channelKey': 'incoming_call',
          'title': "Incoming Call",
          'body': body,
          'notificationLayout': 'BigPicture',
          'largeIcon': peerImage,
          'bigPicture': peerImage,
          'showWhen': true,
          'autoDismissible': true,
          'privacy': 'Private',
          'payload': payload
        }
      }
    };
  }

  Future<String> pushBasicNotification({
    required String firebaseAppToken,
    required int notificationId,
    required String title,
    required String body,
    required Map<String, String> payload,
  }) async {
    return await _notificationModel(
        body: getBasicFirebaseContent(firebaseAppToken: firebaseAppToken, notificationId: notificationId,
            title: title, body: body, payload: payload),
    );
  }

  Map<String, dynamic> getBasicFirebaseContent({required String firebaseAppToken,required int notificationId,
    required String title, required String body, required Map<String, String> payload}) {
    return {
      'to': firebaseAppToken,
      'content_available': true,
      'priority': 'high',
      'data': {
        'content': {
          'id': notificationId,
          'channelKey': 'basic_channel',
          'title': title,
          'body': body,
          'payload': payload
        }
      }
    };
  }


  Future<String> pushCallInfoNotification({
    required String firebaseAppToken,
    required String callStatus,
    required int notificationId,
    required Map<String, String> payload,
  }) async {
    return await _notificationModel(
        body: getCallInfoFirebaseContent(firebaseAppToken: firebaseAppToken, callStatus: callStatus,
            notificationId: notificationId, payload: payload),
    );
  }

  Map<String, dynamic> getCallInfoFirebaseContent({required String firebaseAppToken, required String callStatus,
    required int notificationId,
    required Map<String, String> payload}) {
    return {
      'to': firebaseAppToken,
      'content_available': true,
      'priority': 'high',
      'data': {
        'content': {
          'id': notificationId,
          'channelKey': 'basic_channel',
          'title': callStatus,
          'body': "call_info",
          'payload': payload
        }
      }
    };
  }
}
