import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../colors.dart';

class ProfileEditScreen extends StatefulWidget {
  final String initialNickname;
  final File? initialAvatarFile;
  final Function(String nickname, File? avatarFile) onProfileUpdated;

  const ProfileEditScreen({
    Key? key,
    required this.initialNickname,
    this.initialAvatarFile,
    required this.onProfileUpdated,
  }) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _nicknameController;
  File? _avatarFile;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController(text: widget.initialNickname);
    _avatarFile = widget.initialAvatarFile;

    // 监听文本变化
    _nicknameController.addListener(_checkChanges);
  }

  @override
  void dispose() {
    _nicknameController.removeListener(_checkChanges);
    _nicknameController.dispose();
    super.dispose();
  }

  void _checkChanges() {
    final nicknameChanged = _nicknameController.text != widget.initialNickname;
    final avatarChanged = _avatarFile != widget.initialAvatarFile;

    if (nicknameChanged || avatarChanged) {
      if (!_hasChanges) {
        setState(() {
          _hasChanges = true;
        });
      }
    } else {
      if (_hasChanges) {
        setState(() {
          _hasChanges = false;
        });
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final imagePicker = ImagePicker();
      final pickedFile = await imagePicker.pickImage(
        source: source,
        imageQuality: 70,
        maxWidth: 512,
        maxHeight: 512,
      );

      if (pickedFile != null) {
        setState(() {
          _avatarFile = File(pickedFile.path);
        });
        _checkChanges();
      }
    } catch (e) {
      if (e.toString().contains('permission')) {
        // 权限错误处理
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Permission Denied'),
            content: Text(source == ImageSource.camera
                ? 'Please grant camera access in your device settings to take a profile picture.'
                : 'Please grant photo library access in your device settings to select a profile picture.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('Open Settings'),
              ),
            ],
          ),
        );
      } else {
        // 其他错误处理
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    }
  }

  void _showAvatarOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              if (_avatarFile != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('Remove photo',
                      style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _avatarFile = null;
                    });
                    _checkChanges();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _saveChanges() async {
    final nickname = _nicknameController.text.trim();
    if (nickname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nickname cannot be empty')),
      );
      return;
    }

    // 显示加载状态
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Saving profile...'),
                ],
              ),
            ),
          ),
        );
      },
    );

    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 1));

    // 保存数据并关闭对话框
    if (mounted) {
      Navigator.of(context).pop(); // 关闭加载对话框
      widget.onProfileUpdated(nickname, _avatarFile);
      Navigator.pop(context); // 返回上一屏幕

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            // Avatar section
            GestureDetector(
              onTap: _showAvatarOptions,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _avatarFile != null
                        ? FileImage(_avatarFile!)
                        : const AssetImage('assets/images/avatars/1.png')
                            as ImageProvider,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),

            // Nickname field
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: 'Nickname',
                hintText: 'Enter your nickname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
              maxLength: 20,
            ),

            const SizedBox(height: 24.0),

            // Information about profile
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                children: const [
                  Text(
                    'About Your Profile',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Your profile information is only used within this app to personalize your experience. We do not share your information with third parties.',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32.0),

            // Save button
            ElevatedButton(
              onPressed: _hasChanges ? _saveChanges : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                disabledBackgroundColor: Colors.grey.shade300,
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
