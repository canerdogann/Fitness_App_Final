import 'package:fitness_application/providers/providers.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:fitness_application/widgets/menu_item.dart';
import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService); // Kimlik doğrulama
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(250, 0, 0, 0),
        title: Text(
          "Fitness Support",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          children: [
            ref.watch(profileImageProvider).when(
                  error: (error, stackTrace) => const SizedBox(),
                  loading: () => const CircularProgressIndicator(),
                  data: (userInfo) {
                    final image = userInfo['imageUrl'];
                    return ProfileItem(
                      avatar: CircleAvatar(
                        radius: 40,
                        backgroundImage: image != null
                            ? NetworkImage(image)
                            : const AssetImage("assets/images/appicon.jpg")
                                as ImageProvider,
                      ),
                      name: userInfo['userDisplayName'] ?? 'None',
                      onTap: () => Navigator.pushNamed(context, "/profile"),
                    );
                  },
                ),
            Column(
              children: [
                const SizedBox(height: 10),
                ProfileItem(
                  name: "Home Screen",
                  avatar: const Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {},
                ),
                const SizedBox(height: 10),
                ProfileItem(
                  name: "Workouts Plan",
                  avatar: const Icon(
                    Icons.fitness_center_outlined,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/workout");
                  },
                ),
                const SizedBox(height: 10),
                ProfileItem(
                  name: "Contact Information",
                  avatar: const Icon(
                    Icons.perm_contact_cal,
                    color: Color.fromARGB(255, 255, 91, 91),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/contact");
                  },
                ),
                const SizedBox(height: 10),
                ProfileItem(
                  name: "Settings",
                  avatar: const Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                ),
                const SizedBox(height: 10),
                ProfileItem(
                  name: "Logout",
                  avatar: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    final navigator = Navigator.of(context);
                    await auth.logout();
                    navigator.pushNamedAndRemoveUntil(
                        "/welcome", (route) => false);
                  },
                ),
                const Divider(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ProfileItem(
              name: "Version 4.4.4",
              avatar: const Icon(
                Icons.bolt,
                color: Colors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 148, 155, 161),
          Color.fromARGB(255, 208, 90, 90),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    auth.user?.displayName ?? 'None',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "Lets Workout!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 148, 155, 161),
                      Color.fromARGB(255, 208, 90, 90),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                          searchBox(),
                          result("Result", "See more"),
                          plan("Sports Nutrition Plan", "See more"),
                          nutritionItem(),
                          plan("Health and Nutrition", "See more"),
                          shopItem(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget nutritionItem() {
    return const Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MenuItem(
                image: "assets/images/beslenme.jpg",
                text: "Monday",
                text2: "Breakfast: Oatmeal, milk, various vegetables, omelet",
                text3: "Lunch: Meatballs, various vegetables, walnuts",
                text4:
                    "Dinner: Grilled chicken, bulgur pilaf, various vegetables",
              ),
              MenuItem(
                image: "assets/images/beslenme.jpg",
                text: "Tuesday",
                text2: "Breakfast: Eggs, oatmeal, various vegetables",
                text3: "Lunch: Grilled chicken, milk, almonds",
                text4: "Dinner: Pasta, grilled steak, various vegetables",
              ),
              MenuItem(
                  image: "assets/images/beslenme.jpg",
                  text: "Wednesday",
                  text2: "Breakfast: Sweet potatoes, apples, cheese",
                  text3: "Lunch: Grilled salmon, various vegetables",
                  text4: "Dinner: Steak, various vegetables"),
              MenuItem(
                  image: "assets/images/beslenme.jpg",
                  text: "Thursday",
                  text2: "Breakfast: Vegetable omelette, milk",
                  text3: "Lunch: Chicken breast, rice pilaf",
                  text4: "Dinner: Sauteed meat, pasta, 1 orange"),
              MenuItem(
                  image: "assets/images/beslenme.jpg",
                  text: "Friday",
                  text2: "Breakfast: Salad with olive oil, cheese, oats",
                  text3: "Lunch: Grilled chicken, rice pilaf",
                  text4:
                      "Dinner: Dark chocolate, grilled meatballs, various vegetables"),
            ],
          ),
        ),
      ],
    );
  }

  Widget shopItem() {
    return const Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MenuItem(
                  image: "assets/images/shop.jpg",
                  text: "HARDLINE NUTRITION",
                  text2: "Hardline Pro Gainer",
                  text3: "Carbohydrate Powder - Chocolate -",
                  text4: "5Kg",
                  text5: "46.99 USD"),
              MenuItem(
                  image: "assets/images/shop2.jpeg",
                  text: "HARDLINE NUTRITION",
                  text2: "Hardline Whey 3",
                  text3: "3 Matrix Protein Powder - Strawberry -",
                  text4: "2.3 Kg",
                  text5: "61.99 USD"),
              MenuItem(
                  image: "assets/images/shop3.jpg",
                  text: "HARDLINE NUTRITION",
                  text2: "Hardline BCAA Special for All Athletes ",
                  text3: " Fusion - Apple -",
                  text4: "525 Gr",
                  text5: "19.99 USD"),
              MenuItem(
                  image: "assets/images/shop4.jpeg",
                  text: "HARDLINE NUTRITION",
                  text2: "Hardline Creatine",
                  text3: "100% Micronized - Unflavored - ",
                  text4: "300 Gr",
                  text5: "19.99 USD"),
            ],
          ),
        ),
      ],
    );
  }

  Widget searchBox() {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(190, 48, 48, 48),
        border: Border.all(
          color: const Color.fromARGB(15, 170, 170, 170),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                size: 17,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget result(
    text,
    text2,
  ) =>
      Column(
        children: [
          titleItem(
            text,
            text2,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                sonucItem("2500", "Kcal"),
                sonucItem("12", "Hour"),
                sonucItem("1450", "Kg"),
              ],
            ),
          ),
        ],
      );

  Widget plan(
    text,
    text2,
  ) =>
      Column(
        children: [
          titleItem(text, text2),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [],
            ),
          ),
        ],
      );

  Padding titleItem(String title, String link) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 16,
            ),
          ),
          Text(
            link,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 91, 91),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget sonucItem(
    String text,
    text2,
  ) {
    return Container(
      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 20),
      margin: const EdgeInsets.only(left: 10, right: 10),
      width: 110,
      decoration: BoxDecoration(
        color: const Color.fromARGB(189, 65, 64, 64),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(37, 255, 255, 255),
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Color.fromARGB(255, 255, 91, 91),
          ),
          Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              color: Color.fromARGB(255, 119, 119, 119),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
