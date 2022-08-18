import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../providers/general_providers.dart';

class PaintSetUpShape extends HookConsumerWidget {
  const PaintSetUpShape({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String title;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintSetUpController =
        ref.watch(paintSetUpControllerProvider.notifier);
    final state = ref.watch(paintSetUpControllerProvider);
    // debugPrint([width, height].toString());

    return InkWell(
      onTap: () => paintSetUpController.handleRadio2(
          height.toDouble(), width.toDouble()),
      child: Container(
        margin: const EdgeInsets.only(bottom: 2, right: 10, left: 10),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  activeColor: Colors.blue,
                  value: height.toDouble(),
                  groupValue: state.height,
                  onChanged: (double? val) {
                    paintSetUpController.handleRadio2(val, width.toDouble());
                  },
                ),
                DottedBorder(
                  dashPattern: const [4, 4],
                  strokeWidth: 1,
                  child: SizedBox(
                    width: 22,
                    height: 22 * (height / width),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    title,
                    // style: textStyleBold20Gray,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text("${width.toString()} × ${height.toString()}"),
            ),
          ],
        ),
      ),
    );
  }
}
