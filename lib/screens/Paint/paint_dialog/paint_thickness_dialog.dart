import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/common.dart';
import '../../../providers/general_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaintThicknessDialog extends HookConsumerWidget {
  const PaintThicknessDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paintController = ref.watch(drawControllerProvider.notifier);
    final state = ref.watch(drawControllerProvider);
    return state.isOption
        ? Positioned(
            bottom: 65.0,
            left: 5.0,
            width: MediaQuery.of(context).size.width - 5,
            height: 100.0,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child:
                        // Text(
                        //     "線の太さ：${state.thickness.toStringAsFixed(0).toString()}",
                        //     style: textStyleBold20),
                        Text(
                            AppLocalizations.of(context)!.lineThickness(
                                state.thickness.toStringAsFixed(0).toString()),
                            style: textStyleBold20),
                  ),
                  Expanded(
                    child: Slider(
                      thumbColor: Colors.black,
                      activeColor: Colors.black,
                      inactiveColor: const Color.fromARGB(255, 210, 210, 210),
                      value: state.thickness,
                      onChanged: (val) => paintController.ticknessSlider(val),
                      min: 1,
                      max: 50,
                      divisions: 50,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
