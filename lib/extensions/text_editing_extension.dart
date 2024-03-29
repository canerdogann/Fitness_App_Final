import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension EditController on AutoDisposeRef {
  TextEditingController useTextEditingController() {
    final controller = TextEditingController();
    onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}
//Textfield lar için kullandığımız kendini otomatik bir şekilde dispose eden extension