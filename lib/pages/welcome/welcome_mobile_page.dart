import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeMobilePage extends StatelessWidget {
  const WelcomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/appicon.jpg"),
              const Divider(),
              Text(
                "Fitness Support",
                style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 10),
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.login_rounded,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Login",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                      Colors.black,
                    )),
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_box,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Register",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
