import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justice_4_all/modules/chat/chatbot_page.dart';
import 'package:justice_4_all/modules/profile/profile_screen.dart';
import 'package:justice_4_all/modules/bottomnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AIChatScreen()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  }

  String _getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home',
            style: TextStyle(color: Colors.black, fontFamily: 'Noto Serif')),
        backgroundColor: const Color(0xFFC0C0C0), // Updated to #C0C0C0
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopCard(context),
            _buildCarousel(screenSize),
            Padding(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              child: Text(
                'Services',
                style: TextStyle(
                  fontSize: 20 * textScaleFactor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto Serif',
                ),
              ),
            ),
            _buildServicesGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.all(screenSize.width * 0.04),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF002341), Color(0xFFC0C0C0)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(FontAwesomeIcons.gavel,
                color: Colors.white, size: 30 * textScaleFactor),
            SizedBox(height: 8 * textScaleFactor),
            Text(
              '${_getGreeting()}, Thomas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Open Sans',
              ),
            ),
            SizedBox(height: 4 * textScaleFactor),
            Text(
              'We\'re your personal legal aid assistant through technology.',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14 * textScaleFactor,
                fontFamily: 'Open Sans',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(Size screenSize) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        return _buildCarouselItem(context, index);
      },
      options: CarouselOptions(
        height: screenSize.height * 0.2,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, int index) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    List<Map<String, dynamic>> items = [
      {
        'icon': FontAwesomeIcons.locationDot,
        'text':
            'Locate the nearest police station, court, or legal aid organization in case of an emergency.',
      },
      {
        'icon': FontAwesomeIcons.scaleBalanced,
        'text': 'Access legal resources and information at your fingertips.',
      },
      {
        'icon': FontAwesomeIcons.bookOpen,
        'text': 'Stay informed about recent legal updates and changes.',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF002341), Color(0xFFC0C0C0)],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(items[index]['icon'],
                color: Colors.white, size: 30 * textScaleFactor),
            SizedBox(height: 8 * textScaleFactor),
            Text(
              items[index]['text'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 14 * textScaleFactor,
                fontFamily: 'Open Sans',
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesGrid(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    List<Map<String, dynamic>> services = [
      {
        'title': 'Legal Support',
        'icon': FontAwesomeIcons.scaleBalanced,
        'description':
            'Easy access to legal practitioners for all your inquiries and legal aid'
      },
      {
        'title': 'Legal Updates',
        'icon': FontAwesomeIcons.gavel,
        'description':
            'Be informed about changes in laws, regulations, and rulings'
      },
      {
        'title': 'Location',
        'icon': FontAwesomeIcons.locationDot,
        'description':
            'Locate the nearest police station, court, or legal aid organization in case of an emergency'
      },
      {
        'title': 'Hot-lines',
        'icon': FontAwesomeIcons.phone,
        'description': 'Direct contact information for emergency legal services'
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: screenSize.width * 0.04,
          mainAxisSpacing: screenSize.width * 0.04,
          childAspectRatio: 0.8,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return _buildServiceCard(context, services[index]);
        },
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF002341),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service['icon'],
                color: Colors.white, size: 40 * textScaleFactor),
            SizedBox(height: 12 * textScaleFactor),
            Text(
              service['title'],
              style: TextStyle(
                color: Colors.white,
                fontSize: 16 * textScaleFactor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Open Sans',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8 * textScaleFactor),
            Text(
              service['description'],
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12 * textScaleFactor,
                fontFamily: 'Open Sans',
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
