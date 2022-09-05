import 'package:band_names/models/band.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 3),
    Band(id: '3', name: 'Heroes del Silencio', votes: 7),
    Band(id: '4', name: 'Bon Jovi', votes: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title: const Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),


      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i]),

      ),

      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon( Icons.add ),
      ),

    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(band.name!.substring(0,2)),
          ),
          title: Text(band.name!),
          trailing: Text('${ band.votes }', style: const TextStyle( fontSize: 20 ),),
          onTap: (){
            print(band.name);
          },
        );
  }

  addNewBand(){

    final textController = TextEditingController();

    showDialog(
      context: context, 
      builder: ( context ){
        return AlertDialog(
          title: const Text('New band Name'),
          content: const TextField(),
          actions: [
            MaterialButton(
              elevation: 5,
              textColor:Colors.blue ,
              child: const Text('Add'),
              onPressed: (){}
            )
          ],
        );
      }
    );


  }


}