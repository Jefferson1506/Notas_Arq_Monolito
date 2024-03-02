import 'package:flutter/material.dart';
import 'package:monolito_notas/Data/model.dart';
import 'package:monolito_notas/Data/firebase.dart';
import 'package:monolito_notas/Logica/validacion.dart';

class EditarNotaPage extends StatefulWidget {
  final Notes nota;

  EditarNotaPage({required this.nota});

  @override
  _EditarNotaPageState createState() => _EditarNotaPageState();
}

class _EditarNotaPageState extends State<EditarNotaPage> {
  late TextEditingController tituloController;
  late TextEditingController descripcionController;
  late TextEditingController cuerpoController;

  @override
  void initState() {
    super.initState();
    tituloController = TextEditingController(text: widget.nota.title);
    descripcionController = TextEditingController(text: widget.nota.descrip);
    cuerpoController = TextEditingController(text: widget.nota.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 255, 231, 170),
      appBar: AppBar(
        title: Text('Editar Nota'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: descripcionController,
              decoration: InputDecoration(
                labelText: 'Descripción',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: cuerpoController,
              decoration: InputDecoration(
                labelText: 'Cuerpo',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                animacionCarga(context);
                bool resultado = await updateNote(
                  noteId: widget.nota.id,
                  title: tituloController.text,
                  descrip: descripcionController.text,
                  body: cuerpoController.text,
                );
                if (resultado) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Nota actualizada')),
                  );
                  Navigator.pop(context, true);
                } else {
                   Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error al actualizar nota')),
                  );
                }
              },
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
