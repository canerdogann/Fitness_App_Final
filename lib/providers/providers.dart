import 'package:fitness_application/extensions/text_editing_extension.dart';
import 'package:fitness_application/services/auth_service.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final emailController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final passwordController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final passwordController2 = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final suggestionController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final displayNameController =
    Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final phoneNumberController =
    Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final githubUrlController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final linkedInController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final weightController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final heightController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});
final professionController = Provider.autoDispose<TextEditingController>((ref) {
  return ref.useTextEditingController();
});

/*
 Buraya kadar olanlar her bir textField alanı için açtığımız provider'lardı
 */

final profileImageProvider = FutureProvider((ref) async {
  return ref.read(authService).getUser();
}); //Resimleri yüklemek için bir Future Provider

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
}); //SharedPreferences'ın instance'ı için oluşturduğumuz bir provider

final suggestionProvider =
    NotifierProvider<SuggestionNotifier, List<String>>(SuggestionNotifier.new);

//Yapılan önerileri tutup güncellemek için oluşturduğumuz provider altta da bunu dinleyen notifier var
class SuggestionNotifier extends Notifier<List<String>> {
  final storageKey = 'suggestions';

  late final prefs = ref.read(sharedPreferencesProvider);

  @override
  List<String> build() =>
      prefs.getStringList(storageKey) ?? []; //Default değeri atıyoruz

  @override
  set state(List<String> value) {
    super.state = value;
    prefs.setStringList(
        storageKey, value); //Yeni değer varsa güncelleme işlemini yapıyoruz
  }

  void add(String value) => state = [...state, value]; //Yeni öneriyi ekle
  void remove(String value) =>
      state = state.toList()..remove(value); //Öneriyi sil
}
