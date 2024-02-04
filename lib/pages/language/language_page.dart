import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Language",
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
        child: Center(
          child: Column(
            children: [
              ProfileItem(
                name: "English",
                avatar: const Icon(
                  Icons.check_box,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              ProfileItem(
                name: "Turkish",
                avatar: const Icon(
                  Icons.check_box_outline_blank,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              ProfileItem(
                name: "German",
                avatar: const Icon(
                  Icons.check_box_outline_blank,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 10)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Go Back",
          style: GoogleFonts.nunitoSans(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
