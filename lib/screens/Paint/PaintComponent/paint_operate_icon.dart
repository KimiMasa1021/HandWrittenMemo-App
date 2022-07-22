import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/shared/my_flutter_app_icons.dart';
import '../../../providers/general_providers.dart';

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
    final state = ref.watch(drawControllerProvider);
    return InkWell(
      onTap: () => function(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            !state.isEraser && !state.isZoom && pickIcon.icon == Icons.brush
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 172, 203, 255),
                      shape: BoxShape.circle,
                    ),
                  )
                : state.isEraser && pickIcon.icon == MyFlutterApp.eraser
                    ? Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 172, 203, 255),
                          shape: BoxShape.circle,
                        ),
                      )
                    : state.isZoom && pickIcon.icon == Icons.front_hand_outlined
                        ? Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 172, 203, 255),
                              shape: BoxShape.circle,
                            ),
                          )
                        : const SizedBox(),
            pickIcon,
          ],
        ),
      ),
    );
  }
}
