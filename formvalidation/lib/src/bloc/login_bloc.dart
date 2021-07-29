import 'dart:async';
import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //recuperar los datos del stream
  Stream<String> get emailStream    => _emailController.stream.transform(validatorEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatorPassword);

  Stream<bool> get formValidateStrem =>
    Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  //insertar los valores del stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //obtener el ultimo valor ingresado en los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}