import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'third_screen.dart';
import '../providers/user_provider.dart';

class SecondPage extends StatelessWidget {
  final String userName;

  const SecondPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 0.5),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  userProvider.selectedUserName ?? 'Selected User Name',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedName = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ThirdPage()),
                    );

                    if (selectedName != null && selectedName is String) {
                      userProvider.setSelectedUser(selectedName);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Choose a User',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
