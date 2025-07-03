import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orderapp/utilites/Appstyles.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;

  const CustomProfileAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset('assets/images/Icon.svg'),
        iconSize: 20,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: Appstyles.fontsize20.copyWith(color: Color(0xff1E1E1E)),
      ),
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
