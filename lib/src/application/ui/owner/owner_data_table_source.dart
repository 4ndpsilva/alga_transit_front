import 'package:flutter/material.dart';
import 'package:alga_transit_front/src/domain/owner/owner.dart';

class OwnerDataTableSource extends DataTableSource{
  final List<Owner> list;

  final Function(Owner) onView;
  final Function(Owner) onEdit;
  final Function(Owner) onDelete;

  OwnerDataTableSource(this.list, {
    required this.onView,
    required this.onEdit, 
    required this.onDelete
  });

  @override
  DataRow? getRow(int index) {
    if(index >= list.length){
      return null as DataRow;
    }

    final owner = list[index];

    return DataRow(
      key: ValueKey(owner.id),
      cells: [
        DataCell(
          SizedBox(
            width: double.infinity,
            child: Text(owner.name)
          )
        ),
        DataCell(
          SizedBox(
            width: double.infinity,
            child: Text(owner.email)
          )
        ),
        DataCell(
          SizedBox(
            width: double.infinity,
            child: Text(owner.phone),
          )
        ),
        DataCell(
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  tooltip: 'Visualizar',
                  icon: Icon(Icons.visibility),
                  onPressed: () => onView(owner)
                ),
                IconButton(
                  tooltip: 'Editar',
                  onPressed: () => onEdit(owner),
                  icon: Icon(Icons.edit)
                ),
                IconButton(
                  tooltip: 'Exluir',
                  icon: Icon(Icons.delete),
                  onPressed: () => onDelete(owner)
                )
              ]
            ),
          )
        )
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => list.length;

  @override
  int get selectedRowCount => 0;
}