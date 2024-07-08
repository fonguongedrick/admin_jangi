
import 'package:admin_jangi/views/dashboard/members.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/views/dashboard/home.dart';
import 'package:admin_jangi/views/dashboard/transactions.dart';
import 'package:admin_jangi/views/dashboard/widgets/bottom_nav_item.dart';
import 'package:admin_jangi/views/dashboard/contribution.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PageController? _pageController;
  int _pageIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(); 
    // Initialize _pageController here

    _screens = [
       HomePage(),
       Contribution(),
       Transactions(),
       StatusListScreen(),
      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 61,
          elevation: 100,
          shadowColor: Colors.grey,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                iconData: Icons.home,
                isSelected: _pageIndex == 0,
                onTap: () => _setPage(0),
              ),
              BottomNavItem(
                iconData: Icons.credit_card,
                isSelected: _pageIndex == 1,
                onTap: () => _setPage(1),
              ),
              BottomNavItem(
                iconData: Icons.swap_horiz,
                isSelected: _pageIndex == 2,
                onTap: () => _setPage(2),
              ),
              BottomNavItem(
                iconData: Icons.group,
                isSelected: _pageIndex == 3,
                onTap: () => _setPage(3),
              ),
            ],
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
