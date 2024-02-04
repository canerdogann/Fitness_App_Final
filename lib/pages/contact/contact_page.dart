import 'package:fitness_application/providers/providers.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:fitness_application/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends HookConsumerWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Contact Information",
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
          child: ref.watch(profileImageProvider).when(
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
              data: (userInfo) {
                final githubUrl = Uri.parse(userInfo['githubUrl'] ?? 'None');
                final linkedInUrl =
                    Uri.parse(userInfo['linkedInUrl'] ?? 'None');
                final emailUrl = Uri(scheme: 'mailto', path: auth.user!.email);
                final phone = Uri(scheme: 'tel', path: userInfo['phone'] ?? '');
                return Column(
                  children: [
                    const Divider(),
                    ProfileItem(
                      name:
                          "Username: ${userInfo['userDisplayName'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {},
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "Email: ${auth.user!.email}",
                      avatar: const Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {
                        if (emailUrl.path != 'None') {
                          launchUrl(emailUrl,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "URL:${userInfo['linkedInUrl'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.link,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {
                        if (linkedInUrl.path != 'None') {
                          launchUrl(linkedInUrl,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "URL: ${userInfo['githubUrl'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.link,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {
                        if (linkedInUrl.path != 'None') {
                          launchUrl(githubUrl,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                    const Divider(),
                    ProfileItem(
                      name: "${userInfo['phone'] ?? 'None'}",
                      avatar: const Icon(
                        Icons.call,
                        color: Color.fromARGB(255, 255, 91, 91),
                      ),
                      onTap: () {
                        if (phone.path != 'None') {
                          launchUrl(phone,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                    ),
                    const Divider(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
