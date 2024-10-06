// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/surah_list_page.dart';
import 'screens/profile_page.dart';
import 'screens/grid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Al-Quran',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Al-Quran'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Surah List', icon: Icon(Icons.book)),
            Tab(text: 'Grid', icon: Icon(Icons.grid_view)),
            Tab(text: 'Profile', icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          SurahListPage(), // Pastikan tidak ada lagi parameter di sini
          GridPage(), // Sesuaikan ini jika ada data
          ProfilePage(),
        ],
      ),
    );
  }
}
