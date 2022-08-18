import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PaintOperateIcon extends HookConsumerWidget {
  const PaintOperateIcon({
    Key? key,
    required this.pickIcon,
    required this.function,
  }) : super(key: key);

  final Icon pickIcon;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => function(),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: pickIcon,
      ),
    );
  }
}
