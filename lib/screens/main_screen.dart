import 'package:downloader_app/const/app_colors.dart';
import 'package:downloader_app/widgets/bottom_navigation.dart';
import 'package:downloader_app/widgets/history/history_widget.dart';
import 'package:downloader_app/widgets/home/home_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPage = 0;
  final _pages = [
    const HomeWidget(),
    const HistoryWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _setPage(int currentPage) {
    setState(() {
      _selectedPage = currentPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          title: RichText(
              text: TextSpan(children: <TextSpan>[
            TextSpan(
              text: "Tiktok",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: GoogleFonts.outfit().fontFamily,
              ),
            ),
            TextSpan(
              text: "Save",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 20.0,
                fontFamily: GoogleFonts.outfit().fontFamily,
              ),
            ),
          ]))),
      body: IndexedStack(
        index: _selectedPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigation(
        setPage: _setPage,
      ),
    );
  }
}
