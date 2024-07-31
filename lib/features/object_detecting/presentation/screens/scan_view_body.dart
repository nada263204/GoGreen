
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:image_picker/image_picker.dart';

import 'package:graduation_project/Widgets/back_button.dart';
import 'package:graduation_project/core/widgets/widgets/wide_button.dart';
import 'package:graduation_project/features/object_detecting/presentation/widgets/scan_type_dialog.dart';
import 'package:graduation_project/core/config/theme.dart';
import 'package:tflite_v2/tflite_v2.dart';

import 'scan_cubit.dart';

class ScanViewBody extends StatefulWidget {
  const ScanViewBody({super.key});

  @override
  State<ScanViewBody> createState() => _ScanViewBodyState();
}

class _ScanViewBodyState extends State<ScanViewBody> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  Future<void> loadmodel() async {
    try {
      await Tflite.loadModel(
        model: "assets/realtime_object_detection/model_unquant.tflite",
        labels: "assets/realtime_object_detection/labels.txt",
      );
    } catch (e) {
      print('Error loading model: $e');
      context.read<ScanCubit>().setError('Error loading model');
    }
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image;
          file = File(image.path);
        });
        context.read<ScanCubit>().setLoading();
        await detectimage(file!);
      }
    } catch (e) {
      print('Error picking image: $e');
      context.read<ScanCubit>().setError('Error picking image');
    }
  }

  Future<void> detectimage(File image) async {
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 6,
        threshold: 0.05,
        imageMean: 127.5,
        imageStd: 127.5,
      );

      if (recognitions != null && recognitions.isNotEmpty) {
        String detectedLabel = 'No recognizable item found';
        for (var recognition in recognitions) {
          String label = recognition['label'];
          List<String> parts = label.split(' ');
          if (parts.length > 1) {
            detectedLabel = parts[1];
            break;
          }
        }
        context.read<ScanCubit>().updateRecognition(detectedLabel);
      } else {
        context.read<ScanCubit>().setError('No recognition found');
      }
    } catch (e) {
      print('Error running model on image: $e');
      context.read<ScanCubit>().setError('Error running model on image');
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScanCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Picking..',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 32.0),
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.6,
                child: Column(
                  children: [
                    if (_image != null)
                      Image.file(
                        File(_image!.path),
                        height: 350,
                        width: 250,
                        fit: BoxFit.cover,
                      )
                    else
                      const Text('Pick an image to identify'),
                    const SizedBox(height: 50),
                    const Spacer(),
                    WideButton(
                      text: 'Pick an image from gallery',
                      onTap: () {
                        _pickImage();
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (_, __, ___) {
                            return BlocProvider.value(
                              value: context.read<ScanCubit>(),
                              child: const ScanTypeDialog(),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocBuilder<ScanCubit, ScanState>(
                builder: (context, state) {
                  if (state is ScanLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ScanLoaded) {
                    return Text(state.recognition);
                  } else if (state is ScanError) {
                    return Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
