sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String message; // Memastikan ada 'message'

  RegisterFailure({
    required this.message,
  }); // Konstruktor untuk menerima 'message'
}
