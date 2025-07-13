import 'package:arsiku/data/model/request/auth/register.request.dart';

// Sealed class RegisterEvent
sealed class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final RegisterRequestModel requestModel;

  RegisterSubmitted({required this.requestModel});
}
