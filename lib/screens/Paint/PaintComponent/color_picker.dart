import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/general_providers.dart';

class ColorPicker extends HookConsumerWidget {
  ColorPicker({Key? key, required this.pickColor}) : super(key: key);

  Color? pickColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _paintController = ref.watch(drawControllerProvider.notifier);

    return InkWell(
      onTap: () {
        _paintController.chageColor(pickColor!);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: pickColor!,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
