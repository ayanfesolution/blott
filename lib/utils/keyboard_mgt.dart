

import 'package:flutter/material.dart';

class KeyboardMgt {
  hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  nextFocus(FocusNode focusNode, BuildContext context) {
    FocusScope.of(context).nextFocus();
  }
}