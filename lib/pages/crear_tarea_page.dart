import 'package:ejercicio01/models/tarea.dart';
import 'package:flutter/material.dart';


class CrearTareaPage extends StatefulWidget {
  const CrearTareaPage({Key? key}) : super(key: key);

  @override
  State<CrearTareaPage> createState() => _CrearTareaPageState();
}

class _CrearTareaPageState extends State<CrearTareaPage> {

  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text('Nombre')
              ),
              controller: nombreCtrl,
            ),
            TextField(
              decoration: const InputDecoration(
                  label: Text('Descripcion')
              ),
              controller: descripcionCtrl,
            ),
            TextButton(
                onPressed: (){
                  //Controlar que los inputs tengan algo escrito
                  if(descripcionCtrl.text.isNotEmpty && nombreCtrl.text.isNotEmpty){
                    Tarea tarea = Tarea(nombreCtrl.text, descripcionCtrl.text);
                    //Devolver la tarea a la pagina padre
                    Navigator.pop(context, tarea);
                  }
                },
                child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
