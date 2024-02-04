import 'package:fitness_application/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SuggestionTabletPage extends HookConsumerWidget {
  const SuggestionTabletPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestion = ref.watch(suggestionController);
    final notifier = ref.read(suggestionProvider.notifier);
    final suggestions = ref.watch(suggestionProvider);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Text(
          "I have a suggestion",
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Your suggestion:",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  padding: const EdgeInsets.all(50),
                  width: 350,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(),
                  ),
                  child: TextField(
                    controller: suggestion,
                    decoration: InputDecoration(
                      hintText: "Write your suggestion",
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
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        Colors.white,
                      )),
                      onPressed: () {
                        notifier.add(suggestion.text);
                        suggestion.clear();
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Send",
                            style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Submitted Suggestions",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              suggestions[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => notifier.remove(suggestion.text),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 10)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Go Back",
          style: GoogleFonts.nunitoSans(
            textStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
