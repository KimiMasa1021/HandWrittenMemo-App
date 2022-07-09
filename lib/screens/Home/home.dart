import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zen03/providers/general_providers.dart';

import '../paint/paint_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "手書きメモ",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.watch(authRepositoryProvider).signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaintScreen()));
        },
        child: const Icon(Icons.photo_size_select_actual_rounded),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.6,
            children: List.generate(
              100,
              (index) {
                return Container(
                  width: size.width * 0.4,
                  height: 10,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 8, left: 8, right: 8),
                          child: Container(
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://yt3.ggpht.com/ytc/AKedOLSYX6-HQNVCuvu-YFYppe8uoFUAEyOxX871UsVW=s176-c-k-c0x00ffffff-no-rj-mo")),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "タイトルかね",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
