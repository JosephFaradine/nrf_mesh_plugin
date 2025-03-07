import 'package:flutter/material.dart';
import 'package:nordic_nrf_mesh_faradine/nordic_nrf_mesh_faradine.dart';

class Model extends StatelessWidget {
  final ModelData model;

  const Model(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Text('model ID: 0x${model.modelId.toRadixString(16).toUpperCase()} '),
        appKeyBindIcon(),
        const Text(', ')
      ],
    );
  }

  bool isAppKeyBound() {
    return model.boundAppKey.isNotEmpty;
  }

  Icon appKeyBindIcon() {
    return isAppKeyBound()
        ? const Icon(
            Icons.check,
            size: 15,
            color: Colors.green,
          )
        : const Icon(
            Icons.clear,
            size: 15,
            color: Colors.red,
          );
  }
}
