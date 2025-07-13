import 'package:arsiku/data/model/request/auth/register.request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arsiku/presentation/auth/register/register_bloc.dart';
import 'package:arsiku/presentation/auth/register/register_event.dart';
import 'package:arsiku/presentation/auth/register/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate()) {
      // Dispatch the RegisterSubmitted event to Bloc with name, email, and password
      context.read<RegisterBloc>().add(
        RegisterSubmitted(
          requestModel: RegisterRequestModel(
            nama: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            // Handle success and error states
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pop(context); // Go back to login screen after success
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Form(
                key: _formKey, // Attach form key for validation
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        "Ayo daftarkan dirimu di\nBangunID!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Name input field with validation
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Nama",
                        filled: true,
                        fillColor: const Color(0xFFFDF6E9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Email input field with validation
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        fillColor: const Color(0xFFFDF6E9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email harus diisi';
                        }
                        // Simple email format validation
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Email tidak valid';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password input field with validation
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: const Color(0xFFFDF6E9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password harus diisi';
                        }
                        if (value.length < 6) {
                          return 'Password harus lebih dari 6 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    // Register button
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed:
                            state is RegisterLoading
                                ? null
                                : _onRegisterPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:
                            state is RegisterLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
                                  "Daftar",
                                  style: TextStyle(fontSize: 16),
                                ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        "Lanjutkan dengan",
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Social media icons for login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSocialIcon("assets/icons/google.png"),
                        const SizedBox(width: 16),
                        _buildSocialIcon("assets/icons/facebook.png"),
                        const SizedBox(width: 16),
                        _buildSocialIcon("assets/icons/apple.png"),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(assetPath, height: 24, width: 24),
    );
  }
}
