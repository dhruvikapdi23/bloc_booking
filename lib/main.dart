import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:go_router/go_router.dart';
import 'dart:io' show Platform;
import 'core/route/app_router.dart';
import 'core/theme/color_schemes.g.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'presentation/bloc/app/app_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC4YKdYLlCzjdfzd5OkR3YwU0FwPwUbJP4",
          appId: "1:889224701647:android:60b86e5878d91529c079ba",
          messagingSenderId: "889224701647",
          storageBucket: "paxpass-dev.appspot.com",
          projectId: "paxpass-dev")
  );

  // Allow all orientations
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (Platform.isAndroid) {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  await di.setUp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Do not put AppRouter().router inside build method -> it will start the from initial route '/' on "Hot Reload"
  final GoRouter _router = AppRouter().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: init(),
      builder: (context,s) {
        return BlocProvider(
          create: (context) => locator.get<AppBloc>()..add(OnAppInit()),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: "PaxPass",
                routerConfig: _router,

                /// Theming
                themeMode: state.selectedThemeMode.value,
                theme: AppTheme.fromType(ThemeType.light).themeData,
                darkTheme: AppTheme.fromType(ThemeType.dark).themeData,

                /// Localization
                // locale: state.selectedLanguage.value,
                // supportedLocales: AppLocalizations.supportedLocales,
                // localizationsDelegates: AppLocalizations.localizationsDelegates,
              );
            },
          ),
        );
      }
    );
  }
}
