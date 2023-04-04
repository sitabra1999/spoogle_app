import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spoogle_app/common/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(12),
      child: InteractiveViewer(
        panEnabled: false, // Set it to false
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 1,
        maxScale: 2,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: 'https://qph.cf2.quoracdn.net/main-qimg-97721a58666447c82e99576d14cc04ba-lq',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: Lottie.asset('assets/animations/lottie-image-loading-improved.json', fit: BoxFit.contain),
              ),
          errorWidget: (context, url, error) => Image.asset("assets/images/app/app_logo_hori_white_bg.png", fit: BoxFit.cover ,),
        )
      ),
    );
  }
}
