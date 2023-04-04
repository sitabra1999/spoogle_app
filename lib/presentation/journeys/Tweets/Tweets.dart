import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_spoogle_app/presentation/libraries/AppContents/ProgressLibs/LoaderOverlay.dart';
import 'package:flutter_spoogle_app/presentation/widgets/AppbarIcBack.dart';
import 'package:flutter_spoogle_app/presentation/widgets/NewsCategoryWidget.dart';

import '../../themes/app_color.dart';

String scriptData =
    '<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Sunsets don&#39;t get much better than this one over <a href="https://twitter.com/GrandTetonNPS?ref_src=twsrc%5Etfw">@GrandTetonNPS</a>. <a href="https://twitter.com/hashtag/nature?src=hash&amp;ref_src=twsrc%5Etfw">#nature</a> <a href="https://twitter.com/hashtag/sunset?src=hash&amp;ref_src=twsrc%5Etfw">#sunset</a> <a href="http://t.co/YuKy2rcjyU">pic.twitter.com/YuKy2rcjyU</a></p>&mdash; US Department of the Interior (@Interior) <a href="https://twitter.com/Interior/status/463440424141459456?ref_src=twsrc%5Etfw">May 5, 2014</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>';

class Tweets extends StatefulWidget {
  const Tweets({Key? key}) : super(key: key);

  @override
  State<Tweets> createState() => _TweetsState();
}

class _TweetsState extends State<Tweets> {
  bool isLoaded = false;
  late InAppWebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    isLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarIcBack(context: context, text: "LATEST SPORTS TWEETS", bgColor: Colors.white, isCenterTitle: true),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
        itemBuilder: ((context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Djokovic pays tribute to tribute to federer federer in heart tribute to federer",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: NewsCategoryWidget(height: 22, boxSpace: 8, textSpace: 8, corner: 4,),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text.rich(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColor.textColor, fontSize: 11),
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.access_time_outlined,
                          size: 14,
                          color: AppColor.textColor,
                        ),
                      ),
                      TextSpan(text: "  Posted 1 month ago", ),
                    ],
                  ),
                ),
              ),

              LimitedBox(
                maxHeight: 500,
                child: InAppWebView(
                  initialData: InAppWebViewInitialData(data: getHtmlString()),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    showSimpleLoaderOverlay();
                    _webViewController = controller;
                  },

                  onLoadStop: (InAppWebViewController controller, uri){
                    debugPrint('---- : onLoadStop');
                    hideSimpleLoaderOverlay();
                  },

                  onLoadResource: (InAppWebViewController controller, loadedResource){
                    debugPrint('---- : onLoadResource');
                    hideSimpleLoaderOverlay();
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    debugPrint('---- : onConsoleMessage : $consoleMessage');
                    hideSimpleLoaderOverlay();
                  },

                  onLoadError:  (InAppWebViewController controller, uri, int x, str){
                    debugPrint('---- : onLoadError');
                    hideSimpleLoaderOverlay();
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

String getHtmlString() {
  return """
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        </head>
        $scriptData
    </html>
  """;
}
