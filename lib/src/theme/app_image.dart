// ignore_for_file: non_constant_identifier_names

class AppImages {
  static String ali_fouad_logo = 'im_ali_fouad_logo.png'.imageAssetPath;
}

extension ImageExtension on String {
  String get imageAssetPath => 'assets/images/$this';
}
