import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem({Key? key, required this.iconData, this.onTap, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        icon: Icon(iconData, color: isSelected ? primaryColor : Color(0xFFBFC6CB), size: 35),
        onPressed: onTap as void Function()?,
      ),
    );
  }
}
