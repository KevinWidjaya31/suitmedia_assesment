import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sentenceController = TextEditingController();

  bool isPalindrome(String text) {
    String clean = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversed = clean.split('').reversed.join();
    return clean == reversed;
  }

  void _checkPalindrome() {
    final sentence = _sentenceController.text.trim();

    if (sentence.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a sentence first')),
      );
      return;
    }

    final result = isPalindrome(sentence);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Palindrome Check'),
        content: Text(result ? 'isPalindrome' : 'not palindrome'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _goToSecondPage() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter your name")));
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SecondPage(userName: name)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF2B637B);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/first_screen_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 48,
              backgroundColor: Colors.white24,
              child: Icon(Icons.person_add, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 64),
            TextField(
              controller: _nameController,
              style: const TextStyle(color: Color(0x5C686777)),
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(color: Color(0x5C686777)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _sentenceController,
              style: const TextStyle(color: Color(0x5C686777)),
              decoration: InputDecoration(
                hintText: 'Palindrome',
                hintStyle: TextStyle(color: Color(0x5C686777)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _checkPalindrome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('CHECK'),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _goToSecondPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('NEXT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
