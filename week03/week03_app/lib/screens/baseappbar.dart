import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.white;
  final Text title;
  final AppBar appBar;

  const BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          icon: Image.asset('assets/images/sushinimage.png'), onPressed: null),
      actions: [
        IconButton(
            icon: Image.asset('assets/images/sushinimage.png',
                height: 20, width: 20),
            onPressed: null),
      ],
      title: title,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
