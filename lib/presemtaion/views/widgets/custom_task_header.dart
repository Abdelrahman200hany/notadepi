import 'package:flutter/material.dart';

class CustomTaskHeader extends StatelessWidget {
  const CustomTaskHeader({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,

    required this.iconBackgoundColor,
  });
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final Color  iconBackgoundColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        'October 15',
        style: TextStyle(color: const Color(0xff757575), fontSize: 14),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: iconBackgoundColor,
            shape: BoxShape.circle,
          ),
          child: Center(child: Icon(icon, color: Colors.white,)),
        ),
      ),
    );
  }
}
