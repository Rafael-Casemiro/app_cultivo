import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/providers/user_provider.dart';
import 'package:app_cultivo/models/user_profile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  String? _photoPath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _photoPath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color(0xFF8aae5c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Informe seu nome" : null,
              ),
              const SizedBox(height: 16),

              CircleAvatar(
                radius: 40,
                backgroundImage: _photoPath != null
                    ? FileImage(File(_photoPath!))
                    : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
              ),
              TextButton.icon(
                icon: const Icon(Icons.photo),
                label: const Text("Escolher Foto"),
                onPressed: _pickImage
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8aae5c),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(userProfileProvider.notifier).state = UserProfile(
                      name: _nameController.text,
                      photoPath: _photoPath ?? 'assets/images/default_avatar.png',
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}