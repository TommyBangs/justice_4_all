import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justice_4_all/modules/profile/profile_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({Key? key}) : super(key: key);

  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  int _selectedIndex = 1; // Set to 1 for the Chat tab

  // Add your RapidAPI key here
  final String apiKey = 'YOUR_RAPIDAPI_KEY';

  Future<void> _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });

    try {
      final response = await http.post(
        Uri.parse('https://gemini-pro-ai.p.rapidapi.com/'),
        headers: {
          'x-rapidapi-key': apiKey,
          'x-rapidapi-host': 'gemini-pro-ai.p.rapidapi.com',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': text}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Adjust this based on the actual response structure
        final aiResponse = data['response']['text'];
        setState(() {
          _messages.insert(0, ChatMessage(text: aiResponse, isUser: false));
        });
      } else {
        throw Exception('Failed to get response from the chatbot');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _messages.insert(0,
            ChatMessage(text: 'Error: Unable to get response', isUser: false));
      });
    }
  }

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
    // You can add navigation for other tabs if needed
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFC0C0C0),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Justice AI',
              style: TextStyle(
                color: Color(0xFF002341),
                fontWeight: FontWeight.bold,
                fontSize: 20 * textScaleFactor,
              ),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_profile.png'),
              radius: 20 * textScaleFactor,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(screenSize.width * 0.04),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(screenSize, textScaleFactor),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(textScaleFactor),
    );
  }

  Widget _buildTextComposer(Size screenSize, double textScaleFactor) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.02),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              style: TextStyle(fontSize: 16 * textScaleFactor),
              decoration: InputDecoration(
                hintText: "Send a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Color(0xFFC0C0C0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(color: Color(0xFF002341)),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.015,
                ),
              ),
            ),
          ),
          SizedBox(width: screenSize.width * 0.02),
          IconButton(
            icon: Icon(Icons.send,
                color: Color(0xFF002341), size: 24 * textScaleFactor),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.microphone,
                color: Color(0xFF002341), size: 24 * textScaleFactor),
            onPressed: () {
              // Implement voice recording functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(double textScaleFactor) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFC0C0C0),
      selectedItemColor: Color(0xFF002341),
      unselectedItemColor: Color(0xFF002341),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedFontSize: 14 * textScaleFactor,
      unselectedFontSize: 14 * textScaleFactor,
      iconSize: 24 * textScaleFactor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          activeIcon: Icon(Icons.chat_bubble),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_outlined),
          activeIcon: Icon(Icons.book),
          label: 'Resources',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !isUser
              ? Container(
                  margin: EdgeInsets.only(right: screenSize.width * 0.04),
                  child: CircleAvatar(
                    child: Text('AI',
                        style: TextStyle(fontSize: 14 * textScaleFactor)),
                    radius: 20 * textScaleFactor,
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  isUser ? 'You' : 'Justice AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16 * textScaleFactor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.01),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 14 * textScaleFactor),
                  ),
                ),
              ],
            ),
          ),
          isUser
              ? Container(
                  margin: EdgeInsets.only(left: screenSize.width * 0.04),
                  child: CircleAvatar(
                    child: Text('You',
                        style: TextStyle(fontSize: 14 * textScaleFactor)),
                    radius: 20 * textScaleFactor,
                  ),
                )
              : IconButton(
                  icon: Icon(Icons.volume_up, size: 24 * textScaleFactor),
                  onPressed: () {
                    // Implement text-to-speech functionality
                  },
                ),
        ],
      ),
    );
  }
}
