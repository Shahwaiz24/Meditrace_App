import 'package:flutter/material.dart';
import 'package:meditrace_project/Views/Home%20View/home_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeViewmodel>(context, listen: false);

    return Consumer<HomeViewmodel>(builder: (context, model, child) {
      return BottomNavigationBar(
        currentIndex: model.selectedBottomBarIndex,
        onTap: (index) {
          model.onBottomBarSelected(index: index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal, // Highlight color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        showSelectedLabels: false, // Hides labels
        showUnselectedLabels: false, // Hides labels
        items: [
          BottomNavigationBarItem(
            tooltip: '',
            icon: model.selectedBottomBarIndex == 0
                ? ImageIcon(
                    AssetImage('assets/icon/bottom_bar_icon/home_active.png'))
                : Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy), // Pill icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      );
    });
  }
}
