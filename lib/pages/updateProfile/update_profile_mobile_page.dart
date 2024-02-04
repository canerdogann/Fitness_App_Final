import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:fitness_application/providers/providers.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateProfileMobilePage extends HookConsumerWidget {
  const UpdateProfileMobilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final PlatformFile image;
    Future pickImage() async {
      try {
        final result = await FilePicker.platform.pickFiles();
        if (result == null) return;
        image = result.files.first;
        return image;
      } on PlatformException catch (e) {
        log('Failed to pick image: $e');
      }
    }

    final displayName = ref.watch(displayNameController);
    final phoneNumber = ref.watch(phoneNumberController);
    final githubUrl = ref.watch(githubUrlController);
    final linkedInUrl = ref.watch(linkedInController);
    final weight = ref.watch(weightController);
    final height = ref.watch(heightController);
    final profession = ref.watch(professionController);

    final auth = ref.watch(authService);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "Update Profile",
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "PROFILE PHOTO:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                MaterialButton(
                  color: Colors.blue,
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    pickImage();
                  },
                ),
                const SizedBox(height: 15),
                Text(
                  "NAME:",
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
                    controller: displayName,
                    decoration: InputDecoration(
                      hintText: "Enter Your Display Name...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "PHONE NUMBER:",
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
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      hintText: "Enter Your Phone Number...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "GITHUB URL:",
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
                    controller: githubUrl,
                    decoration: InputDecoration(
                      hintText: "Enter Your Github Url...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "LINKEDIN URL:",
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
                    controller: linkedInUrl,
                    decoration: InputDecoration(
                      hintText: "Enter Your LinkedIn Url...",
                      hintStyle: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ),
                Text(
                  "KG:",
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
                    controller: weight,
                    decoration: InputDecoration(
                      hintText: "Enter Your Weight...",
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
                  "BOY:",
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
                    controller: height,
                    decoration: InputDecoration(
                      hintText: "Enter Your Height...",
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
                  "PROFESSION:",
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
                    controller: profession,
                    decoration: InputDecoration(
                      hintText: "Enter Your Profession...",
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
                        final navigator = Navigator.of(context);
                        final imageUrl =
                            await auth.uploadImage(pickedFile: image);
                        await auth.updateUserName(
                            userDisplayName: displayName.text);
                        await auth.updateProfile(
                          imageUrl: imageUrl,
                          height: height.text,
                          profession: profession.text,
                          userDisplayName: displayName.text,
                          weight: weight.text,
                          githubUrl: githubUrl.text,
                          linkedInUrl: linkedInUrl.text,
                          phone: phoneNumber.text,
                        );
                        navigator.pushNamedAndRemoveUntil(
                          '/profile',
                          (_) => false,
                        );
                      },
                      child: Text(
                        "Save",
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
