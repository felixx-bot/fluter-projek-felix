import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

// -------------------- LOGIN PAGE ---------------------
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
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
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeTerms = value!;
                    });
                  },
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Anda harus menyetujui syarat dan ketentuan.'),
                    ));
                    return;
                  }

                  if (usernameController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Username dan Password wajib diisi.'),
                    ));
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

// -------------------- MENU PAGE ---------------------
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Pengguna')),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Center(child: Icon(Icons.person, size: 80, color: Colors.blue)),
          SizedBox(height: 20),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Ganti Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChangePasswordPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ContactUsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.switch_account),
            title: Text('Ganti Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// -------------------- CHANGE PASSWORD PAGE ---------------------
class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
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
                  icon: Icon(
                      showNewPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showNewPassword = !showNewPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Simpan Password'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Password berhasil diubah.'),
                  ));
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

// -------------------- CONTACT US PAGE ---------------------
class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hubungi Kami')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Icon(Icons.email, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Pesan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Kirim Pesan'),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Pesan berhasil dikirim!'),
                  ));
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
