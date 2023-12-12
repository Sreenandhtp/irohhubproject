import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:irohubproject/widgets/myprofile.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  final picker = ImagePicker();
  File? galleryFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            )),
        title: const Text(
          'My Profile',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding:const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  _showPicker(context: context);
                  galleryFile == null
                      ?const Image(image: AssetImage('asset/IMG_9486.jpg'))
                      : Image.file(
                          galleryFile!,
                          fit: BoxFit.fill,
                        );
                },
                child: const CircleAvatar(
                  radius: 70,
                ),
              ),
            ),
          ),
          const Text(
            'My Name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Myprofilefield(iconData: Icons.calendar_today_outlined),
          Myprofilefield(iconData: Icons.call),
          Myprofilefield(iconData: Icons.mail_outline),
          Myprofilefield(iconData: Icons.lock),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () async {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    // Navigator.push(
    //   context,MaterialPageRoute(builder: (context) => images(),)
    // );
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
