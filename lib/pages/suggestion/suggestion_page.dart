import 'package:fitness_application/pages/suggestion/suggestion_desktop_page.dart';
import 'package:fitness_application/pages/suggestion/suggestion_mobile_page.dart';
import 'package:fitness_application/pages/suggestion/suggestion_tablet_page.dart';
import 'package:fitness_application/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: SuggestionMobilePage(),
      tablet: SuggestionTabletPage(),
      desktop: SuggestionDesktopPage(),
    );
  }
}
