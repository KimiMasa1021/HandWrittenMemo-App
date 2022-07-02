import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'screens/separation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //アプリ起動時に処理を発火させるため？？
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Separation(),
    );
  }
}
