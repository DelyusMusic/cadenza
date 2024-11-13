import 'package:cadenza/auth.dart';
import 'package:cadenza/database/user.dart';
import 'package:cadenza/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalUser? localUser = Provider.of<LocalUser?>(context);
    final bool check = localUser != null;
    return check ? const HomePage() : const AuthPage();
  }
}
