import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelView extends StatelessWidget {
  const ModelView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ModelViewer(
        src: 'assets/models/tableV1_1glb.glb',
        ar: true,
      ),
    );
  }
}
