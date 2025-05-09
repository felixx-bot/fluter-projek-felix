import 'package:flutter/material.dart';
import 'change_password_page.dart';
import 'contact_us_page.dart';
import 'login_page.dart';


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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChangePasswordPage()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ContactUsPage()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.switch_account),
            title: Text('Ganti Akun'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()),
            ),
            
          ),
        ],
      ),
    );
  }
}
