import '../resource/app_strings.dart';
import '../resource/app_french_strings.dart';
import '../resource/app_english_strings.dart';

class AppSettings {

  static const String APP_TOKEN="";
  static const int SPLASHSCREEN_DURATION = 3;
  static const String APP_VERSION='v0_Beta';
  static const String APP_NAME='7check';

  static const String APP_PROFILE="Profil";

  static const String APP_DASHBOARD='Réservations';
  static const String APP_UPDATERESERVATION='Modifier une réservation';

  static const String APP_RESTITUEDCAR='Voitures à restituer';
  static const String APP_ADDRESTITUEDCAR='Ajouter une voiture à restituer';
  static const String APP_UPDATERESTITUEDCAR='Modifier une voiture à restituer';

  static const String APP_RETIREDCAR='Voitures à retirer';
  static const String APP_RETIREDCARFORM='Fiche de voiture à retirer';
  static const String APP_ADDRETIREDCAR='Ajouter une voiture à retirer';
  static const String APP_UPDATERETIREDCAR='Modifier une voiture à retirer';

  static const String APP_LOGO_URI='assets/images/7check.png';
  static const String APP_LANGUAGE="fr";

  static AppStrings get strings {
    switch (APP_LANGUAGE) {
      case 'fr':
        return AppFrenchStrings();
      default:
        return AppEnglishStrings();
    }
  }

}