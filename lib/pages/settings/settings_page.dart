import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Settings",
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
                name: "Notifications",
                avatar: const Icon(
                  Icons.check_box,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              ProfileItem(
                name: "Notify me of offers",
                avatar: const Icon(
                  Icons.check_box_outline_blank,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 20),
              ProfileItem(
                name: "Two-step verification",
                avatar: const Icon(
                  Icons.check_box,
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 363,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                )),
                onPressed: () => Navigator.pushNamed(context, '/language'),
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Language",
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
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                )),
                onPressed: () => Navigator.pushNamed(context, '/suggestion'),
                child: Row(
                  children: [
                    const Icon(
                      Icons.emoji_people_rounded,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "I have a suggestion",
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
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.black,
                )),
                onPressed: () =>
                    Navigator.pushNamed(context, '/profile-update'),
                child: Row(
                  children: [
                    const Icon(
                      Icons.manage_accounts,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Change my information",
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
        ),
      ),
    );
  }
}
