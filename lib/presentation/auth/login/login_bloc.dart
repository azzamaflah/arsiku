import 'package:arsiku/presentation/auth/login/login_event.dart';
import 'package:arsiku/presentation/auth/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arsiku/data/repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await authRepository.login(event.requestModel);

    result.fold(
      (l) {
        emit(LoginFailure(error: l));
      },
      (r) {
        // Debugging output untuk melihat role
        print('Role user: ${r.user?.role}');
        emit(LoginSuccess(responseModel: r)); // Kirimkan objek r langsung
      },
    );
  }
}
