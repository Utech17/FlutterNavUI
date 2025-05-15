// ignore_for_file: unused_import

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/calculadora.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/formulario.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/home.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1; 

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/calculadora'); // Buscar (puedes cambiar la ruta si tienes una pantalla de búsqueda)
      break;
    case 1:
      Navigator.pushNamed(context, '/'); // Home
      break;
    case 2:
      Navigator.pushNamed(context, '/formulario'); // Perfil (puedes cambiar la ruta si tienes una pantalla de perfil)
      break;
    }
  } 

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
            CachedNetworkImage(
              imageUrl: "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter",
              placeholder: (context, url) =>
                  const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ), 
            const Text('Navegacion entre pantallas.'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate), 
            backgroundColor:Colors.lightBlueAccent, 
            label:'Calculadora')
            ,
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            backgroundColor:Colors.lightBlue, 
            label:'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            backgroundColor: Colors.blue, 
            label:'Formulario'),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 5
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
              DialogoSalir.alert(
                context,
                title: 'Salir',
                description: '¿Está seguro que desea salir?',
                icono: 'assets/imagenes/icon_question.png',
              );
            },
          ),
        ],
      ),
    );
  }
}

abstract class DialogoSalir {
  static alert(
      BuildContext context, {
        required String title,
        required String description,
        required String icono,
      }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            height: 120,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Image.asset(
                      'assets/imagenes/icon_question.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 25.0),
                    Text(description),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            minWidth: 100.0,
            height: 30.0,
            onPressed: () {
              exit(0);
            },
            color: Colors.blueGrey,
            child: Text('Si', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10.0),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            minWidth: 100.0,
            height: 30.0,
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.blue,
            child: Text('No', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}