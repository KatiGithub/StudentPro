import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';
import 'package:studio_projects/views/main/home/home_screen.dart';

import 'home/home_state.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = <Widget>[
    BlocProvider(
        create: (create) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return HomeScreen();
          },
        ))
  ];

  int pageCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
        child: pages[pageCount],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    pageCount = 0;
                  });
                },
                icon: const Icon(Icons.home))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("StudentPro"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
