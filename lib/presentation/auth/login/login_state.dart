import 'package:arsiku/data/model/respone/auth.respone.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final AuthResponseModel responseModel;

  LoginSuccess({required this.responseModel});
}

final class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  // Menambahkan getter untuk message
  String get message => error; // Untuk mengakses error sebagai message
}
