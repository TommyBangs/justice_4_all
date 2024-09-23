import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justice_4_all/modules/bottomnavbar.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // This removes the back button
        title: const Text('Resources',
            style: TextStyle(color: Colors.black, fontFamily: 'Noto Serif')),
        backgroundColor: const Color(0xFFC0C0C0), // Updated to #C0C0C0
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRecentSearches(),
                    const SizedBox(height: 20),
                    _buildCategories(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/chat');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search legal resources...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Searches',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: [
            _buildChip('Criminal law definition'),
            _buildChip('Civil rights'),
            _buildChip('Commercial contract templates'),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Categories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildCategoryCard('Criminal Laws', FontAwesomeIcons.gavel),
            _buildCategoryCard('Civil Laws', FontAwesomeIcons.scaleBalanced),
            _buildCategoryCard('Commercial Laws', FontAwesomeIcons.briefcase),
            _buildCategoryCard(
                'Constitutional Laws', FontAwesomeIcons.landmark),
            _buildCategoryCard(
                'Administrative Laws', FontAwesomeIcons.buildingColumns),
            _buildCategoryCard('Customary Laws', FontAwesomeIcons.users),
            _buildCategoryCard('International Laws', FontAwesomeIcons.globe),
            _buildCategoryCard('Criminal Laws', FontAwesomeIcons.handcuffs),
            _buildCategoryCard('Family Laws', FontAwesomeIcons.peopleRoof),
            _buildCategoryCard('Labor Laws', FontAwesomeIcons.personDigging),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      color: const Color(0xFF002341),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
