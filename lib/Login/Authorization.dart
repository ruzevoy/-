import 'package:flutter/material.dart';
import 'package:flutter_application_22/Login/Password.dart';
import 'package:flutter_application_22/Login/Welcome.dart';

import 'Registration.dart';

// Экран авторизации
class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Авторизация'),
      ),
      body: Column( 
        children: [
          const SizedBox(height: 40),
          Center(
            child: Container(
          width: 300,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: const Color.fromARGB(255, 233, 233, 233),
          border: Border.all(
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20)
              )
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.android
                    ),
                  labelText: 'Введите логин',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock
                    ),
                  labelText: 'Введите пароль',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black, 
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Password()
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
               SizedBox(
                      width: 150,
                      height: 40, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    child: const Text(
                      'Регистрация', 
                        style: TextStyle(
                        fontSize: 16, 
                        color: Colors.black
                        )
                      ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Registration()
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                      width: 100,
                      height: 40, 
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                    fontSize: 17, 
                    color: Colors.black
                    ),
                   ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
          
          ]
        ),
    );
  }
}