import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  Future<void> fetchAllUsers() async {
    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?per_page=12'),
        headers: {'x-api-key': 'reqres-free-v1'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          users = data['data'];
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Fetch error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          'Third Screen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey, height: 0.5),
        ),
      ),
      body: users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: users.length,
              separatorBuilder: (_, __) =>
                  const Divider(color: Colors.black12, thickness: 1, height: 1),
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text(
                    '${user['first_name']} ${user['last_name']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    user['email'],
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  onTap: () {
                    final fullName =
                        '${user['first_name']} ${user['last_name']}';
                    Navigator.pop(context, fullName);
                  },
                );
              },
            ),
    );
  }
}
