import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = 'Name to be Displayed';
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //nameController.text = 'Brazil';
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Texfield in Flutter'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    keyboardType: TextInputType.text,
                    Controller: nameController,
                    hint: 'Please enter your Name',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    keyboardType: TextInputType.phone,
                    Controller: numberController,
                    hint: 'Please enter your Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        name =
                            '${nameController.text} - ${numberController.text}';
                      });
                    },
                    child: const Text('Submit'),
                  ),
                  Text(name),
                ],
              ),
            ),
          ),
        ));
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.Controller,
    required this.hint,
    required this.keyboardType,
  }) : super(key: key);

  final TextEditingController Controller;
  final String hint;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Colors.black54,
        fontSize: 15,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        border: OutlineInputBorder(),
        labelText: hint,
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
