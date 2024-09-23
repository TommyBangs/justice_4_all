import 'package:flutter/material.dart';
import 'package:justice_4_all/modules/bottomnavbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        title: Text('Profile',
            style: TextStyle(color: Colors.black, fontFamily: 'Noto Serif')),
        backgroundColor: const Color(0xFFC0C0C0), // Updated to #C0C0C0
        elevation: 0,
        // Add any other AppBar properties or actions you need
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildProfileOptions(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/resources');
          }
        },
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user_profile.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Thomas Anderson',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Legal Enthusiast',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'thomas.anderson@email.com',
            onTap: () {
              // Implement email change functionality
            },
          ),
          _buildOptionTile(
            icon: Icons.phone,
            title: 'Phone',
            subtitle: '+232 76 123 456',
            onTap: () {
              // Implement phone change functionality
            },
          ),
          _buildOptionTile(
            icon: Icons.lock,
            title: 'Change Password',
            onTap: () {
              // Implement password change functionality
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Implement notifications settings
            },
          ),
          _buildOptionTile(
            icon: Icons.privacy_tip,
            title: 'Privacy',
            onTap: () {
              // Implement privacy settings
            },
          ),
          _buildOptionTile(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {
              // Implement help & support
            },
          ),
          _buildOptionTile(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              // Implement about page
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement logout functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF002341),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Log Out'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF002341)),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
