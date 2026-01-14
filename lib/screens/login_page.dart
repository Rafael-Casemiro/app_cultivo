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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _photoPath;
  bool _obscureText = true;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
          source: source,
          maxWidth: 1000,
          maxHeight: 85,
      );

      if (pickedFile != null) {
        setState(() {
          _photoPath = pickedFile.path;
        });
      }
    } catch (e) {
      debugPrint("Erro ao acessar a câmera/galeria: $e");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
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
              CircleAvatar(
                radius: 40,
                backgroundImage: _photoPath != null
                    ? FileImage(File(_photoPath!))
                    : const AssetImage('assets/images/default_avatar.png') as ImageProvider,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    icon: const Icon(Icons.photo_library),
                    label: const Text("Galeria"),
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                  const SizedBox(width: 10),
                  TextButton.icon(
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Câmera"),
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                ],
              ),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.person)
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Informe seu nome" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe seu email";
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return "Email inválido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Senha",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Informe sua senha";
                } else if (value.length < 6) {
                  return "A senha deve ter pelo menos 6 caracteres";
                }
                return null;
              },
            ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8aae5c),
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(userProfileProvider.notifier).saveUserProfile(
                      UserProfile(
                        name: _nameController.text,
                        email: _emailController.text,
                        password: _passwordController.text,
                        photoPath: _photoPath ?? 'assets/images/default_avatar.png',
                      ),
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