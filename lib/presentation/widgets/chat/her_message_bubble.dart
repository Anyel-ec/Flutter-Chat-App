import 'package:flutter/material.dart';
// importar message 
class HerMessageBubble extends StatelessWidget {


  const HerMessageBubble({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Anyel EC',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // todo: imagen
        _ImageBubble(),

        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          'https://yesno.wtf/assets/yes/3-422e51268d64d78241720a7de52fe121.gif',
          width: size.width * 0.5, // 50% del ancho de la pantalla
          height: size.height * 0.3, // 30% del alto de la pantalla
          fit: BoxFit.cover,
          // icono para cuando se está cargando la imagen
          loadingBuilder: (BuildContext context, Widget child,
              // si se está cargando la imagen
              ImageChunkEvent? loadingProgress) {
            // si no se está cargando la imagen
            if (loadingProgress == null) return child;
            return const Center( // centrar el icono
              child: CircularProgressIndicator(), // icono de carga
            );
          }
        ));
  }
}
