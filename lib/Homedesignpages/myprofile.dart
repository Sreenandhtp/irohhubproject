import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  String image = "";
  File? _image;
  String image1 = "";

  getcameraimage() async {
    final camerapicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (camerapicked != null) {
        image1 = camerapicked.path;
        _image = File(camerapicked.path);
      } else {
        print('No image found....');
      }
    });
  }

  getimage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        image1 = pickedimage.path;
        _image = File(pickedimage.path);
      } else {
        print('No image found');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_outlined, size: 18),
        ),
        title: Text(
          "MY PROFILE",
          style: GoogleFonts.mPlus1(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(19)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 3.5,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: Text(
                                    "Profile photo",
                                    style: GoogleFonts.robotoSlab(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  255, 219, 218, 218))),
                                      child: IconButton(
                                          onPressed: () {
                                            getcameraimage();
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  255, 219, 218, 218))),
                                      child: IconButton(
                                          onPressed: () async {
                                            var status = await Permission
                                                .storage
                                                .request();
                                            if (status ==
                                                PermissionStatus.granted) {
                                              getimage();
                                            } else {}
                                          },
                                          icon: const Icon(
                                            Icons.photo,
                                            color: Colors.black,
                                          )),
                                    ),
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1,
                                              color: const Color.fromARGB(
                                                  255, 219, 218, 218))),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.black,
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: _image != null
                      ? CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/564x/39/94/fb/3994fb52d1f983d003ed6f084366bdab.jpg"),
                        ),
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('edit')),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  decoration: InputDecoration(
                    hintText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  decoration: InputDecoration(
                    hintText: 'E-Mail',
                    prefixIcon: const Icon(Icons.alternate_email_rounded),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  decoration: InputDecoration(
                    hintText: 'Phone no',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                child: TextFormField(
                  style: GoogleFonts.mPlus1(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock_open_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'SAVE',
                      style: GoogleFonts.mPlus1(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
