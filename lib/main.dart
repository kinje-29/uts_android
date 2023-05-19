import 'package:flutter/material.dart';
// import 'package:uts_semester6/constans.dart';

void main() {
  runApp(MaterialApp(
    title: 'Login',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool visibilityPass = false;

  // Email dan sandi
  final String myUser = 'FajarFirmansyah';
  final String myPass = '123456789';

  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.blue, Colors.blueGrey]),
        ),
        child: Card(
          elevation: 10,
          shadowColor: Colors.black,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: [
                    // padding: const EdgeInsets.all(8.0),
                    Icon(
                      Icons.personal_injury,
                      size: 80,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  // Usename
                  TextField(
                    controller: cUser,
                    style: TextStyle(fontSize: 10),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2.0),
                        ),
                        labelText: 'User Name',
                        hintText: 'jons@gmail.com',
                        prefixIcon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Password
                  TextField(
                    controller: cPass,
                    obscureText: !visibilityPass,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0)),
                        labelText: 'Password',
                        hintText: 'Input Kata Sandi',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibilityPass = !visibilityPass;
                            });
                          },
                          icon: visibilityPass
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      CekUser(context);
                    },
                    icon: Icon(Icons.electric_bolt),
                    label: Text("data"),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void CekUser(BuildContext context) {
    if (cUser.text == myUser && cPass.text == myPass) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Berhasil"),
        backgroundColor: Colors.grey,
      ));
    } else if (cUser.text.isEmpty || cPass.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Username dan Password tidak boleh kosong....'),
        backgroundColor: Colors.grey,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username dan Password salah"),
          backgroundColor: Colors.black,
        ),
      );
    }
  }
}
