import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Login',
      home: InstagramLoginPage(),
    );
  }
}

class InstagramLoginPage extends StatefulWidget {
  @override
  _InstagramLoginPageState createState() => _InstagramLoginPageState();
}

class _InstagramLoginPageState extends State<InstagramLoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;

  void login() {
    setState(() {
      if (usernameController.text.isEmpty || !usernameController.text.contains('@')) {
        errorMessage = 'Incorrect username or password';
      } else {
        errorMessage = null;
        // Perform login logic here
      }
    });
  }

  void forgotPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Try again'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void loginWithFacebook() {
    // Simulate navigating to Facebook login page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Redirecting to Facebook...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Instagram',
              style: GoogleFonts.pacifico(fontSize: 50),
            ),
            SizedBox(height: 50),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            if (errorMessage != null) ...[
              SizedBox(height: 10),
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: forgotPassword,
                child: Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed:() {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Instagram(),) );
              },
              child: Text('Log in'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300],
                minimumSize: Size(double.infinity, 55),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: loginWithFacebook,
              icon: Icon(Icons.facebook, color: Colors.blue),
              label: Text('Log in with Facebook',style: TextStyle(color: Colors.blue),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider()),
                Text(' OR '),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
              },
              child: Text(
                "Don't have an account? Sign up.",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  bool _isLiked = false;
   bool _issave = false;
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<String> postImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOA9gAB997h4LvvsWUZ2T-O-itQadKjS4_Qw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr_ZcDuVhrfHyRPFIydc---uHyvLbph7zNpA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG5U4hS8Hs8i5zrejd7IyeAtHz14nxW0LjXw&s'
  ];
