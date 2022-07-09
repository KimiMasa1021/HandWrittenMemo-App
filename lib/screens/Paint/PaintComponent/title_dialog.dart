import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TitleDialog extends StatelessWidget {
  const TitleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: const [
          Positioned(
            child: InkWell(
              child: CircleAvatar(
                child: Icon(Icons.close),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
