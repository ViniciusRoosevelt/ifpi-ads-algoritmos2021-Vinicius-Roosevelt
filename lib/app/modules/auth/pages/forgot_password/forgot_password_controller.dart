import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ForgotPasswordController implements Disposable {
  final _enableButton = RxNotifier<bool>(false);

  bool get enableButton => _enableButton.value;
  set enableButton(bool value) => _enableButton.value = value;

  final _email = RxNotifier<String>('');

  String get email => _email.value;
  set email(String value) => _email.value = value;

  bool emailIsValid() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  void enableRecoverPassword() {
    if (emailIsValid()) {
      enableButton = true;
    } else {
      enableButton = false;
    }
  }

  @override
  void dispose() {}
}
