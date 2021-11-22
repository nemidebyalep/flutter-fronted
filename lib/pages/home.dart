import 'package:examenam/models/posts.dart';
import 'package:examenam/pages/edit.dart';
import 'package:examenam/providers/crud.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final functions = new CrudRepo();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title:Text("Lista de Posts")
      ),
      body: FutureBuilder(
        future: functions.getPosts(),
        builder: (BuildContext context,AsyncSnapshot<List<dynamic>> snapshot) {
         
          if(snapshot.hasData){
            
                 
           return ListaPosts(snapshot.data??[]);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
     
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.amber,
      onPressed: (){
        Navigator.pushNamed(context,'create');
      },
    ),
    
    );
  }

  ListView ListaPosts(List<dynamic>snapshot) {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: snapshot.length,
      itemBuilder: (BuildContext context,int index){
         final item  = snapshot[index];

        return   Dismissible(
            key: ValueKey<dynamic>(item),
             onDismissed: (DismissDirection direction) {
               
               functions.deletepost(snapshot[index]['idpost']);
                 setState(() {
              snapshot.removeAt(index);
              functions.getPosts();
            });
            },
          child: Container(
             margin: EdgeInsets.only(bottom: 10),
             decoration: BoxDecoration(
               borderRadius:  BorderRadius.circular(50),
             ),
              child: ClipRRect(
                borderRadius:  BorderRadius.circular(50),
                child: ListTile(
                 onTap: (){
                   Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context)=> new EditPost(post: snapshot[index]))
                   );
                 },
                  tileColor: Colors.amber,
                  subtitle:Text( snapshot[index]['descripcion'],style: TextStyle(
                    color: Colors.white
                  ),),
                
              
                  title:Text(snapshot[index]['titulo'],style: TextStyle(
                    color: Colors.white
                  ), )
                  ),
              ),
            ),
        );

      }
      );
  }
}