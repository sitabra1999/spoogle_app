import 'package:flutter_spoogle_app/common/constants/AppMessages.dart';
import 'package:flutter_spoogle_app/common/extensions/CommonFun.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/edge_alerts/edge_alerts.dart';
import 'package:flutter_spoogle_app/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../ProgressLibs/LoaderOverlay.dart';
import 'liquid_pull_to_refresh.dart';

class PullToRefreshAndInternetCheckerWidget extends StatefulWidget {
  final Function() onReload;
  final Widget child;

  const PullToRefreshAndInternetCheckerWidget({Key? key, required this.onReload, required this.child}) : super(key: key);

  @override
  State<PullToRefreshAndInternetCheckerWidget> createState() => _PullToRefreshAndInternetCheckerWidgetState();
}

class _PullToRefreshAndInternetCheckerWidgetState extends State<PullToRefreshAndInternetCheckerWidget> {
  String internetConnectionStatus = 'Checking';

  @override
  void initState() {
    super.initState();

    checkInternetConnection();
  }

  Future<bool> checkInternetConnection() async {
    internetConnectionStatus = 'Checking';
    bool isInternetAvailable = await isInternetConnectionAvailable();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          isInternetAvailable ? internetConnectionStatus = "Available" : internetConnectionStatus = "Unavailable";
        });
    });

    return isInternetAvailable;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('------internetConnectionStatus: $internetConnectionStatus');
    return LiquidPullToRefresh(
      backgroundColor: Colors.grey.shade400,
      circleColor: Colors.white,
      onRefreshComplete: () {
        // debugPrint('---------');
        checkInternetConnection();
      },
      child: internetConnectionStatus == "Available" ? widget.child : internetNotAvailableUi(),
    );
  }

  Widget internetNotAvailableUi() {
    return internetConnectionStatus == "Unavailable" ?  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: getScreenWidth(context),
          child: Lottie.asset(
            'assets/animations/no_internet.json',
            width: 300,
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 55),
          child: Text(
            'Your network seems to be down!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColor.primaryColor),
            maxLines: 4,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'Please check your internet connection.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black54),
            maxLines: 4,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 65),
          child: OutlinedButton(
            style: ButtonStyle(
              //minimumSize: MaterialStateProperty.all(const Size(50, 30)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 55)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              overlayColor: MaterialStateProperty.all(Colors.orange.shade50),
              elevation: MaterialStateProperty.all(12),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
            child: Text(
              'Retry',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.grey.shade600),
            ),
            onPressed: () async {
              checkInternetConnection().then((isInternetAvailable){
                debugPrint('---- isInternetAvailable: $isInternetAvailable');
                if (isInternetAvailable) {
                  widget.onReload();
                  //Navigator.of(context).pop();
                } else {
                  edgeAlert(context,
                      icon: Icons.wifi_off_outlined,
                      title: AppMessages.warning,
                      description: AppMessages.noInternet,
                      gravity: Gravity.top);
                }
              });
            },
          ),
        ),
      ],
    ): showSimpleLoaderOverlay();
  }
}
