import 'package:cadenza/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loading_screen/models/next_page_param.dart';
import 'package:flutter_loading_screen/widget/loading_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future loading() async {
    return await Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLoadingScreen(
      image: Image.asset(
        'images/loading.png',
        fit: BoxFit.fill,
      ),
      loadingMessage: 'Загрузка...',
      title: 'Добро пожаловать',
      loaderColor: Colors.blue,
      futureTask: loading,
      nextPageParam: NextPageParam(
        navigateToWidget: const LandingPage(),
      ),
    );
  }
}
