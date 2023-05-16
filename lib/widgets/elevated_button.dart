import 'package:flutter/material.dart';

class PElevatedButton extends StatelessWidget {
  final String? text;
  final IconData? icon;

  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final OrientacionIcono? orientacion;
  final double? iconoSize;
  final double? textSize;
  final PosicionIcono? posicionIcono;
  final double borderRadius;
  final TextStyle? estiloTexto;

  const PElevatedButton(
      {Key? key, this.width,
      this.onPressed,
      this.text = '',
      this.icon,
      
      this.height,
      this.orientacion = OrientacionIcono.vertical,
      this.iconoSize,
      this.textSize = 0,
      this.posicionIcono = PosicionIcono.inicio,
      this.borderRadius = 10.0,
      this.estiloTexto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: height ?? 50.0,
        child: ElevatedButton(
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: const BorderSide(
                    width: 2.0,
                    // color: borderColor!,
                    style: BorderStyle.solid,
                  ),
                ))),
            onPressed: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width ?? MediaQuery.of(context).size.width * 0.9,
                  // width: MediaQuery.of(context).size.width * 0.4,
                  child: (orientacion == OrientacionIcono.vertical)
                      //Segun la orientacion trabajo con fila o columna
                      ? Column(children: [
                          if (icon != null &&
                              posicionIcono == PosicionIcono.inicio)
                            Icon(
                              icon,
                              size: iconoSize,
                            ),
                          Text(
                            text!,
                            textAlign: TextAlign.center,
                            style: estiloTexto,
                          ),
                          if (icon != null &&
                              posicionIcono == PosicionIcono.fin)
                            Icon(icon, size: iconoSize),
                        ])
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              if (icon != null &&
                                  posicionIcono == PosicionIcono.inicio)
                                Icon(icon, size: iconoSize),
                              Text(
                                text!,
                                textAlign: TextAlign.center,
                                style: estiloTexto,
                              ),
                              if (icon != null &&
                                  posicionIcono == PosicionIcono.fin)
                                Icon(icon, size: iconoSize),
                            ]),
                ),
              ],
            )));
  }
}

enum OrientacionIcono { vertical, horizontal }
enum PosicionIcono { inicio, fin }