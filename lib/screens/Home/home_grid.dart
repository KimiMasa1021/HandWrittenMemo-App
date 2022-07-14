import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/screens/Home/home_details.dart';
import '../../model/picture_model.dart';
import '../../model/user_data.dart';

class HomeGrid extends HookConsumerWidget {
  const HomeGrid({Key? key, required this.userPicture}) : super(key: key);
  final UserData userPicture;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: 0.74,
      children: List.generate(
        userPicture.data?.length ?? 0,
        (index) {
          Picture? picture = userPicture.data?[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PictureDetails(data: picture!))),
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
          );
        },
      ),
    );
  }
}
//picture!.thumbnailUrl!