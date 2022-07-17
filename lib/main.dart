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
      title: 'Flutter Demo',
      home: Separation(),
    );
  }
}


// 確実に実装するもの
  //　消しゴムアイコンの修正
  //　ワンタップ描画の大きさの調整
  //　UnityADSの設定・実装
// 追加予定の機能
  //　アンドロイドのホーム画面のガジェット機能
  //　描画時にピンチインピンチアウト機能を実装すると描きやすくなるよなー
  //  画像をインポートして描画