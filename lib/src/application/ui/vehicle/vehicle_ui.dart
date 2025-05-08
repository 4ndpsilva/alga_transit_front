import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alga_transit_front/src/domain/vehicle/vehicle_provider.dart';

class VehicleUI extends StatefulWidget{

  @override
  _VehicleUIState createState() => _VehicleUIState();
}

class _VehicleUIState extends State<VehicleUI>{

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<VehicleProvider>().getAll());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Veículos')
      ),
      body: Consumer<VehicleProvider>(
        builder: (context, provider, child){
          if(provider.resultList.isEmpty){
            return Center(child: CircularProgressIndicator());
          }
        
          return ListView.builder(
            itemCount: provider.resultList.length,
            itemBuilder: (context, index){
              final vehicle = provider.resultList[index];
              
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    vehicle.model, 
                    style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                  subtitle: Text(
                    vehicle.brand, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      color: Colors.blueAccent
                    )
                  ),
                  trailing: SizedBox(
                    width: 144,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      spacing: 4,
                      children: [
                        IconButton(
                          tooltip: 'Visualizar',
                          icon: Icon(Icons.visibility),
                          onPressed: () => print('visualizar')
                        ),
                        IconButton(
                          tooltip: 'Editar',
                          icon: Icon(Icons.edit), 
                          onPressed: () => print('editar')
                        ),
                        IconButton(
                          tooltip: 'Excluir',
                          icon: Icon(Icons.delete), 
                          onPressed: () => print('deletar')
                        )
                      ]
                    )
                  )
                )
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() => print('teste'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        tooltip: 'Adicionar Novo',
        child: Icon(Icons.add)
      )
    );
  }
}