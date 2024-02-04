import 'package:fitness_application/pages/updateProfile/update_profile_desktop_page.dart';
import 'package:fitness_application/pages/updateProfile/update_profile_mobile_page.dart';
import 'package:fitness_application/pages/updateProfile/update_profile_tablet_page.dart';
import 'package:fitness_application/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      mobile: UpdateProfileMobilePage(),
      tablet: UpdateProfileTabletPage(),
      desktop: UpdateProfileDesktopPage(),
    );
  }
}
