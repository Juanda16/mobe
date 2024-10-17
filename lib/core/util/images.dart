/// [third-packages]
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// [naming] TP: TokenPad

class Images {
  static String get mobeLogoPath => 'assets/images/logo_mobe_lq.jpg';

  static String get mobeLogoPathNoBG => 'assets/images/logo_mobe_nobg.png';

  static String get backgroundImage => 'assets/images/background_mobe.png';

  static String get defaultIcon => 'assets/images/logo_mobe_lq.jpg';

  static String get defaultUrlIcon => '';

  static String get defaultUrlMotorcycleIcon =>
      'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/defaultbike.jpg&w=350&h=251&q=75&c=1';

  static String get defaultUrlStoreIcon =>
      'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/defaultbike.jpg&w=350&h=251&q=75&c=1';

  static String get loaderIcon => 'assets/loader/mobe2.gif';

  static String get emptyState => 'assets/images/empty_state.svg';

  static String get manAvatar => 'assets/images/avatar_man.svg';

  static String get userIcon => 'assets/icons/usuario.svg';

  static String get emailIcon => 'assets/icons/cartaCorreo.svg';

  static String get lock => 'assets/icons/candado.svg';

  static String get checkedLock => 'assets/icons/CandadoCheck.svg';

  static String get plusButton => 'assets/icons/boton+.svg';

  static String get facebookIcon => 'assets/icons/facebook_icon.svg';

  static String get googleIcon => 'assets/icons/google_icon.svg';

  static Widget _defaultLogoImage(double size) => Image(
        image: AssetImage(mobeLogoPath),
        width: size,
        height: size,
      );

  static Widget _networkImage(String url, double size) {
    final bool isDemoLogo = url.startsWith('https://demo_token');
    final String demoLogo = url.split('/').last;
    final bool isSvgImage = url.endsWith('.svg');

    if (isDemoLogo) {
      return Image(
        image: AssetImage('assets/token_logos/$demoLogo'),
        errorBuilder: (___, __, _) => Image(
          image: AssetImage(defaultIcon),
          width: size,
          height: size,
        ),
        width: size,
        height: size,
      );
    }

    if (isSvgImage) {
      return SvgPicture.network(
        url,
        placeholderBuilder: (_) => Image(
          image: AssetImage(defaultIcon),
          width: size,
          height: size,
          errorBuilder: (___, __, _) => Image(
            image: AssetImage(defaultIcon),
            width: size,
            height: size,
          ),
        ),
        height: size,
        width: size,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        placeholder: (__, _) => Image(
          image: AssetImage(defaultIcon),
          width: size,
          height: size,
        ),
        errorWidget: (___, __, _) => Image(
          image: AssetImage(defaultIcon),
          width: size,
          height: size,
        ),
        fadeOutDuration: const Duration(milliseconds: 300),
        width: size,
        height: size,
      );
    }
  }

  /// Draw token logo from url if not null and is not empty or default token logo if it is.
  static Widget getUrlLogo(
          {required String? logoUrl, double size = 32, BorderRadius? borderRadius}) =>
      ClipRRect(
        borderRadius: (borderRadius == null) ? BorderRadius.circular(size / 2) : borderRadius,
        child: (logoUrl == null || logoUrl.isEmpty)
            ? Images._defaultLogoImage(size)
            : Images._networkImage(
                logoUrl,
                size,
              ),
      );

  static Widget buildSvgImage(String url, {double? width, double? height}) =>
      SvgPicture.asset(url, width: width, height: height);

  static Widget buildSvgPngImage(String url, {double? width, double? height}) {
    final bool isSvgImage = url.contains('.svg');

    return isSvgImage
        ? SvgPicture.asset(url, width: width, height: height)
        : Image.asset(url, width: width, height: height);
  }

  static Widget mobeLogo({double? height = 20}) => buildSvgPngImage(mobeLogoPath, height: height);
}
