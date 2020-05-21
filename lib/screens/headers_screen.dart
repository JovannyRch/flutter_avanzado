import 'package:flutter/material.dart';
import 'package:flutter_avanzado/widgets/headers_widgets.dart';

class HeadersHome extends StatelessWidget {
  final int tipo;
  HeadersHome({this.tipo = 1});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: getHeader(this.tipo),
      ),
    );
  }

  Widget getHeader(int opc) {
    print("Valor del opc $opc");
    switch (opc) {
      case 1:
        return SquareHeader();
      case 2:
        return RoundedHeader();
      case 3:
        return HeaderDiagonal();
      case 4:
        return HeaderTriangulo();

      case 5:
        return HeaderCurvo();

      case 6:
        return HeaderWave();
      case 7:
        return HeaderGradiente();
      default:
    }
    return HeaderGradiente();
  }
}
