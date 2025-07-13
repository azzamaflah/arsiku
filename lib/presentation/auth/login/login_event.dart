import 'package:arsiku/data/model/request/auth/login.request.dart';

sealed class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginRequest requestModel;

  LoginSubmitted({required this.requestModel});
}
