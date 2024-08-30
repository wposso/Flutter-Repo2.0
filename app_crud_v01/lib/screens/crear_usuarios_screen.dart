
// ignore_for_file: avoid_unnecessary_containers, camel_case_types, sized_box_for_whitespace

import 'package:app_crud_v01/screens/inicio_sesion_screen.dart';
import 'package:app_crud_v01/screens/listado_usuarios_screen.dart';
import 'package:flutter/material.dart';

  class datosUsuarios{
    String nombre;
    String apellido;
    String telefono;
    String direccion;

    datosUsuarios({
      required this.nombre, 
      required this.apellido,
      required this.telefono,
      required this.direccion});
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
  final TextEditingController telefonoControl = TextEditingController();
  final TextEditingController direccionControl = TextEditingController();
  int? index;
  String message = '';

  void crearUsuarios(){
    setState(() {
      listadoUsuarios.add(datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text,
        telefono: telefonoControl.text,
        direccion: direccionControl.text));
    });
    nombreControl.clear();
    apellidoControl.clear();
    telefonoControl.clear();
    direccionControl.clear();
  }

  void actualizarUsuarios(int index){
    setState(() {
      listadoUsuarios[index] = datosUsuarios(
        nombre: nombreControl.text, 
        apellido: apellidoControl.text,
        telefono: telefonoControl.text,
        direccion: direccionControl.text);
    });
    nombreControl.clear();
    apellidoControl.clear();
    telefonoControl.clear();
    direccionControl.clear();
  }

  void eliminarUsuarios(int index){
    setState(() {
      listadoUsuarios.removeAt(index);
    });
  }

  void loginMethod(){
    setState(() {
      for(var usuario in listadoUsuarios){
      if(usuario.nombre == nombreControl.text && usuario.apellido == apellidoControl.text){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListadoUsuariosScreen(listadoUsuarios: listadoUsuarios, actualizarUsuarios: actualizarUsuarios, eliminarUsuarios: eliminarUsuarios),));
      }
      else{
        print('Error');
      }
    }
    });
    
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
                label: Text('Nombre'),
                hintText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 18,),
            TextFormField(
              controller: apellidoControl,
              decoration: const InputDecoration(
                label: Text('Apellido'),
                hintText: 'Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 18,),
            TextFormField(
              controller: telefonoControl,
              decoration: const InputDecoration(
                label: Text('Telefono'),
                hintText: 'Telefono',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),

            const SizedBox(height: 18,),
            TextFormField(
              controller: direccionControl,
              decoration: const InputDecoration(
                label: Text('Dirección'),
                hintText: 'Dirección',
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
                    telefonoControl: telefonoControl,
                    direccionControl: direccionControl,
                    actualizarUsuarios: actualizarUsuarios,
                    eliminarUsuarios: eliminarUsuarios)));
                }, 
                icon: const Icon(Icons.list_alt, color: Colors.white, size: 30,)),

              const SizedBox(width: 40,),
              IconButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesionScreen(
                    loginMethod: loginMethod,
                    nombreControl: nombreControl,
                    apellidoControl: apellidoControl,),));
                }, 
                icon: const Icon(Icons.login, color: Colors.white, size: 30,))
            ],
          ),
        ),
        
    );
  }
}