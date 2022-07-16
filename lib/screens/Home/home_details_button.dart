import 'package:flutter/material.dart';

import '../../common/common.dart';

class HomeDetailsButton extends StatelessWidget {
  const HomeDetailsButton({
    Key? key,
    required this.text,
    required this.buttonIcon,
    required this.function,
  }) : super(key: key);

  final String text;
  final Icon buttonIcon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => function(),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 30),
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            buttonIcon,
            const SizedBox(width: 10),
            Text(text, style: textStyleBold20)
          ],
        ),
      ),
    );
  }
}
