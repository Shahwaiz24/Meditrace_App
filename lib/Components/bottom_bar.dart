import 'package:flutter/material.dart';
import 'package:meditrace_project/Services/utils.dart';
import 'package:meditrace_project/Views/Home%20View/home_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {Key? key, required this.screenHeight, required this.screenWidth})
      : super(key: key);
  final double screenHeight;
  final double screenWidth;

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
          model.onBottomBarSelected(index: index, context: context);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.PrimaryBlueColor,
        unselectedItemColor:
            AppColors.unFocusPrimaryColor, // Color for unselected items
        showSelectedLabels: false, // Hides labels
        showUnselectedLabels: false, // Hides labels
        items: [
          BottomNavigationBarItem(
            icon: model.selectedBottomBarIndex == 0
                ? ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/home_active.png'),
                    size: widget.screenHeight * 0.040,
                  )
                : ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/home.png'),
                    size: widget.screenHeight * 0.040,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: model.selectedBottomBarIndex == 1
                ? ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/medical_bag_active.png'),
                    size: widget.screenHeight * 0.040,
                  )
                : ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/medical_bag.png'),
                    size: widget.screenHeight * 0.040,
                  ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: model.selectedBottomBarIndex == 2
                ? ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/medicine_active.png'),
                    size: widget.screenHeight * 0.040,
                  )
                : ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/medicine.png'),
                    size: widget.screenHeight * 0.040,
                  ), // Pill icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: model.selectedBottomBarIndex == 3
                ? ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/profile_active.png'),
                    size: widget.screenHeight * 0.040,
                  )
                : ImageIcon(
                    const AssetImage(
                        'assets/images/icon/bottom_bar_icon/profile.png'),
                    size: widget.screenHeight * 0.040,
                  ),
            label: '',
          ),
        ],
      );
    });
  }
}
