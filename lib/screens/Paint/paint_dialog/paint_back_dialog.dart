import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Home/home.dart';

import '../../../../common/common.dart';
import '../../../providers/general_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaintBackDialog extends HookConsumerWidget {
  const PaintBackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawController = ref.watch(drawControllerProvider.notifier);

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min, //　ダイアログの高さをコンテンツに合わせる。
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
              color: Color.fromARGB(200, 102, 191, 191),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.home,
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Text(AppLocalizations.of(context)!.indicate,
                style: textStyleBold20),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(AppLocalizations.of(context)!.cancellation,
                          style: textStyleNomal20)),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    drawController.clear();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (_) => false,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(AppLocalizations.of(context)!.ok,
                        style: textStyleBold20),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
