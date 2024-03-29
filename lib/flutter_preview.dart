import 'package:flutter/material.dart';

typedef PreviewRoot = Widget Function(Widget preview);

class Preview {
  final Size size;
  final Widget child;

  const Preview({
    required this.size,
    required this.child,
  });
}

void runPreviews({
  required PreviewRoot root,
  required List<Preview> previews,
}) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: previews
                .map(
                  (preview) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    width: preview.size.width,
                    height: preview.size.height,
                    child: root(preview.child),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ),
  );
}
