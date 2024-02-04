import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  final String image;
  final String text;
  final String text2;
  final String text3;
  final String text4;
  final String? text5;
  const MenuItem({
    super.key,
    required this.image,
    required this.text,
    required this.text2,
    required this.text3,
    required this.text4,
    this.text5,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
            width: 240,
            height: text5 != null ? 540 : 400,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 148, 155, 161),
                      Color.fromARGB(255, 119, 119, 119),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        text,
                        style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 40,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        text2,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        text3,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        text4,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      text5 != null
                          ? ElevatedButton(
                              onPressed: () => {},
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 0, 0, 0))),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(width: 16),
                                        Text(
                                          text5!,
                                          style: GoogleFonts.rubik(
                                            textStyle: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: 20,
                                            ),
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            )));
  }
}
