import 'package:flutter/material.dart' show BuildContext;
import 'package:bolc_firebase_login_apk/auth/auth_error.dart';
import 'package:bolc_firebase_login_apk/dialogs/generic_dialog.dart';

Future<void> showAuthError({
  required AuthError authError,
  required BuildContext context,
}) {
  return showGenericDialog<void>(
    context: context,
    title: authError.dialogTitle,
    content: authError.dialogText,
    optionsBuilder: () => {
      'OK': true,
    },
  );
}
