// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/calculadora.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/formulario.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      appBar: AppBar(
        title: const Text('Navegacion entre Pantallas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Navegacion entre pantallas.'),
          ],
        ),
      ),
    );
  } 
}

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/imagenes/logo-iujo.png'),
                ),
            ), child: Text(
              '...::: Menu Lateral :::...',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculadora'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/calculadora');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Formulario'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/formulario');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Salir'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirmar salida'),
                    content: Text('¿Estás seguro de que deseas salir de la aplicación?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).maybePop();
                          exit(0);
                        },
                        child: Text('Salir'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
