import 'package:flutter/material.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = false;
  bool agreeTerms = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Icon(Icons.account_circle, size: 100, color: Colors.blue),
            SizedBox(height: 30),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remember Me'),
                Switch(
                  value: rememberMe,
                  onChanged: (value) => setState(() => rememberMe = value),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: agreeTerms,
                  onChanged: (value) => setState(() => agreeTerms = value!),
                ),
                Expanded(child: Text('Saya menyetujui syarat dan ketentuan')),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  if (!agreeTerms) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Anda harus menyetujui syarat dan ketentuan.')),
                    );
                    return;
                  }
                  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Username dan Password wajib diisi.')),
                    );
                    return;
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MenuPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
