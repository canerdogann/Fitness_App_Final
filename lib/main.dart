import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_application/pages/contact/contact_page.dart';
import 'package:fitness_application/pages/home/home_page.dart';
import 'package:fitness_application/pages/language/language_page.dart';
import 'package:fitness_application/pages/login/login_page.dart';
import 'package:fitness_application/pages/profile/profile_page.dart';
import 'package:fitness_application/pages/register/register_page.dart';
import 'package:fitness_application/pages/settings/settings_page.dart';
import 'package:fitness_application/pages/suggestion/suggestion_page.dart';
import 'package:fitness_application/pages/updateProfile/update_profile_page.dart';
import 'package:fitness_application/pages/welcome/welcome_page.dart';
import 'package:fitness_application/pages/workout/workout_page.dart';
import 'package:fitness_application/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Widget'ların yüklenmesini bekle dediğimiz kısım
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Firebase'in yüklenmesini bekle dediğimiz kısım
  final sharedPref = await SharedPreferences.getInstance();
  //SharedPreferences için oluşturduğumuz instance
  final container = ProviderContainer(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPref),
  ]);
  //Provider için oluşturduğumuz container
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
    //Provider'larımızın tüm uygulamayı kapsaması için kullandığımız bir sistem
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (_) => const HomePage(),
        '/welcome': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterPage(),
        '/profile': (_) => const ProfilePage(),
        '/profile-update': (_) => const UpdateProfilePage(),
        '/settings': (_) => const SettingPage(),
        '/language': (_) => const LanguagePage(),
        '/suggestion': (_) => const SuggestionPage(),
        '/contact': (_) => const ContactPage(),
        '/workout': (_) => const WorkoutPage(),
      },
      initialRoute: '/welcome',
    );
  }
}
