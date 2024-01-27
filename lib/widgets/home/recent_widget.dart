import 'package:downloader_app/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class RecentWidget extends StatefulWidget {
  const RecentWidget({super.key});

  @override
  State<RecentWidget> createState() => _RecentWidgetState();
}

class _RecentWidgetState extends State<RecentWidget> {
  late final Box historyBox;

  @override
  void initState() {
    super.initState();
    historyBox = Hive.box('historyBox');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("$historyBox");
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Recent"),
            const SizedBox(
              height: 5,
            ),
            ValueListenableBuilder(
              valueListenable: historyBox.listenable(),
              builder: (context, Box box, widget) {
                if (box.isEmpty) {
                  return const Center(child: Text("No history."));
                } else {
                  return Column(
                    children: List.generate(box.length, (index) {
                      var currentBox = box;
                      var historyData =
                          currentBox.getAt(box.length - 1 - index)!;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: MyCard(
                          cover: historyData.cover,
                          author: historyData.author,
                          title: historyData.title,
                          filePath: historyData.filePath,
                          index: box.length - 1 - index,
                        ),
                      );
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
