import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Workouts Plan",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset("assets/images/gogusantrenmani.jpg",
                    cacheHeight: 350, cacheWidth: 550),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                const SizedBox(height: 3),
                textItem("Monday"),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                textItem2("Chest Exercises"),
                ProfileItem(
                  name: "Incline Bench Press",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Incline Dumbell Press",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Crossover",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Dips",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                Image.asset("assets/images/omuzantrenmanı.jpg",
                    cacheHeight: 350, cacheWidth: 550),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                const SizedBox(height: 3),
                textItem("Tuesday"),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                textItem2("Shoulder Exercises"),
                ProfileItem(
                  name: "Over Head Press",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Lateral Raise",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Reverse Fly",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                Image.asset("assets/images/sırtantrenmanı.jpg",
                    cacheHeight: 350, cacheWidth: 550),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                const SizedBox(height: 3),
                textItem("Wednesday"),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                textItem2("Back Exercises"),
                ProfileItem(
                  name: "Seated Row",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Barbel Row",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Lat Pulldown",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "One Hand Lat Pulldown",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                Image.asset("assets/images/kolantrenmanı.jpg",
                    cacheHeight: 350, cacheWidth: 550),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                const SizedBox(height: 3),
                textItem("Thursday"),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                textItem2("Arm Exercises"),
                ProfileItem(
                  name: "Dumbell Curls",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Hammer Curls",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Scout Curl",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                Image.asset("assets/images/arkakolantrenmanı.jpg",
                    cacheHeight: 350, cacheWidth: 550),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                const SizedBox(height: 3),
                textItem("Friday"),
                const Divider(
                  color: Color.fromARGB(255, 255, 91, 91),
                ),
                textItem2("triceps exercises"),
                ProfileItem(
                  name: "Triceps Pushdown",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 20),
                ProfileItem(
                  name: "Skullcrusher",
                  avatar: const Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textItem(
    String text,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.archivoBlack(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}

Widget textItem2(
  String text,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: GoogleFonts.bebasNeue(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    ],
  );
}
