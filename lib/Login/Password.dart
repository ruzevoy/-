import 'package:flutter/material.dart';
import 'Authorization.dart';


class Password extends StatelessWidget {
  const Password({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Восстановление пароля'),
      ),
     body: Column( 
        children: [
            const SizedBox(height: 30), 
            Center(
              child: 
               Container(
              width: 300,
              height: 300,
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
                  const Text(
                        'Введите ваш e-mail. Мы вышлем на него инструкцию по восстановлению пароля.',
                        style: TextStyle(
                        fontSize: 17, 
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
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
                  SizedBox(
                    width: 200,
                    height: 40, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                          ),
                      ),
                      child: const Text(
                        'Восстановить',
                        style: TextStyle(
                        fontSize: 17, 
                        color: Colors.black
                        ),
                      ),
                  onPressed: () => _dialogBuilder(context),
                    ),
                  ),
                ],
              ),
            ),
            )
          ]
        ) 
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Восстановление пароля'),
          content: const Text(
            'Письмо по восстановлению пароля отпраленно на ваш e-mail.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Закрыть'),
              onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Authorization()
                ),
              );
            },
          ),
        ],
      );
    },
  );
}








