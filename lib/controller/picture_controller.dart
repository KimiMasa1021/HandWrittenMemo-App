import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/model/user_data.dart';

import '../providers/general_providers.dart';

final pictureControllerProvider =
    StateNotifierProvider<Picturecontroller, UserData?>(
  (ref) => Picturecontroller(ref.read),
);

class Picturecontroller extends StateNotifier<UserData?> {
  final Reader read;

  Picturecontroller(this.read) : super(null) {
    read(pictureRepositoryProvider)
        .fetchPictureStream
        .listen((userData) => state = userData);

    print(state);
  }
}
