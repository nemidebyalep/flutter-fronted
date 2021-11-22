import 'package:examenam/providers/crud.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  dynamic post;

  EditPost({this.post});
  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController? titulo;
  TextEditingController? descripcion;
   int?  id; 

  @override
  void initState() {
    titulo = new TextEditingController(text: widget.post['titulo']);
    id= widget.post['idpost'];
    descripcion = new TextEditingController(text: widget.post['descripcion']);
  }

  final functions = new CrudRepo();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Editar Post"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            new Column(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(Icons.title, color: Colors.black),
                  title: new TextFormField(
                    controller: titulo,
                    decoration: InputDecoration(labelText: 'Titulo'),
                  ),
                ),
                new ListTile(
                  leading: Icon(Icons.description, color: Colors.black),
                  title: TextFormField(
                    controller: descripcion,
                    decoration: InputDecoration(labelText: 'Descripcion'),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new TextButton(
                  child: new Text(
                    "Modificar",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    final snackBar = SnackBar(
                      content: const Text('Post modificado!'),
                      action: SnackBarAction(
                        label: 'ok',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    final snackBa2r = SnackBar(
                      content: const Text('Error al modificar!'),
                      action: SnackBarAction(
                        label: 'ok',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    final resp = await functions.update(
                        titulo?.text, descripcion?.text,id);
                    if (resp) {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamed(context, '/');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBa2r);
                    }
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.green),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
