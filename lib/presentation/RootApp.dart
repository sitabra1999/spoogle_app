import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spoogle_app/common/constants/route_constants.dart';
import 'package:provider/provider.dart';

import 'fade_page_route_builder.dart';
import 'libraries/AppContents/RedScreen/RedScreen.dart';
import 'libraries/FlutterSizer/flutter_sizer.dart';
import 'libraries/Languages/AppLanguage.dart';
import 'libraries/Languages/AppLocalizations.dart';
import 'libraries/Languages/Languages.dart';
import 'routes.dart';
import 'themes/app_color.dart';
import 'themes/app_theme.dart';

class RootApp extends StatefulWidget {
  final Widget screenName;

  const RootApp({Key? key, required this.screenName}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  AppLanguage appLanguage = AppLanguage();

  @override
  void initState() {
    super.initState();
    getLanguageData();
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const RedScreen();
    };
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil package is init to make the app responsive
    //ScreenUtil.init();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => appLanguage,
          lazy: true,
        )
      ],

      child: Consumer<AppLanguage>(builder: (context, langModel, child) {
        debugPrint('---- appLanguage: ${langModel.appLocal}');
        Widget screen = widget.screenName;
        return FlutterSizer(
          builder: (context, orientation, screenType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              unselectedWidgetColor: AppColor.secondaryColor,
              primaryColor: AppColor.white,
              //accentColor: AppColor.app_txt_white,
              scaffoldBackgroundColor: AppColor.white,
              fontFamily: 'Poppins-Regular',
              // Use [Brightness.light] for black status bar
              // or [Brightness.dark] for white status bar
              brightness: Brightness.light,
              inputDecorationTheme: AppTheme.inputDecorationTheme(),
              iconTheme: const IconThemeData(color: AppColor.iconColor),
            ),
            supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
            locale: langModel.appLocal,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return child!;
            },
            initialRoute: RouteList.initial,
            onGenerateRoute: (RouteSettings settings) {
              final routes = Routes.getRoutes(settings);
              final WidgetBuilder? builder = routes[settings.name];
              return FadePageRouteBuilder(
                builder: builder!,
                settings: settings,
              );
            },
            home: screen,
          ),
        );
      }),
    );
  }

  void getLanguageData() async {
    await appLanguage.fetchLocale();
  }
}
