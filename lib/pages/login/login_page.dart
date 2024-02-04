import 'package:fitness_application/pages/login/login_desktop_page.dart';
import 'package:fitness_application/pages/login/login_mobile_page.dart';
import 'package:fitness_application/pages/login/login_tablet_page.dart';
import 'package:fitness_application/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveWidget(
      mobile: LoginMobilePage(),
      tablet: LoginTabletPage(),
      desktop: LoginDesktopPage(),
    );
  }
}
