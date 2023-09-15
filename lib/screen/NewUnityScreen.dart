import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityScreenWeb extends StatefulWidget {
  const UnityScreenWeb({Key? key}) : super(key: key);



  @override
  State<UnityScreenWeb> createState() => _UnityScreenWebState();
}

class _UnityScreenWebState extends State<UnityScreenWeb> {

  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return

           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [


                  SizedBox(

                    child: UnityWidget(onUnityCreated: onUnityCreated,
          onUnityMessage: onUnityMessage,
                      onUnitySceneLoaded: onUnitySceneLoaded,
          fullscreen: false,
                      useAndroidViewSurface: false),
                  ),

             ],
           );


  }
  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    this._unityWidgetController = controller;
  }

  // Communication from Unity when new scene is loaded to Flutter
  void onUnitySceneLoaded(SceneLoaded? scene) {
    if (scene != null) {
      print('Received scene loaded from unity: ${scene.name}');
      print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
    } else {
      print('Received scene loaded from unity: null');
    }
  }
}
