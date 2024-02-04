import 'package:fitness_application/providers/providers.dart';
import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ref.watch(profileImageProvider).when(
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
              data: (userInfo) {
                final image = userInfo['imageUrl'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileItem(
                      avatar: CircleAvatar(
                        radius: 40,
                        backgroundImage: image != null
                            ? NetworkImage(image)
                            : const AssetImage("assets/images/appicon.jpg")
                                as ImageProvider,
                      ),
                      name: userInfo['userDisplayName'] ?? 'None',
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "KG: ${userInfo['weight'] ?? 'None'}",
                      avatar: const Icon(
                        color: Color.fromARGB(255, 255, 91, 91),
                        Icons.monitor_weight,
                      ),
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "BOY: ${userInfo['height'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.straighten_outlined,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "${userInfo['profession'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.sports_gymnastics_outlined,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {},
                    ),
                    const Divider(),
                    const SizedBox(height: 30),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile-update');
                          },
                          child: Text(
                            "Update Profile",
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
                );
              },
            ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
              Colors.black,
            )),
            onPressed: () => Navigator.pushNamed(context, '/home'),
            child: Row(
              children: [
                const Icon(
                  Icons.undo_outlined,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Go Back",
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
    );
  }
}
