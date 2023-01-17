import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medical_app/base/base_widget.dart';
import 'package:medical_app/di/app/app_modules.dart';
import 'package:medical_app/generated/l10n.dart';
import 'package:medical_app/main/app_view_model.dart';
import 'package:medical_app/main/navigation/app_router.dart';
import 'package:medical_app/main/navigation/route_paths.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends ConsumerWidget {
  late AppViewModel _appViewModel;


  @override
  Widget build(BuildContext context, watch) {
    return BaseWidget<AppViewModel>(
      providerBase: appViewModel,
      onModelReady: (model) {
        _appViewModel = watch(appViewModel);
      },
      builder: (context, appModel, child) {
        return MaterialApp(
            navigatorKey: appLevelKey,
            builder: (context, widget) => ResponsiveWrapper.builder(
              ClampingScrollWrapper.builder(context, widget!),
              maxWidth: 1400,
              minWidth: 411,
              defaultScale: true,
              breakpoints: [
                const ResponsiveBreakpoint.resize(450, name: MOBILE),
                const ResponsiveBreakpoint.resize(1000, name: TABLET),
                const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
              ],
            ),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            onGenerateTitle: (context) => S.of(context).appName,
            debugShowCheckedModeBanner: false,
            initialRoute: RoutePaths.vitalBloodOxygen,
            theme: _appViewModel.themeData,
            onGenerateRoute: AppRouter.generateRoute);
      },
    );
  }
}
