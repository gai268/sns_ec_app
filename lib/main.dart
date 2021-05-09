import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:sns_ec_app/pages/errors/read_err_page.dart';
import 'package:sns_ec_app/pages/home.dart';
import 'package:sns_ec_app/pages/loading_page.dart';
import 'package:sns_ec_app/pages/login_page.dart';
import 'package:sns_ec_app/pages/mypage.dart';
import 'package:sns_ec_app/pages/post_page.dart';
import 'package:sns_ec_app/pages/settings_page.dart';
import 'package:sns_ec_app/pages/errors/unknown_page.dart';
import 'modules/page_route_builder.dart/unanimated_page_route_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
            appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).canvasColor,
                textTheme: Theme.of(context).textTheme,
                iconTheme: Theme.of(context).iconTheme),
            tabBarTheme: TabBarTheme(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.red)),
                labelColor: Theme.of(context).textTheme.bodyText1.color)
        ),
        home: _buildHome(),
        routes: <String, WidgetBuilder>{
          '/post': (BuildContext context) => PostPage(), // 投稿ページ
          '/settings': (BuildContext context) => SettingsPage(), // 投稿ページ
          '/error': (BuildContext context) => ReadErrPage(), // 投稿ページ
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
        });
  }

  Widget _buildHome(){
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
          return Mypage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingPage();
      },
    );
  }
}
