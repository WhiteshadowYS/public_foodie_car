import 'package:flutter/material.dart';

Future showClientDropdown({
  @required BuildContext context,
  @required List<Map<String, dynamic>> list,
  @required void Function(bool) whenSheetDispose,
  @required void Function(int) onItemSelected,
  @required String printedParam,
  @required String title,
}) async {
  return showModalBottomSheet<dynamic>(
    elevation: 0.0,
    clipBehavior: Clip.hardEdge,
    context: context,
    builder: (context) {
      return ClientDropdown(
        list: list,
        onItemSelected: onItemSelected,
        whenSheetDispose: whenSheetDispose,
        printedParam: printedParam,
        title: title,
      );
    },
  );
}

class ClientDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final void Function(bool) whenSheetDispose;
  final void Function(int) onItemSelected;
  final String printedParam;
  final String title;

  ClientDropdown({
    @required this.list,
    @required this.onItemSelected,
    @required this.whenSheetDispose,
    @required this.printedParam,
    @required this.title,
  }) : super(key: Key('ClientDropdown'));

  @override
  _ClientDropdownState createState() => _ClientDropdownState();
}

class _ClientDropdownState extends State<ClientDropdown> {
  bool isForceClose = true;

  @override
  void dispose() {
    if (widget.whenSheetDispose != null) {
      widget.whenSheetDispose(isForceClose);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Container(
            height: 24,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.red,
                      size: 17.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 34.0,
                    ),
                    child: Text(
                      widget.title ?? 'EMPTY_STRING',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(color: Colors.black26, height: 1.0),
          Container(
            height: 240,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            color: Colors.white,
            child: ListView.builder(
              itemCount: widget.list.length,
              itemBuilder: (BuildContext context, int index) {
                if (widget.printedParam == null ||
                    widget.printedParam.isEmpty ||
                    widget.list[index][widget.printedParam] == null ||
                    widget.list[index][widget.printedParam].isEmpty ||
                    widget.list[index][widget.printedParam] == ' ') {
                  return Container();
                }

                if (widget.list.length - 1 == index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        isForceClose = false;
                      });
                      widget.onItemSelected(index);
                    },
                    child: Container(
                      height: 45.0,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        widget.list[index][widget.printedParam],
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isForceClose = false;
                        });
                        widget.onItemSelected(index);
                      },
                      child: Container(
                        height: 45.0,
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          widget.list[index][widget.printedParam],
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(color: Colors.black26, height: 1.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
