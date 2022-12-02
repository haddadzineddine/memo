import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARK DEMO'),
      ),
      body: ARKitSceneView(onARKitViewCreated: (c) => onARKitViewCreated(c),),
    );
  }
}

void onARKitViewCreated(ARKitController c) {
  final node = ARKitNode(
    geometry: ARKitBox(
      width: 0.1,
      height: 0.1,
      length: 0.1
    ),

    position: Vector3(0,0,-0.5),
  );
  
  c.add(node);
}
