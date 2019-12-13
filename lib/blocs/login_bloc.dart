import 'package:flutter_store/validators/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get outEmail => _email.stream.transform(emailValidator);

  Stream<String> get outPassword  => _password.stream.transform(passowrdValidator);

  Function(String) get inEmail => _email.add;

  Function(String) get inPassword => _password.add;

  Stream<bool> get validator => Observable.combineLatest([outEmail,outPassword], (_) => true);

  void validateFields() {
    if(_email.value == null) _email.add("");
    if(_password.value == null) _password.add("");
  }

  void signIn() {
    print("logou!");
  }

  void dispose() {
    _email.close();
    _password.close();
  }
}