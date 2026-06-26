import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/navigation_provider.dart';
import '../providers/theme_provider.dart';
import 'add_subject_screen.dart';
import 'subject_list_screen.dart';
import 'summary_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final _pages = <Widget>[
    AddSubjectScreen(),
    const SubjectListScreen(),
    const SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Student Grade Tracker'),
            actions: [
              IconButton(
                icon: Icon(
                  context.watch<ThemeProvider>().isDarkMode
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeProvider>().toggleTheme();
                },
                tooltip: 'Toggle theme',
              ),
            ],
          ),
          body: _pages[navProvider.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navProvider.currentIndex,
            onDestinationSelected: navProvider.setIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.add_circle_outline),
                selectedIcon: Icon(Icons.add_circle),
                label: 'Add Subject',
              ),
              NavigationDestination(
                icon: Icon(Icons.list_alt_outlined),
                selectedIcon: Icon(Icons.list_alt),
                label: 'Subject List',
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: 'Summary',
              ),
            ],
          ),
        );
      },
    );
  }
}
