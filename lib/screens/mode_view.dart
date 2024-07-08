import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelView extends StatelessWidget {
  final String model;
  const ModelView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelViewer(
        src: model,
        ar: true,
      ),
    );
  }
}
