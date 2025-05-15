// Miguel Gutierrez 31319357 seccion B
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key, required this.title});
  final String title;
  
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final TextEditingController controllerNombre = TextEditingController();
  final TextEditingController controllerFecha = TextEditingController(text: ''); 
  final TextEditingController controllerHora = TextEditingController();
  String estadoCi = listaEdoCivil.first;

  static const List<String> listaEdoCivil = <String>[
    'Sleccione...',
    'Soltero(a)',
    'Casado(a)',
    'Divorciado(a)',
    'Viudo(a)',
  ];

  bool isheckTra = false; 
  bool ischeckEst = false;
  String _sexo='';
  bool onOff=false;
  double _valorSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagenes/fondo2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                height: 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/imagenes/logo-iujo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Formulario de Captura de Datos',
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.black87, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Nombre'),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Escribe tu nombre',
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: Colors.grey,),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: controllerNombre,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                    prefixIcon: const Icon(Icons.edit),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controllerNombre.text = ''; // Limpiar el campo de texto
                      },
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Escribe tu nombre',
                    hintStyle: const TextStyle(color: Colors.grey,),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(value: isheckTra, onChanged: (bool? value) {
                      setState(() {
                        isheckTra = value!; // Actualizar el estado del checkbox
                      });
                    }),
                    const Text('Trabaja'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(value: ischeckEst, onChanged: (bool? value) {
                      setState(() {
                        ischeckEst = value!; // Actualizar el estado del checkbox
                      });
                    }),
                    const Text('Estudia'),
                    ],
                ),
                Row(
                  children: [
                    Radio(
                          value: 'Femenino', 
                          groupValue: _sexo,
                          onChanged: (String? value) {
                            setState(() {
                              _sexo = value!;
                            });
                          },
                    ), 
                    const Text('Femenino'),
                    ],
                ),
                Row(
                  children: [ 
                    Radio(
                      value: 'Masculino', 
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value!;
                        });
                      },
                    ),
                    const Text('Masculino'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Activar notificaciones'),
                    Switch(
                      value: onOff,
                      activeColor: Colors.blue,
                      onChanged: (bool value) {
                        setState(() { 
                          onOff = value;
                        });
                      },
                    ),
                  ],
                ),
                Slider(
                  thumbColor: Colors.yellow,
                  value: _valorSlider,
                  max: 100,
                  divisions: 5,
                  label: _valorSlider.round().toString(),
                  onChanged: (double value) { 
                    setState(() {
                      _valorSlider = value;
                    });
                  },
                ),
                TextField( 
                  controller: 
                  controllerFecha, //editing controller of this TextField 
                  decoration: const InputDecoration( 
                  icon: Icon(Icons.calendar_today), //icon of text field 
                  labelText: "Introduzca la Fecha" //label text of field 
                  ), // InputDecoration 
                  readOnly: true, // when true user cannot edit text 
                  onTap: () async { 
                  // ignore: unnecessary_null_comparison 
                  if (controllerFecha != null) { 
                  showDatePicker( 
                  context: context, 
                  initialDate: DateTime.now(),
                  firstDate: DateTime (DateTime.now().year - 100), 
                  lastDate: DateTime(DateTime.now().year + 1)) 
                  .then( 
                    (value){
                      setState(() { 
                      controllerFecha.text = 
                      '${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}';
                      }); 
                          }, 
                        ); 
                      } else { 
                    print("Fecha no seleccionada"); 
                  } 
                }),
                const SizedBox(height: 16),
                TextField(
                  controller: controllerHora, // Controlador para el campo de texto
                  decoration: const InputDecoration(
                    icon: Icon(Icons.access_time), // Icono del campo de texto
                    labelText: "Introduzca la Hora", // Etiqueta del campo de texto
                  ),
                  readOnly: true, // Evita que el usuario edite directamente el texto
                  onTap: () async {
                    // Mostrar el selector de hora
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(), // Hora inicial
                    );

                    if (pickedTime != null) {
                      // Si se selecciona una hora, actualizar el controlador
                      setState(() {
                        controllerHora.text = pickedTime.format(context); // Formatear la hora
                      });
                    } else {
                      print("Hora no seleccionada");
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Estado Civil:'),
                    const SizedBox(width: 16),
                    const Icon(Icons.people, color: Colors.blue,),
                    const SizedBox(width: 16),
                    DropdownButton(
                      value: estadoCi,
                      items: listaEdoCivil.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          estadoCi = value!;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmar salida'),
                content: Text('¿Estás seguro de que deseas salir de la aplicación?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cerrar el diálogo
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Cerrar el diálogo
                      Navigator.of(context).maybePop(); // Intentar cerrar la aplicación
                    },
                    child: Text('Salir'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Salir',
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
