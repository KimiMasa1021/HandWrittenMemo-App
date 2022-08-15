import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.function,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 3,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
