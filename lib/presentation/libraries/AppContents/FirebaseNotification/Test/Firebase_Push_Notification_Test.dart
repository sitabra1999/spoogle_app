import 'package:flutter_spoogle_app/data/data_sources/data_source_shared_preferences.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/AwesomeNotification/simple_button.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/FirebaseNotification/PushNotification/firebase_datasource.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/extensions/CommonFun.dart';


class FirebasePushNotificationTest extends StatefulWidget {

  final String packageName = 'com.dreamnext.codebell';
  final String sharedLastKeyReference = 'FcmServerKey';

  FirebasePushNotificationTest({Key? key}) : super(key: key);

  final FirebaseDataSource firebaseDataSource = FirebaseDataSource();

  @override
  State<FirebasePushNotificationTest> createState() => _FirebasePushNotificationTestState();
}

class _FirebasePushNotificationTestState extends State<FirebasePushNotificationTest> {
  final _formKey = GlobalKey<FormState>();
  String firebaseAppToken = '';
  final TextEditingController _serverKeyTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    getTokenFromDb();
  }

  String? serverKeyValidation(value) {
    if (value.isEmpty) {
      return 'The FCM server key is required';
    }

    if (!RegExp(r'^[A-z0-9\:\-\_]{150,}$').hasMatch(value)) {
      return 'Enter Valid FCM server key';
    }

    return null;
  }

  Future<String> getLastServerKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(widget.sharedLastKeyReference) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Firebase Push Test', style: TextStyle(fontSize: 20)),
          elevation: 10,
        ),
        body: FutureBuilder<String>(
          future: getLastServerKey(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
              ));
            } else {
              //String lastServerKey = snapshot.data ?? '';_serverKeyTextController = TextEditingController(text: lastServerKey);
              _serverKeyTextController.text = 'AAAAM5WJNBg:APA91bFLTHqVgWQyNAjn2pe1mzo0ibmeYTGws6OvEM1OtIleAubIP0F6ZLqk9zoxljBc4YX6lNmfrwrM8T3PiA3HPwcymeLVy2B15VvhoLstAQyqAmcgvUT6rIxPR-axYQeuzJ0NOFT-';
              return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  children: <Widget>[
                    const Text('Firebase App Token:'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(firebaseAppToken, style: const TextStyle(color: Colors.black)),
                    ),
                    SimpleButton( 'Copy Firebase app token',
                      onPressed: () async {
                        if (firebaseAppToken.isNotEmpty) {
                          Clipboard.setData(
                              ClipboardData(text: firebaseAppToken));
                          showToast(context, 'Token copied');
                        }
                      },
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              minLines: 1, //Normal textInputField will be displayed
                              maxLines: 5, // when user presses enter it will adapt to it
                              keyboardType: TextInputType.multiline,
                              controller: _serverKeyTextController,
                              validator: serverKeyValidation,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: ' Firebase Server Key ',
                                  hintText: 'Paste here your Firebase server Key'),
                            )
                          ],
                        ),
                      ),
                    ),
                    //Text(AwesomeMapUtils.printPrettyMap(widget.firebaseDataSource.getFirebaseExampleContent(firebaseAppToken: _serverKeyTextController.value.text))),
                    SimpleButton(
                      'Send Firebase request',
                      onPressed: () async {
                        String fcmServerKey = _serverKeyTextController.value.text;
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setString(widget.sharedLastKeyReference, fcmServerKey);

                        if (_formKey.currentState?.validate() ?? false) {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }

                          pushFirebaseNotification(1, fcmServerKey);
                        }
                      },
                    )
                  ]);
            }
          },
        ));
  }

  void pushFirebaseNotification(int id, String firebaseServerKey) async {
    //String firebaseAppToken = "dR_o3H3MQ6GoBgkM_WuU4z:APA91bFPjX61tmXKsL6VOagjQT6yNxEZwdHlGB1vyu3nEm-PK8M2XC-_WqhK8t437GuBa6Ch63au1Bwa6iJrk_FYcYd4qI_JL1ZQ4UhhGEoa1tqvE4mEiBewvAfTPQC7iXqKvByAk-3U";
   /* await FirebaseDataSource().pushBasicNotification(
      firebaseAppToken: firebaseAppToken,
      notificationId: id,
      title: 'Notification through firebase',
      body: 'This Notifications was sent through firebase messaging cloud services.',
      payload: {'uuid': 'testPayloadKey'},
    );*/
  }

  void getTokenFromDb() async {
    firebaseAppToken = await AppSharedPreferences().getFirebaseToken()??'';
  }
}
