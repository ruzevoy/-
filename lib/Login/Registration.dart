import 'package:flutter/material.dart';
import 'Authorization.dart';


class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Регистрация'),
      ),
     body: Center( 
        child: Column( 
        children: [
          Center(
            child: 
            Container(
          width: 350,
          height: 470,
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
                const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.https
                    ),
                  labelText: 'Введите пароль',
                ),
              ),
              const SizedBox(height: 30),
             TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.email
                    ),
                  labelText: 'Введите почту',
                ),
              ),
                const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.phone
                    ),
                  labelText: 'Введите номер телефона',
                ),
              ),
                const SizedBox(height: 35),
              SizedBox(
                  width: 240,
                  height: 40,   
              child: ElevatedButton(
               onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Authorization()
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                  ),
                child: const Text('Зарегистрироваться',
                    style: TextStyle(
                        fontSize: 17, 
                        color: Colors.black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          ]
        ),
      )
    );
  }
}











 