import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:justice_4_all/modules/bottomnavbar.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  // Remove the _selectedIndex and _onItemTapped method

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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC0C0C0),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Justice AI',
              style: TextStyle(
                color: const Color(0xFF002341),
                fontWeight: FontWeight.bold,
                fontSize: 20 * textScaleFactor,
              ),
            ),
            CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/images/user_profile.png'),
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
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(screenSize, textScaleFactor),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/resources');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
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
                  borderSide: const BorderSide(color: Color(0xFFC0C0C0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Color(0xFF002341)),
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
                color: const Color(0xFF002341), size: 24 * textScaleFactor),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.microphone,
                color: const Color(0xFF002341), size: 24 * textScaleFactor),
            onPressed: () {
              // Implement voice recording functionality
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

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
                    radius: 20 * textScaleFactor,
                    child: Text('AI',
                        style: TextStyle(fontSize: 14 * textScaleFactor)),
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
                    radius: 20 * textScaleFactor,
                    child: Text('You',
                        style: TextStyle(fontSize: 14 * textScaleFactor)),
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
