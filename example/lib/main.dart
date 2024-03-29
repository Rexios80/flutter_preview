import 'package:flutter/material.dart';
import 'package:flutter_preview/flutter_preview.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: List.generate(10, (index) => Text('Item $index')));
  }
}

void main() {
  runPreviews(
    root: (preview) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: preview),
    ),
    previews: [
      Preview(size: Size(200, 200), child: TestWidget()),
      Preview(size: Size(200, 200), child: TestWidget()),
    ],
  );
}
