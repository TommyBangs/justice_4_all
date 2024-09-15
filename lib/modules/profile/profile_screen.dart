import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF002341)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Color(0xFF002341)),
            onPressed: () {
              // Implement edit profile functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildProfileOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user_profile.png'),
          ),
          SizedBox(height: 16),
          Text(
            'Thomas Anderson',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          SizedBox(height: 8),
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
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          SizedBox(height: 16),
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
            subtitle: '+1 (555) 123-4567',
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
          SizedBox(height: 24),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF002341),
            ),
          ),
          SizedBox(height: 16),
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
          SizedBox(height: 24),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Implement logout functionality
              },
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF002341),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
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
      leading: Icon(icon, color: Color(0xFF002341)),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
