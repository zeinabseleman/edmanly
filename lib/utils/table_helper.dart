import 'package:flutter/material.dart';

columnBlueprint(columnCount, columns) {
  var data = List.generate(
      columnCount, (index) => {'title': '', 'index': index, 'key': index});
  columns = [...data];
  return columns;
}

rowBlueprint(int rowCount, columns, rows) {
  List sampleRow = [];
  for (var i = 0; i < rowCount; i++) {
    var item = {};
    columns.forEach((element) {
      item[element['key']] = '';
    });
    sampleRow.add(item);
  }
  rows = [...sampleRow];
  return rows;
}

addOneRow(columns, rows) {
  var item = {};
  columns.forEach((element) {
    item[element['key']] = '';
  });
  rows.add(item);
  return rows;
}

Widget iconColumn(showDeleteIcon, thPaddingTop, thPaddingBottom,
    {rightPadding = 0.0, leftPadding = 0.0}) {
  return Visibility(
    visible: showDeleteIcon,
    child: Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.only(
          top: thPaddingTop,
          bottom: thPaddingBottom,
          right: rightPadding,
          left: leftPadding,
        ),
      ),
    ),
  );
}

Widget editIconColumn(showEditIcon, thPaddingTop, thPaddingBottom,
    {rightPadding = 0.0, leftPadding = 0.0}) {
  return Visibility(
    visible: showEditIcon,
    child: Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.only(
          top: thPaddingTop,
          bottom: thPaddingBottom,
          right: rightPadding,
          left: leftPadding,
        ),
      ),
    ),
  );
}
