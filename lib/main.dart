import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arsiku/presentation/auth/widget/login_screen.dart';
import 'package:arsiku/presentation/auth/login/login_bloc.dart';
import 'package:arsiku/presentation/auth/register/register_bloc.dart';
import 'package:arsiku/data/repository/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(authRepository: AuthRepository()),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Arsiku App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
