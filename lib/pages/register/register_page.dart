import 'package:fitness_application/pages/register/register_desktop_page.dart';
import 'package:fitness_application/pages/register/register_mobile_page.dart';
import 'package:fitness_application/pages/register/register_tablet_page.dart';
import 'package:fitness_application/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ResponsiveWidget(
      mobile: RegisterMobilePage(),
      tablet: RegisterTabletPage(),
      desktop: RegisterDesktopPage(),
    );
  }
}
