import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/features/object_detecting/presentation/controller/scan_controller.dart';

class cameraView extends StatelessWidget {
  const cameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controlller) {
            return controlller.isCameraInisialized.value
                ? CameraPreview(controlller.cameraController)
                : Container();
          }),
    );
  }
}
