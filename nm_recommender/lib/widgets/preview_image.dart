import 'package:flutter/material.dart';
import 'package:nm_recommender/widgets/loading.dart';
import '../assets/style.dart';

class PreviewImage extends StatelessWidget {
  final String urlImage;
  final double width, height;
  final VoidCallback callBack;
  final bool isLoading;

  const PreviewImage({
    Key? key,
    required this.urlImage,
    required this.width,
    required this.height,
    required this.callBack,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: ThemeColor.shadow,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: isLoading
              ? LoadingScreen()
              : Image.network(
                  urlImage,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: LoadingScreen(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
