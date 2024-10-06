// lib/widgets/tabbar_menu.dart

import 'package:flutter/material.dart';

class TabBarMenu extends StatelessWidget {
  const TabBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Surah'),
              Tab(text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Page')),
            Center(child: Text('Surah Page')),
            Center(child: Text('Profile Page')),
          ],
        ),
      ),
    );
  }
}
