import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  bool showNewPassword = false;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ganti Password')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.lock_outline, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password Lama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: newPasswordController,
              obscureText: !showNewPassword,
              decoration: InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(showNewPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () => setState(() => showNewPassword = !showNewPassword),
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Simpan Password'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Password berhasil diubah.')),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
