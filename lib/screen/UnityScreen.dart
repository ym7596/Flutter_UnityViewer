import 'package:flutter/material.dart';
import 'package:flutter_unity_widget_web/flutter_unity_widget_web.dart';

class UnityScreen extends StatefulWidget {
  const UnityScreen({super.key});

  @override
  State<UnityScreen> createState() => _UnityScreenState();
}

class _UnityScreenState extends State<UnityScreen> {
  late UnityWebController _unityWebController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UnityWebWidget(

          url: 'http://localhost:${Uri.base.port}/unity/index.html',
          listenMessageFromUnity: _listenMessageFromUnity,
          onUnityLoaded: _onUnityLoaded),
    );
  }

  @override
  void dispose() {
    _unityWebController.dispose();
    super.dispose();
  }

  void _listenMessageFromUnity(String data) {
    if (data == 'load_next_scene') {
      // any message emitted from unty.
      _unityWebController.sendDataToUnity(
        gameObject: 'GameWindow',
        method: 'LoadNextScene',
        data: '0', // data sent to unity from flutter web.
      );
    }
  }

  void _onUnityLoaded(UnityWebController controller) {
    _unityWebController = controller;
    setState(() {});
  }
}
