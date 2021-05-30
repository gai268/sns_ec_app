import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:logging/logging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sns_ec_app/error_handler/global_error_handler.dart';
import 'package:sns_ec_app/pages/auth/email_confirm_page.dart';

import 'package:sns_ec_app/pages/errors/read_err_page.dart';
import 'package:sns_ec_app/pages/home.dart';
import 'package:sns_ec_app/pages/loading_page.dart';
import 'package:sns_ec_app/pages/auth/login_page.dart';
import 'package:sns_ec_app/pages/mypage.dart';
import 'package:sns_ec_app/pages/post_page.dart';
import 'package:sns_ec_app/pages/settings_page.dart';
import 'package:sns_ec_app/pages/errors/unknown_page.dart';
import 'package:sns_ec_app/pages/auth/signup_page.dart';
import 'modules/page_route_builder/unanimated_page_route_builder.dart';

GlobalErrorHandler globalErrorHandler = new GlobalErrorHandler();

void main() {
  // ロガーの設定
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: ${record.time}: ${record.message} ${record.stackTrace != null ? record.stackTrace : ""} ${record.error}');
  });

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      globalErrorHandler.onError(details: details);

      // デバックモードの場合
      if (!kDebugMode) exit(1);
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {
    globalErrorHandler.onError(error: error, stack: stack);

    // デバックモードの場合
    if (!kDebugMode) exit(1);
  });
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SNS EC",
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.red)),
          appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).canvasColor,
              textTheme: Theme.of(context).textTheme,
              iconTheme: Theme.of(context).iconTheme),
          tabBarTheme: TabBarTheme(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.red)),
              labelColor: Theme.of(context).textTheme.bodyText1.color)),
      home: _buildHome(),
      routes: <String, WidgetBuilder>{
        '/post': (BuildContext context) => PostPage(), // 投稿ページ
        '/signup': (BuildContext context) => SignupPage(), // ユーザー登録ページ
        '/settings': (BuildContext context) => SettingsPage(), // 設定ページ
        '/error': (BuildContext context) => ReadErrPage(), // 読み込みエラーページ
        '/email-confirm': (BuildContext context) =>
            EmailConfirmPage(), // メールアドレス確認中ページ
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          // ホーム
          case "/home":
            return UnanimatedPageRouteBuilder(Home());
          // ログインページ
          case "/login":
            return UnanimatedPageRouteBuilder(LoginPage());
          // マイページ
          case "/mypage":
            return UnanimatedPageRouteBuilder(Mypage());
          // 404ページ
          default:
            return MaterialPageRoute(builder: (_) => UnknownPage());
        }
      },
      builder: (BuildContext context, Widget widget) {
        Widget error = Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator)
          error = Scaffold(body: Center(child: error));
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;
        return widget;
      },
    );
  }

  Widget _buildHome() {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ReadErrPage();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          final FirebaseAuth auth = FirebaseAuth.instance;
          // 未ログインの場合
          if (auth.currentUser == null) {
            return LoginPage();
          }
          return Mypage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingPage();
      },
    );
  }
}
