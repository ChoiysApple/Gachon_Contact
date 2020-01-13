import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:gachon_contact/values.dart';


class FirstTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFF),
      child: ListView.builder(
          itemCount: executive_name.length,
          itemBuilder: (context, index) {
            return SimpleFoldingCell(
                frontWidget: _buildFrontWidget(index),
                innerTopWidget: _buildInnerTopWidget(index),
                innerBottomWidget: _buildInnerBottomWidget(index),
                cellSize: Size(MediaQuery.of(context).size.width, 125),
                padding: EdgeInsets.all(15),
                animationDuration: Duration(milliseconds: 100),
                borderRadius: 10,
                onOpen: () => print('$index cell opened'),
                onClose: () => print('$index cell closed'));
          }),
    );
  }


  Widget _buildFrontWidget(int index) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
            color: Color(0xFF1565C0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(executive_name.elementAt(index),
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800)),
                FlatButton(
                  onPressed: () {
                    SimpleFoldingCellState foldingCellState =
                    context.ancestorStateOfType(
                        TypeMatcher<SimpleFoldingCellState>());
                    foldingCellState?.toggleFold();
                  },
                  child: Text(
                    "Open",
                  ),
                  textColor: Colors.black,
                  color: Colors.white,
                  splashColor: Colors.white.withOpacity(0.5),
                )
              ],
            ));
      },
    );
  }

  Widget _buildInnerTopWidget(int index) {
    return Container(
        color: Color(0xFF121212),
        alignment: Alignment.center,
        child: Text(executive_contact.elementAt(index),
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontFamily: 'OpenSans',
                fontSize: 15.0,
                fontWeight: FontWeight.w800)));
  }

  Widget _buildInnerBottomWidget(int index) {
    return Builder(builder: (context) {
      return Container(
        color: Color(0xFFecf2f9),
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: FlatButton(
            onPressed: () {
              SimpleFoldingCellState foldingCellState = context
                  .ancestorStateOfType(TypeMatcher<SimpleFoldingCellState>());
              foldingCellState?.toggleFold();
            },
            child: Text(
              "Close",
            ),
            textColor: Colors.white,
            color: Colors.indigoAccent,
            splashColor: Colors.white.withOpacity(0.5),
          ),
        ),
      );
    });
  }
}
