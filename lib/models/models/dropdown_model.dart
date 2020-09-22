class DropdownModel {
  final String title;
  final String printedParam;

  final List<Map<String, dynamic>> list;

  final void Function(bool) whenSheetDispose;
  final void Function(int) onItemSelected;

  DropdownModel({
    this.title,
    this.printedParam,

    this.list,

    this.onItemSelected,
    this.whenSheetDispose,
  });
}
