import 'package:flutter/material.dart';

typedef PreviewRoot = Widget Function(Widget preview);

class Preview {
  final String? name;
  final Size size;
  final Widget child;

  const Preview({
    this.name,
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
                  (preview) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        // Compensate for the decoration thickness
                        width: preview.size.width + 2,
                        height: preview.size.height + 2,
                        margin: const EdgeInsets.all(2),
                        child: root(preview.child),
                      ),
                      if (preview.name != null) Text(preview.name!),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    ),
  );
}
