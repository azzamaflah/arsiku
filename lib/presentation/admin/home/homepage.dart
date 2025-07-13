import 'package:arsiku/presentation/admin/konsultan/widget/konsultan_ListScreen.dart';
import 'package:flutter/material.dart';
import 'package:arsiku/presentation/admin/konsultan/widget/konsultan_form.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _selectedIndex = 0;

  // Halaman yang dipilih berdasarkan tab
  List<Widget> _pages = [
    // Halaman utama Admin
    // Bisa menambahkan konten utama di sini
    const Center(child: Text("Dashboard Admin")),

    // Halaman Spesialis
    const KonsultanListScreen(), // Menampilkan daftar konsultan yang ditambahkan
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Admin')),
      body: _pages[_selectedIndex], // Menampilkan halaman yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Spesialis',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KonsultanForm()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
