import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alga_transit_front/src/domain/owner/owner.dart';
import 'package:alga_transit_front/src/domain/owner/owner_provider.dart';
import 'package:alga_transit_front/src/application/ui/owner/owner_data_table_source.dart';
import 'package:alga_transit_front/src/application/ui/owner/owner_edit_ui.dart';
import 'package:alga_transit_front/src/application/ui/owner/owner_list_slim_ui.dart';

class OwnerListUI extends StatefulWidget{
  
  @override
  OwnerListState createState() => OwnerListState();
}

class OwnerListState extends State<OwnerListUI>{
  final OwnerEditUI ownerEditUI = OwnerEditUI();
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<OwnerProvider>().getAll());
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Proprietários')),
      body: Consumer<OwnerProvider>(
        builder: (context, provider, child){
          if(provider.resultList.isEmpty){
              return Center(child: CircularProgressIndicator());
          }

          final dataSource = OwnerDataTableSource(provider.resultList, onView: _onView, onEdit: _onEdit, onDelete: _onDelete);

          return LayoutBuilder(
            builder: (context, constraints){
              if(constraints.maxWidth < 600){
                final ui = OwnerListSlimUI(provider, ownerEditUI);
                return ui.build(context);
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: PaginatedDataTable(
                    columns: [
                      DataColumn(label: Expanded(child: Text('Nome'))),
                      DataColumn(label: Expanded(child: Text('E-mail'))),
                      DataColumn(label: Expanded(child: Text('Telefone'))),
                      DataColumn(label: Expanded(child: Text('Ações')))
                    ],
                    source: dataSource,
                    rowsPerPage: 10,
                    availableRowsPerPage: [5, 10, 20]
                  )
                )
              );
            }
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        tooltip: 'Adicionar novo',
        onPressed: () => ownerEditUI.showFormDialog(context, Owner.newSelf()),
        child: Icon(Icons.add)
      )
    );
  }

  void _onView(Owner owner){
    ownerEditUI.showDetail(context, owner);
  }

  void _onEdit(Owner owner){
    ownerEditUI.showFormDialog(context, owner);
  }

  void _onDelete(Owner owner){
    ownerEditUI.showDeleteConfirmation(context, owner);
  }
}