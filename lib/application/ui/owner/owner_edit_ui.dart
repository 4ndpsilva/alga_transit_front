import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alga_transit_front/infrastructure/toast.dart';
import 'package:alga_transit_front/domain/owner/owner_provider.dart';
import 'package:alga_transit_front/domain/owner/owner.dart';

class OwnerEditUI{

  void showDetail(BuildContext context, Owner  owner){
    showDialog(
      context: context,
      builder: (BuildContext context){

        List<Widget> children = [
          TextField(
            decoration: InputDecoration(hintText: 'Código'),
            onChanged: (value) => owner.id = int.parse(value),
            controller: TextEditingController(text: owner.id.toString()),
            enabled: false
          )
        ];

        children.addAll(_buildListFields(owner, false));

        return AlertDialog(
          title: Text('Detalhes do Proprietário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: children
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: () => Navigator.pop(context),
            )
          ]
        );
      }
    );
  }

  void showFormDialog(BuildContext context, Owner owner){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${_existsOwner(owner) ? 'Edição' : 'Adição'} de Proprietário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: _buildListFields(owner, true)
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'), 
              onPressed: () => Navigator.pop(context)
            ),
            TextButton(
              child: Text('Salvar'), 
              onPressed: () {
                if(_existsOwner(owner)){
                  context.read<OwnerProvider>().update(owner);
                  toast(context, 'Proprietário alterado com sucesso');
                }
                else{
                  context.read<OwnerProvider>().save(owner);
                  toast(context, 'Proprietário adicionado com sucesso');
                }

                Navigator.pop(context);
              }
            )
          ]
        );
      }
    );
  }

  void showDeleteConfirmation(BuildContext context, Owner owner){
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exlusão de Proprietário'),
          content: Text('Deseja excluir o proprietário ${owner.name}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Não')
            ),
            TextButton(
              onPressed: () {
                context.read<OwnerProvider>().delete(owner.id);
                toast(context, 'Exclusão realizada com sucesso');
                Navigator.pop(context);
              }, 
              child: Text('Sim')
            )
          ]
        );
      });
  }

  List<Widget> _buildListFields(Owner owner, bool enabled){
    return [
      TextField(
        decoration: InputDecoration(hintText: 'Nome'),
        onChanged: (value) => owner.name = value,
        controller: TextEditingController(text: owner.name),
        enabled: enabled
      ),
      TextField(
        decoration: InputDecoration(hintText: 'E-mail'),
        onChanged: (value) => owner.email = value,
        controller: TextEditingController(text: owner.email),
        enabled: enabled
      ),
      TextField(
        decoration: InputDecoration(hintText: 'Telefone'),
        onChanged: (value) => owner.phone = value,
        controller: TextEditingController(text: owner.phone),
        enabled: enabled
      )
    ];
  }

  bool _existsOwner(Owner owner) => owner.id > 0;
}