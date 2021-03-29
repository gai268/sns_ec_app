import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sns_ec_app/pages/home.dart';
import 'package:sns_ec_app/pages/mypage.dart';
import 'package:sns_ec_app/pages/post_page.dart';
import 'package:sns_ec_app/pages/settings_page.dart';
import 'package:sns_ec_app/pages/unknown_page.dart';
import 'modules/page_route_builder.dart/unanimated_page_route_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "サンプル",
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.red,
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).canvasColor,
          textTheme: Theme.of(context).textTheme,
          iconTheme: Theme.of(context).iconTheme
        ),
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.red)),
          labelColor: Theme.of(context).textTheme.bodyText1.color
      
        )
      ),
      home: Mypage(),
      routes: <String, WidgetBuilder> {
        '/post': (BuildContext context) => PostPage(),  // 投稿ページ
        '/settings': (BuildContext context) => SettingsPage(),  // 投稿ページ
      },
      onGenerateRoute: (RouteSettings settings){
        switch (settings.name) {
          // ホーム
          case "/home":
            return UnanimatedPageRouteBuilder(Home());
          // マイページ
          case "/mypage":
            return UnanimatedPageRouteBuilder(Mypage());
          // 404ページ
          default:
            return MaterialPageRoute(builder: (_) => UnknownPage());
        }
      }
    );
  }
}


