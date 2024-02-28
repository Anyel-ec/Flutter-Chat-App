import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

// importar message
class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // todo: imagen
        _ImageBubble( message.imageUrl!  ),

        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
            imageUrl,
            width: size.width * 0.5, // 50% del ancho de la pantalla
            height: size.height * 0.3, // 30% del alto de la pantalla
            fit: BoxFit.cover,
            // icono para cuando se está cargando la imagen
            loadingBuilder: (BuildContext context,
                Widget child,
                // si se está cargando la imagen
                ImageChunkEvent? loadingProgress) {
          // si no se está cargando la imagen
          if (loadingProgress == null) return child;
          return const Center(
            // centrar el icono
            child: CircularProgressIndicator(), // icono de carga
          );
        }));
  }
}
