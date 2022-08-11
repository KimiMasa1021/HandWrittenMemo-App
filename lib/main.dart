import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/separation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //Firebaseの初期化(同期)
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Separation(),
    );
  }
}

// 追加機能
  //　アンドロイドのホーム画面のガジェット機能
  //　描画時にピンチインピンチアウト機能を実装すると描きやすくなるよなー
  //  画像をインポートして描画

  // 別アプリで描くと音が出るアプリとかいいかも子供向けアプリとして
    //  線の高さで音の高さを変えたりしてね
