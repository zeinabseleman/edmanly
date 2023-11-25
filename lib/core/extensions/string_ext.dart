

import '../../domain/language/app_localizations.dart';

extension Languange on String {
  String get tr => AppLocalizations.instance.trans (this);
}

extension Validations on String {
  bool get isIp => RegExp(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}').hasMatch(this);
  bool get isNullId => this == "00000000-0000-0000-0000-000000000000";

  bool get isBase64Valid {
    const String base64Pattern =
        r'^([A-Za-z0-9+/]{4})*([A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{2}==)?$';
    try {
      RegExp base64RegularExpression = RegExp(base64Pattern);
      if (base64RegularExpression.hasMatch(this)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  int versionToNumber({bool upgrade = false}) {
    int ret = 0;
    List<int> versionInts =
        split(".").reversed.map((e) => int.tryParse(e) ?? 0).toList();
    for (int index = upgrade ? 1 : 0; index < versionInts.length; index++) {
      int indexMultiplier = (10 * index);
      indexMultiplier = indexMultiplier > 0 ? indexMultiplier : 1;
      ret += versionInts[index] * indexMultiplier;
    }

    return ret;
  }
}
