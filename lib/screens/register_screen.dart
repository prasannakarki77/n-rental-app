import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../components/custom_shape.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    usernameController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    phoneNoController.addListener(() => setState(() {}));
  }

  Future<void> requestCameraPermission() async {
    final cameraStatus = await Permission.camera.status;
    if (cameraStatus.isDenied) {
      await Permission.camera.request();
    }
  }

  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(255, 114, 94, 1),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              GestureDetector(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color.fromARGB(0, 62, 61, 61),
                    child: ClipOval(
                        child: img == null
                            ? Image.network(
                                "https://www.nicepng.com/png/detail/136-1366211_group-of-10-guys-login-user-icon-png.png",
                                fit: BoxFit.cover)
                            : Image.file(img!)),
                  ),
                  onTap: () {
                    requestCameraPermission();
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return photoPopup();
                        });
                  }),
              const SizedBox(
                height: 30,
              ),
              usernameField(),
              const SizedBox(
                height: 30,
              ),
              emailField(),
              const SizedBox(
                height: 30,
              ),
              phoneNoField(),
              const SizedBox(
                height: 30,
              ),
              passwordField(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // <-- Radius
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Already Registered ?",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginScreen');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() => TextFormField(
        controller: usernameController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Enter your username",
          labelText: "Username",
          prefixIcon: const Icon(
            Icons.account_circle_sharp,
            size: 30,
          ),
          suffixIcon: usernameController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => usernameController.clear(),
                ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textInputAction: TextInputAction.done,
      );

  Widget emailField() => TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Enter email address",
          labelText: "Email Address",
          prefixIcon: const Icon(
            Icons.mail,
            size: 28,
          ),
          suffixIcon: emailController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => emailController.clear(),
                ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textInputAction: TextInputAction.done,
      );

  Widget phoneNoField() => TextFormField(
        keyboardType: TextInputType.number,
        controller: phoneNoController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Enter phone number",
          labelText: "Phone Number",
          prefixIcon: const Icon(
            Icons.call,
            size: 28,
          ),
          suffixIcon: phoneNoController.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => phoneNoController.clear(),
                ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        textInputAction: TextInputAction.done,
      );

  Widget passwordField() => TextFormField(
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: "Enter your password",
          labelText: "Password",
          prefixIcon: const Icon(
            Icons.key,
            size: 30,
          ),
          suffixIcon: IconButton(
            icon: isPasswordVisible
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
            onPressed: () =>
                setState(() => isPasswordVisible = !isPasswordVisible),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        obscureText: isPasswordVisible,
        onChanged: (value) => setState(() => password = value),
      );

  Widget photoPopup() => SizedBox(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: ElevatedButton.icon(
                onPressed: () {
                  _loadImage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera_enhance),
                label: const Text('Take Photo'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: ElevatedButton.icon(
                onPressed: () {
                  _loadImage(ImageSource.gallery);
                },
                icon: const Icon(Icons.browse_gallery_sharp),
                label: const Text('Choose Photo'),
              ),
            ),
          ],
        ),
      );
}
