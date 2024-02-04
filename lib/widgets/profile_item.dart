import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final Function()? onTap;
  final Widget avatar;
  final String name;

  const ProfileItem({
    super.key,
    this.onTap,
    required this.avatar,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 150, 149, 149),
            Color.fromARGB(255, 245, 114, 114),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(143, 255, 255, 255),
                ),
                child: avatar,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
