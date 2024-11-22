// ignore_for_file: use_build_context_synchronously
import 'package:cadenza/database/service.dart';
import 'package:cadenza/database/users_collection.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();
  UsersCollection usersCollection = UsersCollection();
  bool visibility = false;
  TextStyle _labelStyle = const TextStyle(fontFamily: 'Trajan Pro', color: Colors.grey); 
  Color _iconColor = Colors.grey;
  Color _textColor = Colors.black;

  final FocusNode _focusNode = FocusNode();
  bool auth = true;
@override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _iconColor = _focusNode.hasFocus ? const Color(0xff4080FD) : Colors.grey;
        _labelStyle = TextStyle(fontFamily: 'Trajan Pro', 
              color: _focusNode.hasFocus ? const Color(0xff4080FD) : Colors.grey);
        _textColor = _focusNode.hasFocus ? const Color.fromARGB(255, 13, 60, 156) : Colors.black;
      });
    });
  }
@override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  signUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty) {
      // print("Поля пустые");
    } else {
      var user = await authService.signUp(
          emailController.text, passwordController.text);

      if (user != null) {
        await usersCollection.addUsersCollection(nameController.text,
            emailController.text, passwordController.text, user.id.toString());

        Navigator.popAndPushNamed(context, '/');
      } else {
        // print("Не зарегало");
      }
    }
  }

  signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // print("Поля пустые");
    } else {
      
      var user = await authService.signIn(
          emailController.text, passwordController.text);
      
      if (user != null) {
        Navigator.popAndPushNamed(context, '/');
      } else {
        
      }
    }
  }
    @override
  Widget build(BuildContext context) {
    Widget authScreen = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Авторизация",
          textScaler: TextScaler.linear(3),
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelStyle: _labelStyle,
              labelText: 'e-mail',
              prefixIcon: Icon(Icons.email, color: _iconColor,),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: _iconColor)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff4080FD), width: 2,
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            obscureText: !visibility,
            controller: passwordController,
            decoration: InputDecoration(
              labelStyle: _labelStyle,
              labelText: 'пароль',
              // errorText: "пароль не менее 6 символов",
              
              prefixIcon: Icon(Icons.password, color: _iconColor,),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: visibility
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: _iconColor)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff4080FD), width: 2,
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color(0xff4080FD),
              ),
            ),
            onPressed: () => signIn(),
            child: const Text(
              "Войти",
              style: TextStyle(
                fontFamily: 'Trajan Pro',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  indent: 50,
                  endIndent: 20,
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
              Text('или'),
              Expanded(
                child: Divider(
                  endIndent: 50,
                  indent: 20,
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          child: const Text(
            'Регистрация',
            style: TextStyle(
              fontFamily: 'Trajan Pro',
              color: Color(0xff4080FD),
            ),
          ),
          onTap: () {
            setState(() {
              auth = !auth;
            });
          },
        ),
      ],
    );
    Widget regScreen = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Регистрация",
          textScaler: TextScaler.linear(3),
          style: TextStyle(
            fontFamily: 'Trajan Pro',
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
          onTap: () { setState(() {});},
          style: TextStyle(
              color: _textColor,
            ),
            
            focusNode: _focusNode,
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'имя',
              labelStyle: _labelStyle,
              
              prefixIcon:  Icon(Icons.person, color: _iconColor,),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: _iconColor,
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff4080FD), width: 2,
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            onTap: () { 
              setState(() {});},
            style: TextStyle(
              color: _textColor,
            ),
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'e-mail',
              labelStyle: _labelStyle,
              prefixIcon: Icon(Icons.email, color: _iconColor,),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: _iconColor,
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xff4080FD), width: 2,
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            obscureText: !visibility,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'пароль',
              labelStyle: _labelStyle,
              prefixIcon: Icon(Icons.password, color: _iconColor,),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: visibility
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:  BorderSide(
                  color: _iconColor)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                                    color: Color(0xff4080FD), width: 2,
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Color(0xff4080FD),
              ),
            ),
            onPressed: () => signUp(),
            child: const Text(
              "Зарегистрироваться",
              style: TextStyle(
                fontFamily: 'Trajan Pro',
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  indent: 50,
                  endIndent: 20,
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
              Text('или'),
              Expanded(
                child: Divider(
                  endIndent: 50,
                  indent: 20,
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        InkWell(
          child: const Text(
            'Авторизация',
            style: TextStyle(
              fontFamily: 'Trajan Pro',
              color: Color(0xff4080FD),
            ),
          ),
          onTap: () {
            setState(() {
              auth = !auth;
            });
          },
        ),
      ],
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 13, 71, 161),
      body: Image.asset(
        'images/screen.png',
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: auth ? authScreen : regScreen,
          );
        },
      ),
    );
  }
}



// // ignore_for_file: use_build_context_synchronously
// import 'package:cadenza/database/service.dart';
// import 'package:cadenza/database/users_collection.dart';
// import 'package:flutter/material.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   AuthService authService = AuthService();
//   UsersCollection usersCollection = UsersCollection();
//   bool visibility = false;
//   bool auth = true;

//   signUp() async {
//     if (emailController.text.isEmpty ||
//         passwordController.text.isEmpty ||
//         nameController.text.isEmpty) {
//       // print("Поля пустые");
//     } else {
//       var user = await authService.signUp(
//           emailController.text, passwordController.text);

//       if (user != null) {
//         await usersCollection.addUsersCollection(nameController.text,
//             emailController.text, passwordController.text, user.id.toString());

//         Navigator.popAndPushNamed(context, '/');
//       } else {
//         // print("Не зарягало");
//       }
//     }
//   }

