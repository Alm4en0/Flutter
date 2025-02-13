import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class LoginCafeScreen extends StatelessWidget {
  final Color colorPlomo = Colors.grey;
  const LoginCafeScreen({super.key});

  // Alerta para Android
  void displayDialogAndroid(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Iniciar Sesión'),
        content: const Text('¿Estás seguro de que quieres iniciar sesión?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(fontSize: 18)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Lógica adicional para iniciar sesión
            },
            child: const Text('Aceptar', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  // Alerta para iOS
  void displayDialogIOS(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Iniciar Sesión'),
        content: const Text('¿Estás seguro de que quieres iniciar sesión?'),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
              // Lógica adicional para iniciar sesión
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Cafe',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 70,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Nuestro mejor café del mundo',
                  style: TextStyle(color: colorPlomo, fontSize: 15),
                )
              ],
            ),
            Center(child: Image.asset('assets/angry-2498_256.gif')),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => Platform.isAndroid
                      ? displayDialogAndroid(context)
                      : displayDialogIOS(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 100),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    side: const BorderSide(color: Colors.brown),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 100),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Registrarte',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
