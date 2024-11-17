// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:cadenza/database/service.dart';
import 'package:flutter/material.dart';

class NewPassPage extends StatefulWidget {
  String? email;
  NewPassPage({super.key, this.email});

  @override
  State<NewPassPage> createState() => _NewPassPageState();
}

class _NewPassPageState extends State<NewPassPage> {
  AuthService authService = AuthService();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    passController.text = widget.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff4080FD),
        title: const Text(
          "Новый пароль",
          style: TextStyle(fontFamily: 'Trajan Pro'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Введите свой e-mail",
                  style: TextStyle(
                      color: Color(0xff4080FD),
                      fontSize: 20,
                      fontFamily: 'Trajan Pro'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      labelText: 'e-mail',
                      labelStyle: const TextStyle(fontFamily: 'Trajan Pro'),
                      prefixIcon: const Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xff4080FD)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      await authService.editPassword(passController.text);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Отправить",
                      style: TextStyle(fontSize: 17, fontFamily: 'Trajan Pro'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
