import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';

class UserInfoArea extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');


    var futureBuilder = FutureBuilder<DocumentSnapshot>(
      future: users.doc("1").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Container(
            child: Column(
              children: [
                // ユーザー名
                Text("${data['name']}", style: TextStyle(fontSize: 18.0),),
                // 説明文
                Text("${data['description']}"),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
          );
        }

        return Text("loading");
      },
    );
    return futureBuilder;
  }
  
}