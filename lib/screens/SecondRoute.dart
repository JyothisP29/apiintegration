import 'dart:io';

import 'package:firstapi/helpers/FIELD.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Field(),
          Field(),
          SizedBox(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey,
                  child: image == null
                      ? const CircleAvatar(
                          backgroundColor: Colors.grey,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
                Positioned(
                    bottom: 22,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        onImageButtonPressed(ImageSource.gallery);
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.green.withOpacity(.5),
                        child: const Center(
                            child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        )),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onImageButtonPressed(ImageSource source) async {
    final pickedFile = await (ImagePicker().pickImage(source: source));

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 100,
      maxHeight: 700,
      maxWidth: 700,
      compressFormat: ImageCompressFormat.jpg,
    );
    if (croppedFile != null) {
      setState(() {
        image = File(croppedFile.path);
      });
    }
    // else{
    //   Fluttertoast.showToast(msg: "Something went wrong try again!");
    //
    // }

    //capturedImageFile(val.path);
  }
}
