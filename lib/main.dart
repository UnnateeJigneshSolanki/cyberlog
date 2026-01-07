import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<bool> _cameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<bool> _storagePermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.photos.request();
      return status.isGranted;
    }
    return true;
  }

  Future<void> _pick(ImageSource source) async {
    if (await _cameraPermission() && await _storagePermission()) {
      final XFile? file = await _picker.pickImage(source: source);
      if (file == null) return;
      await _saveImage(File(file.path));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Permission denied")));
    }
  }

  Future<void> _saveImage(File img) async {
    Directory dir;
    if (Platform.isAndroid) {
      dir = Directory('/storage/emulated/0/Pictures/CyberLog');
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final path =
        '${dir.path}/IMG_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final saved = await img.copy(path);

    setState(() => _image = saved);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Saved in CyberLog folder")));
  }

  void _showPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("Take Photo"),
            onTap: () {
              Navigator.pop(context);
              _pick(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Choose from Gallery"),
            onTap: () {
              Navigator.pop(context);
              _pick(ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _showPicker,
              child: Container(
                width: s.width * 0.45,
                height: s.width * 0.45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: _image != null
                      ? DecorationImage(
                          image: FileImage(_image!), fit: BoxFit.cover)
                      : null,
                ),
                child: _image == null
                    ? Icon(Icons.person,
                        size: s.width * 0.25, color: Colors.deepPurple)
                    : null,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "Tap to change profile picture",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
