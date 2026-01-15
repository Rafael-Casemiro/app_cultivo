import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_cultivo/providers/user_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        backgroundColor: const Color(0xFF8aae5c),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Icon(Icons.eco, size: 100, color: Color(0xFF8aae5c)),
              const SizedBox(height: 40),

              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                (value == null || !value.contains('@')) ? "Email inválido" : null,
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
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  ),
                ),
                validator: (value) =>
                (value == null || value.length < 6) ? "Senha muito curta" : null,
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8aae5c),
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _handleLogin();
                  }
                },
                child: const Text("ENTRAR", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),

              TextButton(
                onPressed: () {
                },
                child: const Text("Não tem uma conta? Cadastre-se",
                    style: TextStyle(color: Color(0xFF8aae5c))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    final user = ref.read(userProfileProvider);

    if (user != null && user.email == _emailController.text && user.password == _passwordController.text) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email ou senha incorretos")),
      );
    }
  }
}