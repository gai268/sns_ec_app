import 'package:flutter/material.dart';
import 'package:sns_ec_app/components/footer.dart';
import 'package:sns_ec_app/components/like_area.dart';
import 'package:sns_ec_app/components/message_area.dart';
import 'package:sns_ec_app/modules/sticky_tab_bar_delegate.dart';
import 'package:sns_ec_app/pages/tabs/posts_tab.dart';

class Mypage extends StatelessWidget{
  final _tabs = ["投稿", "ブックマーク", "いいね"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
        title: Text("マイページ"),  // タイトルを表示
        automaticallyImplyLeading: false, // 戻るボタン非表示
      ),
      body: DefaultTabController(
        length: _tabs.length, 
        child: NestedScrollView(
          // タブバー
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  MessageArea(),
                  LikeArea()
                ])
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                  tabBar: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                  backgroundColor: Theme.of(context).canvasColor, // 背景色
                ),
              ),
            ];
          },
          // タブ本体
          body: TabBarView(  // 表示画面のウィジェット一覧を渡す
            children: <Widget> [
              SafeArea(child: PostsTab()),
              SafeArea(child: PostsTab()),
              SafeArea(child: PostsTab()),
            ]
          )
        
        )
      ),

      bottomNavigationBar: Footer(),
    );
  }
}