final List<String>Mercedes = [
    'data:image/jpeg;base64,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',
    'https://sales.mercedes-autoforum.ru/images/news/news_card_collage/crop_merc_sedan_s580.jpg',
    ''
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram', style: GoogleFonts.pacifico(fontSize: 35)),
        actions: [
          SizedBox(width: 20),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen()),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.camera_alt_outlined),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  storyItem('Your Story', 'https://live.staticflickr.com/1820/43259154864_6c2d3b0e94_z.jpg'),
                  storyItem('Maxdishka', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4fe33b1d-a9d0-4fdb-8d15-0cb7787218aa/dgtudkw-d99f50c3-3a64-4b19-adfd-c7e34fb9a32c.png/v1/fill/w_512,h_512,q_80,strp/cute_anime_girl_smiling_at_viewer___profile_pic_by_louidev_dgtudkw-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNGZlMzNiMWQtYTlkMC00ZmRiLThkMTUtMGNiNzc4NzIxOGFhXC9kZ3R1ZGt3LWQ5OWY1MGMzLTNhNjQtNGIxOS1hZGZkLWM3ZTM0ZmI5YTMyYy5wbmciLCJ3aWR0aCI6Ijw9NTEyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.jhAE6ZPO76_OIiNkTTL1AS2xSZLKTMmdwoVvqjB3Cl0'),
                  storyItem('Negrhon', 'https://png.pngtree.com/thumb_back/fh260/background/20230612/pngtree-man-wearing-glasses-is-wearing-colorful-background-image_2905240.jpg'),
                  storyItem('Sayohat', 'https://th.bing.com/th/id/OIG1.CgTbIrO0vUXLNU28HMdC'),
                  storyItem('mani 2', 'https://live.staticflickr.com/1820/43259154864_6c2d3b0e94_z.jpg'),
                storyItem('Maxdishka', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4fe33b1d-a9d0-4fdb-8d15-0cb7787218aa/dgtudkw-d99f50c3-3a64-4b19-adfd-c7e34fb9a32c.png/v1/fill/w_512,h_512,q_80,strp/cute_anime_girl_smiling_at_viewer___profile_pic_by_louidev_dgtudkw-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTEyIiwicGF0aCI6IlwvZlwvNGZlMzNiMWQtYTlkMC00ZmRiLThkMTUtMGNiNzc4NzIxOGFhXC9kZ3R1ZGt3LWQ5OWY1MGMzLTNhNjQtNGIxOS1hZGZkLWM3ZTM0ZmI5YTMyYy5wbmciLCJ3aWR0aCI6Ijw9NTEyIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.jhAE6ZPO76_OIiNkTTL1AS2xSZLKTMmdwoVvqjB3Cl0'),
                  storyItem('Negrhon', 'https://png.pngtree.com/thumb_back/fh260/background/20230612/pngtree-man-wearing-glasses-is-wearing-colorful-background-image_2905240.jpg'),
                  storyItem('Sayohat', 'https://th.bing.com/th/id/OIG1.CgTbIrO0vUXLNU28HMdC'),
                ],
              ),
            ),
          ),
          Divider(),
          postItem(context),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add_circled), label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: ''),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/08/7e/fa/087efac84a10715bdb433afa40eeb024.jpg',
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget storyItem(String username, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 63,
            height: 63,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.pink,
                  Colors.orange,
                  Colors.yellow,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          Text(username),
        ],
      ),
    );
  }

  Widget postItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTr_ZcDuVhrfHyRPFIydc---uHyvLbph7zNpA&s',
            ),
          ),
          title: Text('cristiano'),
          subtitle: Text('Cristiano Ronaldo'),
          trailing: Icon(Icons.more_horiz),
        ),
        Container(
          height: 500,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: postImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                postImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${_currentPage + 1}/${postImages.length}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Row(
          children: [
          IconButton(
  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border,color: Colors.red,),
  onPressed: () {
    setState(() {
      _isLiked = !_isLiked; // Like holatini o'zgartiradi
    });
  },
),
           IconButton(
  icon: Icon(CupertinoIcons.chat_bubble),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Izoh qoldiring'),
          content: TextField(
            onChanged: (value) {
            },
            decoration: InputDecoration(hintText: 'Izohingizni kiriting'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dialogni yopish
              },
              child: Text('Jo’natish'),
            ),
          ],
        );
      },
    );
  },
),

          IconButton(
  icon: Icon(Icons.send),
  onPressed: () {
    // Odamlar ro'yxatini tanlash uchun dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Kimga jo\'natmoqchisiz?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKItMltUGbcNq880aED2fF4jOYFueSOgea0A&s'), // Odam rasmini qo'yish
                ),
                title: Text('Palmachi'),
                onTap: () {
                
                  Navigator.pop(context); 
                
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/2AuRpidSxVFn1X_ARB9pWBNIifdM7TGy4YSmu7hj01XT-hjTw9SNUxFBXiz9EqvJ5Q'), // Odam rasmini qo'yish
                ),
                title: Text('Usta'),
                onTap: () {
              
                  Navigator.pop(context);
                 
                },
              ),
                 ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVkp_wep_IcrM_6YX8KNV1m6r5Sly6YaPC0w&s'), // Odam rasmini qo'yish
                ),
                title: Text('Kal bobo'),
                onTap: () {
                  Navigator.pop(context); 
                
                },
              ),
              
            ],
          ),
        );
      },
    );
  },
),

            Spacer(),
             IconButton(
  icon: Icon(_issave ? Icons.bookmark : Icons.bookmark_border,color: Colors.black,),
  onPressed: () {
    setState(() {
      _issave = !_issave; // Like holatini o'zgartiradi
    });
  },
),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Liked by messi and 1,234,567 others'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'cristiano',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Enjoying the sunny weather!'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('View all 456 comments'),
        ),
           ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://yt3.googleusercontent.com/i83y5Nt3NRU_Xs2zGDCA9YxXHzAf7cT6W6tHAP2ZsB1Ka-F3F9030q2w8I0VK9EyS-n1AQj3=s900-c-k-c0x00ffffff-no-rj',
            ),
          ),
          title: Text('mercedes_benz'),
          subtitle: Text('Mercedes_benz'),
          trailing: Icon(Icons.more_horiz),
        ),
        Container(
          height: 500,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: postImages.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                postImages[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              '${_currentPage + 1}/${postImages.length}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        Row(
          children: [
          IconButton(
  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border,color: Colors.red,),
  onPressed: () {
    setState(() {
      _isLiked = !_isLiked; // Like holatini o'zgartiradi
    });
  },
),
           IconButton(
  icon: Icon(CupertinoIcons.chat_bubble),
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Izoh qoldiring'),
          content: TextField(
            onChanged: (value) {
            },
            decoration: InputDecoration(hintText: 'Izohingizni kiriting'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Dialogni yopish
              },
              child: Text('Jo’natish'),
            ),
          ],
        );
      },
    );
  },
),

          IconButton(
  icon: Icon(Icons.send),
  onPressed: () {
    // Odamlar ro'yxatini tanlash uchun dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Kimga jo\'natmoqchisiz?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKItMltUGbcNq880aED2fF4jOYFueSOgea0A&s'), // Odam rasmini qo'yish
                ),
                title: Text('Palmachi'),
                onTap: () {
                  // Tanlangan odamga jo'natish
                  Navigator.pop(context); // Dialogni yopish
                
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/2AuRpidSxVFn1X_ARB9pWBNIifdM7TGy4YSmu7hj01XT-hjTw9SNUxFBXiz9EqvJ5Q'), // Odam rasmini qo'yish
                ),
                title: Text('Usta'),
                onTap: () {
                  // Tanlangan odamga jo'natish
                  Navigator.pop(context); // Dialogni yopish
                 
                },
              ),
                 ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVkp_wep_IcrM_6YX8KNV1m6r5Sly6YaPC0w&s'), // Odam rasmini qo'yish
                ),
                title: Text('Kal bobo'),
                onTap: () {
                  // Tanlangan odamga jo'natish
                  Navigator.pop(context); // Dialogni yopish
                
                },
              ),
              
            ],
          ),
        );
      },
    );
  },
),

            Spacer(),
             IconButton(
  icon: Icon(_issave ? Icons.bookmark : Icons.bookmark_border,color: Colors.black,),
  onPressed: () {
    setState(() {
      _issave = !_issave; // Like holatini o'zgartiradi
    });
  },
),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Liked by messi and 1,234,567 others'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Text(
                'Mercedes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Enjoying the sunny weather!'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('View all 245 comments'),
        ),
      ],
    );
  }
}
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of users with recent messages
    final List<Map<String, String>> messages = [
      {
        'name': 'Palmachi',
        'message': 'Noskash',
        'time': 'now',
        'profileImage': 'https://images.unsplash.com/photo-1559583985-c80d8ad9b29f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3',
      },
      {
        'name': 'Usta',
        'message': 'Teshaboy Boltaboyev',
        'time': 'now',
        'profileImage': 'https://play-lh.googleusercontent.com/2AuRpidSxVFn1X_ARB9pWBNIifdM7TGy4YSmu7hj01XT-hjTw9SNUxFBXiz9EqvJ5Q',
      },
      {
        'name': 'Kal Bobo',
        'message': 'Salazar Sytherly',
        'time': '15m',
        'profileImage': '',
      },
      // Add more users and their messages as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(messages[index]['profileImage']!),
            ),
            title: Text(
              messages[index]['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(messages[index]['message']!),
            trailing: Text(messages[index]['time']!),
            onTap: () {
              // Navigate to the conversation screen when a user is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationScreen(
                    recipient: messages[index]['name']!,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Functionality for starting a new conversation
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ConversationScreen extends StatefulWidget {
  final String recipient;

  const ConversationScreen({super.key, required this.recipient});

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  List<Map<String, dynamic>> conversation = [];
  TextEditingController messageController = TextEditingController();
  String? replyingTo;
  int? editingMessageIndex;

  @override
  void initState() {
    super.initState();
    // Initial messages
    conversation = [
      {'message': 'Salom, qanday? - ${widget.recipient}', 'edited': false},
      {'message': 'Bugun nima qilishni rejalashtiryapsiz? - ${widget.recipient}', 'edited': false},
    ];
  }

  void sendMessage() {
    setState(() {
      if (messageController.text.isNotEmpty) {
        if (editingMessageIndex != null) {
          // If editing a message
          conversation[editingMessageIndex!] = {
            'message': '${messageController.text} (edited)',
            'edited': true
          };
          editingMessageIndex = null;
        } else {
          // If sending a new message
          conversation.add({
            'message': '${messageController.text} - You',
            'edited': false
          });
        }
        messageController.clear();
        replyingTo = null; // Reset replying after sending
      }
    });
  }

  void replyToMessage(String message) {
    setState(() {
      replyingTo = message;
    });
  }

  void editMessage(int index) {
    setState(() {
      messageController.text = conversation[index]['message'];
      editingMessageIndex = index;
    });
  }

  void deleteMessage(int index) {
    setState(() {
      conversation.removeAt(index);
      editingMessageIndex = null;
      replyingTo = null;
    });
  }

  void copyMessage(String message) {
    // Copy the message to the clipboard
    Clipboard.setData(ClipboardData(text: message));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Message copied!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversation with ${widget.recipient}'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: conversation.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(conversation[index]['message']),
                    onLongPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Wrap(
                            children: [
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                                onTap: () {
                                  replyToMessage(conversation[index]['message']);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.reply),
                                title: Text('Reply'),
                                onTap: () {
                                  editMessage(index);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                                onTap: () {
                                  deleteMessage(index);
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.copy),
                                title: Text('Copy'),
                                onTap: () {
                                  copyMessage(conversation[index]['message']);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          if (replyingTo != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Replying to: $replyingTo', style: TextStyle(color: Colors.blueGrey[700])),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        replyingTo = null;
                      });
                    },
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: editingMessageIndex != null
                            ? 'Edit message...'
                            : 'Write a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: sendMessage,
                  child: Icon(Icons.send, color: Colors.white),
                  backgroundColor: Colors.blueGrey[900],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

