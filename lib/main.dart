import 'package:cadenza/database/service.dart';
import 'package:cadenza/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCUirA2DPlxIfvmxqZiTXzNSWmqUriIRdc',
      appId: '1:788303267652:android:e9f1353e407d3ec68b3911',
      messagingSenderId: '788303267652',
      projectId: 'voice-9c086',
      storageBucket: 'voice-9c086.firebasestorage.app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoadingScreen(),
        },
      ),
    );
  }
}
