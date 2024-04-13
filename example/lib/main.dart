import 'package:flutter/material.dart';
import 'package:flutter_preview/flutter_preview.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final skinny = constraints.maxWidth < 200;
        return ListView(
          children: List.generate(
            100,
            (index) => Text('${skinny ? 'skinny' : 'wide'} $index'),
          ),
        );
      },
    );
  }
}

void main() {
  runPreviews(
    root: (preview) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: preview),
    ),
    previews: [
      const Preview(name: 'Wide', size: Size(200, 200), child: TestWidget()),
      const Preview(name: 'Skinny', size: Size(150, 200), child: TestWidget()),
    ],
  );
}
