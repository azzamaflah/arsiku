import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/addKonsultan',
            ); // Navigasi ke form tambah konsultan
          },
          child: const Text('Tambah Konsultan'),
        ),
      ),
    );
  }
}
