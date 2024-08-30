
// ignore_for_file: avoid_unnecessary_containers, camel_case_types, sized_box_for_whitespace

import 'package:app_crud_v01/screens/listado_usuarios_screen.dart';
import 'package:flutter/material.dart';

  class datosUsuarios{
    String nombre;
    String apellido;

    datosUsuarios({
      required this.nombre, 
      required this.apellido});
  }

class CrearUsuariosScreen extends StatefulWidget {
  const CrearUsuariosScreen({super.key});

  @override
  State<CrearUsuariosScreen> createState() => _CrearUsuariosScreenState();
}

class _CrearUsuariosScreenState extends State<CrearUsuariosScreen> {

  final List<datosUsuarios> listadoUsuarios = [];
  final TextEditingController nombreControl = TextEditingController();
  final TextEditingController apellidoControl = TextEditingController();
  int? index;
  String message = '';

  void crearUsuarios(){
    setState(() {
      listadoUsuarios.add(datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text));
    });
    nombreControl.clear();
    apellidoControl.clear();
  }

  void actualizarUsuarios(int index){
    setState(() {
      listadoUsuarios[index] = datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text);
    });
    nombreControl.clear();
    apellidoControl.clear();
  }

  void eliminarUsuarios(int index){
    setState(() {
      listadoUsuarios.removeAt(index);
    });
  }

  void loginMethod(){
    for(var usuario in listadoUsuarios){
      if(usuario.nombre == nombreControl.text && usuario.apellido == apellidoControl.text){
        Navigator.pop(context);
      }
      else{
        message = 'Credenciales inconrrectas';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Crear usuarios'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.people_alt),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [

            const SizedBox(height: 40,),
            TextFormField(
              controller: nombreControl,
              decoration: const InputDecoration(
                hintText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 10,),
            TextFormField(
              controller: apellidoControl,
              decoration: const InputDecoration(
                hintText: 'Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 50,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(300,50),
                elevation: 10,
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
              onPressed: (){
                crearUsuarios();
              }, 
              child: const Text('Guardar',style: TextStyle(color: Colors.white),)),
          ],
        ),),
        bottomNavigationBar: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
            topRight: Radius.circular(20))
          ),
          child: Row(
            children: [

              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListadoUsuariosScreen(
                    listadoUsuarios: listadoUsuarios,
                    apellidoControl: apellidoControl,
                    nombreControl: nombreControl,
                    actualizarUsuarios: actualizarUsuarios,
                    eliminarUsuarios: eliminarUsuarios)));
                }, 
                icon: const Icon(Icons.list_alt, color: Colors.white, size: 30,))
            ],
          ),
        ),
        
    );
  }
}