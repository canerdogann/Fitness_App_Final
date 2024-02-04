import 'package:fitness_application/providers/providers.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterMobilePage extends HookConsumerWidget {
  const RegisterMobilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);
    final email = ref.watch(emailController);
    final password = ref.watch(passwordController);
    final password2 = ref.watch(passwordController2);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Register",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Create Email:",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: email,
                    expands: false,
                    decoration: InputDecoration(
                      hintText: "Enter Your Email...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Create Password:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Verify Your Password:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: password2,
                    decoration: InputDecoration(
                      hintText: "Enter Your Password...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 10)),
                      ),
                      onPressed: () async {
                        if (password.text == password2.text) {
                          final navigator = Navigator.of(context);
                          await auth.register(
                            email: email.text,
                            password: password.text,
                          );
                          navigator.pushNamedAndRemoveUntil(
                              '/welcome', (Route<dynamic> route) => false);
                        } else {
                          //Şifreler uyuşmuyor mesajı gönder
                        }
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
