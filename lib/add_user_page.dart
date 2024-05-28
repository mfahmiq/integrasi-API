import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  Future<void> addUserData(
      {required String username, required String job}) async {
    var url = "https://reqres.in/api/users";
    final response = await http.post(
      Uri.parse(url),
      body: {
        "name": username,
        "job": job,
      },
    );

    // menampilkan data di console, data-response dari server
    log(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  "tambah user",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "username",
                  hintText: "masukan nama anda",
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _jobController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "job",
                  hintText: "masukan pekerjaan",
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await addUserData(
                      username: _nameController.text,
                      job: _jobController.text,
                    );
                  },
                  child: const Text("Kirim"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
