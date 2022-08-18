import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/picture_model.dart';
import '../../model/user_data.dart';
import '../../providers/general_providers.dart';
import 'home_details.dart';

class HomeGrid extends HookConsumerWidget {
  const HomeGrid({Key? key, required this.userPicture}) : super(key: key);
  final UserData userPicture;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeControl = ref.watch(homeControllerProvider.notifier);
    final size = MediaQuery.of(context).size;

    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 2),
          // const QuiltedGridTile(2, 1),
          // const QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: userPicture.data?.length ?? 0,
        (context, index) {
          Picture? picture = userPicture.data?[index];

          return LongPressDraggable(
            data: picture,
            onDragStarted: () => homeControl.deleteTagetFlg(),
            onDragEnd: (details) async {
              await Future.delayed(const Duration(milliseconds: 200));
              homeControl.deleteTagetFlg();
            },
            feedback: SizedBox(
              width: size.width / 4,
              height: (size.width / 3.25) * 1.26,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: CachedNetworkImage(
                  imageUrl: picture!.thumbnailUrl!,
                  errorWidget: (context, url, dynamic err) => const Center(
                    child: Icon(Icons.error_outline_sharp),
                  ),
                ),
              ),
            ),
            childWhenDragging: const SizedBox(),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PictureDetails(data: picture))),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: picture.thumbnailUrl!,
                errorWidget: (context, url, dynamic err) => const Center(
                  child: Icon(Icons.error_outline_sharp),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
