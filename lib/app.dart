// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'features/sign_in/sign_in_page.dart';
import 'features/sign_up/sign_up_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Firebase Exemplo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Login Firebase'),
              Tab(text: 'Cadastro Firebase'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [SignInPage(), SignUpPage()],
        ),
      ),
    );
  }
}
