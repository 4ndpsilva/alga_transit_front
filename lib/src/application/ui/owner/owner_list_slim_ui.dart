import 'package:flutter/material.dart';
import 'package:alga_transit_front/src/domain/owner/owner_provider.dart';
import 'owner_edit_ui.dart';

class OwnerListSlimUI {
  final OwnerProvider provider;
  final OwnerEditUI ownerEditUI;

  OwnerListSlimUI(this.provider, this.ownerEditUI);
  
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: provider.resultList.length,
      itemBuilder: (context, index){
        final owner = provider.resultList[index];

        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(
              owner.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            subtitle: Text(
              owner.email,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent
              ),
            ),
            trailing: SizedBox(
              width: 144,
              child: Wrap(
                spacing: 4,
                alignment: WrapAlignment.end,
                children: [
                  IconButton(
                    tooltip: 'Visualizar',
                    icon: Icon(Icons.visibility),
                    onPressed: () => ownerEditUI.showDetail(context, owner)
                  ),
                  IconButton(
                    tooltip: 'Editar',
                    icon: Icon(Icons.edit),
                    onPressed: () => ownerEditUI.showFormDialog(context, owner)
                  ),
                  IconButton(
                    tooltip: 'Excluir',
                    icon : Icon(Icons.delete),
                    onPressed: () => ownerEditUI.showDeleteConfirmation(context, owner)
                  )
                ]
              )
            )
          )
        );
      }
    );
  }
}