//   signIn() async {
//     if (emailController.text.isEmpty || passwordController.text.isEmpty) {
//       // print("Поля пустые");
//     } else {
//       var user = await authService.signIn(
//           emailController.text, passwordController.text);

//       if (user != null) {
//         Navigator.popAndPushNamed(context, '/');
//       } else {
//         // print("Нет аккаунта");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget authScreen = Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "SIGN IN",
//           textScaler: TextScaler.linear(3),
//           style: TextStyle(
//             fontFamily: 'Trajan Pro',
//             fontWeight: FontWeight.bold,
//             color: Colors.black45,
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: TextField(
//             cursorColor: const Color(0xff4080FD),
//             controller: emailController,
//             decoration: InputDecoration(
//               labelStyle: const TextStyle(
//                   fontFamily: 'Trajan Pro', color: Color(0xff4080FD)),
//               labelText: 'Email',
//               prefixIcon: const Icon(Icons.email),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: TextField(
//             cursorColor: const Color(0xff4080FD),
//             obscureText: !visibility,
//             controller: passwordController,
//             decoration: InputDecoration(
//               labelStyle: const TextStyle(
//                 fontFamily: 'Trajan Pro',
//                 color: Color(0xff4080FD),
//               ),
//               labelText: 'Password',
//               prefixIcon: const Icon(Icons.password),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     visibility = !visibility;
//                   });
//                 },
//                 icon: visibility
//                     ? const Icon(Icons.visibility_off)
//                     : const Icon(Icons.visibility),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.7,
//           height: MediaQuery.of(context).size.height * 0.06,
//           child: ElevatedButton(
//             style: const ButtonStyle(
//               backgroundColor: WidgetStatePropertyAll(
//                 Color(0xff4080FD),
//               ),
//             ),
//             onPressed: () => signIn(),
//             child: const Text(
//               "Sign In",
//               style: TextStyle(
//                 fontFamily: 'Trajan Pro',
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         const SizedBox(
//           child: Row(
//             children: [
//               Expanded(
//                 child: Divider(
//                   indent: 50,
//                   endIndent: 20,
//                   thickness: 1,
//                   color: Colors.black26,
//                 ),
//               ),
//               Text('or'),
//               Expanded(
//                 child: Divider(
//                   endIndent: 50,
//                   indent: 20,
//                   thickness: 1,
//                   color: Colors.black26,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: const Text(
//             'Sign up',
//             style: TextStyle(
//               fontFamily: 'Trajan Pro',
//               color: Color(0xff4080FD),
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               auth = !auth;
//             });
//           },
//         ),
//       ],
//     );
//     Widget regScreen = Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "SIGN UP",
//           textScaler: TextScaler.linear(3),
//           style: TextStyle(
//             fontFamily: 'Trajan Pro',
//             fontWeight: FontWeight.bold,
//             color: Colors.black45,
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: TextField(
//             controller: nameController,
//             decoration: InputDecoration(
//               labelText: 'Name',
//               labelStyle: const TextStyle(fontFamily: 'Trajan Pro'),
//               prefixIcon: const Icon(Icons.person),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: TextField(
//             controller: emailController,
//             decoration: InputDecoration(
//               labelText: 'Email',
//               labelStyle: const TextStyle(fontFamily: 'Trajan Pro'),
//               prefixIcon: const Icon(Icons.email),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: TextField(
//             obscureText: !visibility,
//             controller: passwordController,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               labelStyle: const TextStyle(fontFamily: 'Trajan Pro'),
//               prefixIcon: const Icon(Icons.password),
//               suffixIcon: IconButton(
//                 onPressed: () {
//                   setState(() {
//                     visibility = !visibility;
//                   });
//                 },
//                 icon: visibility
//                     ? const Icon(Icons.visibility_off)
//                     : const Icon(Icons.visibility),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width * 0.7,
//           height: MediaQuery.of(context).size.height * 0.06,
//           child: ElevatedButton(
//             style: const ButtonStyle(
//               backgroundColor: WidgetStatePropertyAll(
//                 Color(0xff4080FD),
//               ),
//             ),
//             onPressed: () => signUp(),
//             child: const Text(
//               "Sign Up",
//               style: TextStyle(
//                 fontFamily: 'Trajan Pro',
//                 color: Colors.white,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.02,
//         ),
//         const SizedBox(
//           child: Row(
//             children: [
//               Expanded(
//                 child: Divider(
//                   indent: 50,
//                   endIndent: 20,
//                   thickness: 1,
//                   color: Colors.black26,
//                 ),
//               ),
//               Text('or'),
//               Expanded(
//                 child: Divider(
//                   endIndent: 50,
//                   indent: 20,
//                   thickness: 1,
//                   color: Colors.black26,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.01,
//         ),
//         InkWell(
//           child: const Text(
//             'Sign In',
//             style: TextStyle(
//               fontFamily: 'Trajan Pro',
//               color: Color(0xff4080FD),
//             ),
//           ),
//           onTap: () {
//             setState(() {
//               auth = !auth;
//             });
//           },
//         ),
//       ],
//     );
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 13, 71, 161),
//       body: Image.asset(
//         'images/screen.png',
//         width: MediaQuery.of(context).size.width,
//         fit: BoxFit.fill,
//       ),
//       bottomSheet: BottomSheet(
//         onClosing: () {},
//         builder: (context) {
//           return SizedBox(
//             height: MediaQuery.of(context).size.height * 0.8,
//             child: auth ? authScreen : regScreen,
//           );
//         },
//       ),
//     );
//   }
// }
