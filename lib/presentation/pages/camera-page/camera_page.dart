import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mimicon/presentation/pages/camera-page/camera_controller_widget.dart';
import 'package:mimicon/utils/export.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  late final List<CameraDescription> _cameras;

  Future<void> initCamera() async {
    _cameras = await availableCameras();

    await onNewCameraSelected(_cameras.first);
  }

  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }

    await previousCameraController?.dispose();

    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void initState() {
    initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppNumbers.horizontalPadding.w),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      size: AppNumbers.iconSize.w,
                    )),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppNumbers.horizontalPadding.w),
                  child: Icon(
                    Icons.more_vert,
                    size: AppNumbers.iconSize.w,
                  ),
                )
              ],
            ),
            body: _isCameraInitialized
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Column(children: [
                      SizedBox(
                        height: .65.sh,
                        width: 1.sw,
                        child: CameraPreview(
                          _controller!,
                        ),
                      ),
                      const Expanded(child: const CameraControllerWidget()),
                    ]),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
