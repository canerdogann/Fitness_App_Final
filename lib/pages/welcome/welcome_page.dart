import 'dart:developer';

import 'package:fitness_application/pages/welcome/welcome_mobile_page.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:fitness_application/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authService);
    useEffect(() {
      // useEffect içinde async fonksiyon kullanmak için kendi asenkron fonksiyonumuzu tanımlıyoruz
      final navigator = Navigator.of(context);
      Future<void> fetchData() async {
        try {
          auth.authState.listen((user) {
            if (user != null) {
              //User varsa anasayfaya yolluyoruz.
              navigator.pushNamedAndRemoveUntil(
                '/home',
                (_) => false,
              );
            }
          });
        } catch (error) {
          log('User bulunamadı. Hata: $error');
        }
      }

      fetchData();
      return () {};
    }, []);
    return const ResponsiveWidget(
      mobile: WelcomeMobilePage(),
      tablet: WelcomeMobilePage(),
      desktop: WelcomeMobilePage(),
    );
  }
}
