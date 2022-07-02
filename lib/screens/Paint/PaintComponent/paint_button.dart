import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';

class PaintButton extends HookConsumerWidget {
  const PaintButton({
    Key? key,
    required this.icon,
    required this.function,
  }) : super(key: key);

  final Icon icon;
  final Function function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);

    return InkWell(
      onTap: paintController.clear,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Icon(icon.),
      ),
    );
  }
}
