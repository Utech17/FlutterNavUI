// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/calculadora.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/home.dart';
import 'package:menu_lateral_miguel_gutierrez_b/src/formulario.dart';


class Calculadora extends StatefulWidget {
  const Calculadora({super.key, required this.title});
  final String title;

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final TextEditingController controllerNumero1 = TextEditingController();
  final TextEditingController controllerNumero2 = TextEditingController();
  final TextEditingController controllerResultado = TextEditingController();

  int _selectedIndex = 0; 

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
  switch (index) {
    case 0:
      Navigator.pushNamed(context, '/calculadora');
      break;
    case 1:
      Navigator.pushNamed(context, '/'); // Home
      break;
    case 2:
      Navigator.pushNamed(context, '/formulario'); 
      break;
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagenes/fondo.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Column(
              children: [
                const SizedBox(height: 40),
                SizedBox(
                height: 100,
                  child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('assets/imagenes/casio-logo.jpg'),
                    fit: BoxFit.cover,
                    ),
                  ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controllerNumero1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                  labelText: 'Número 1:',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 139),
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.grey,),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controllerNumero2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                  labelText: 'Número 2:',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 139),
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.grey,),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controllerResultado,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 139),
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 139),
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 139)),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        int numero1 = int.parse(controllerNumero1.text);
                        int numero2 = int.parse(controllerNumero2.text);
                        int resultado = numero1 + numero2;
                        controllerResultado.text =
                            'Resultado [Suma]: $resultado';
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 139),
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        int numero1 = int.parse(controllerNumero1.text);
                        int numero2 = int.parse(controllerNumero2.text);
                        int resultado = numero1 - numero2;
                        controllerResultado.text =
                            'Resultado [Resta]: $resultado';
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 139),
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        int numero1 = int.parse(controllerNumero1.text);
                        int numero2 = int.parse(controllerNumero2.text);
                        int resultado = numero1 * numero2;
                        controllerResultado.text =
                            'Resultado [Multiplicación]: $resultado';
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 139),
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.close),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        int numero1 = int.parse(controllerNumero1.text);
                        int numero2 = int.parse(controllerNumero2.text);
                        if (numero2 != 0) {
                          double resultado = numero1 / numero2;
                          controllerResultado.text =
                              'Resultado [División]: $resultado';
                        } else {
                          controllerResultado.text =
                              'Error: División entre cero no permitida';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 139),
                        foregroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.percent),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: (){
                    controllerNumero1.clear();
                    controllerNumero2.clear();
                    controllerResultado.clear();
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 139),
                        foregroundColor: Colors.white,
                      ),
                  child: 
                  const Text('Limpiar'),
                ),
              ],
            ),
            const SizedBox(height: 140),
            const Text(
              'Todos los derechos reservados. Copyright © Miguel Gutiérrez 2025',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 139),
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 10),
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