import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// Title for the Pokédex home page
  ///
  /// In en, this message translates to:
  /// **'Pokédex'**
  String get pokedex;

  /// Button label to retry an action
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Error message when something fails
  ///
  /// In en, this message translates to:
  /// **'Something went wrong...'**
  String get somethingWentWrong;

  /// Title for the favorites page
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Empty state title when no favorites
  ///
  /// In en, this message translates to:
  /// **'You haven\'t marked any Pokémon as favorite'**
  String get noFavoritesTitle;

  /// Empty state description for favorites
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on your favorite Pokémon and they will appear here.'**
  String get noFavoritesDescription;

  /// Section title for Pokémon weaknesses
  ///
  /// In en, this message translates to:
  /// **'Weaknesses'**
  String get weaknesses;

  /// Error widget title
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get errorOops;

  /// Error widget message
  ///
  /// In en, this message translates to:
  /// **'Sorry, something went wrong'**
  String get errorSomethingWentWrong;

  /// Header for first onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Onboarding 01'**
  String get onboarding01Header;

  /// Title for first onboarding slide
  ///
  /// In en, this message translates to:
  /// **'All Pokémon in\none place'**
  String get onboarding01Title;

  /// Description for first onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Access a wide list of Pokémon from all generations created by Nintendo.'**
  String get onboarding01Description;

  /// Header for second onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Onboarding 02'**
  String get onboarding02Header;

  /// Title for second onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Keep your Pokédex\nup to date'**
  String get onboarding02Title;

  /// Description for second onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Sign up and save your profile, favorite Pokémon, settings and much more in the app.'**
  String get onboarding02Description;

  /// Button label on last onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started'**
  String get onboardingButtonStart;

  /// Button label to go to next onboarding slide
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingButtonContinue;

  /// Title for regions coming soon placeholder
  ///
  /// In en, this message translates to:
  /// **'Coming soon!'**
  String get regionsComingSoonTitle;

  /// Description for regions coming soon placeholder
  ///
  /// In en, this message translates to:
  /// **'We are working to bring you this section. Come back later to discover all the new features.'**
  String get regionsComingSoonDescription;

  /// Profile page title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// Trainer info section header
  ///
  /// In en, this message translates to:
  /// **'TRAINER INFO'**
  String get trainerInfo;

  /// Battle experience section header
  ///
  /// In en, this message translates to:
  /// **'BATTLE EXPERIENCE'**
  String get battleExperience;

  /// Trainer skills section header
  ///
  /// In en, this message translates to:
  /// **'TRAINER SKILLS'**
  String get trainerSkills;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name:'**
  String get labelName;

  /// Role field label
  ///
  /// In en, this message translates to:
  /// **'Role:'**
  String get labelRole;

  /// Location field label
  ///
  /// In en, this message translates to:
  /// **'Location:'**
  String get labelLocation;

  /// Age label
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get labelAge;

  /// LinkedIn button text
  ///
  /// In en, this message translates to:
  /// **'VIEW PROFILE ON LINKEDIN'**
  String get viewProfileOnLinkedin;

  /// Filter panel title
  ///
  /// In en, this message translates to:
  /// **'Filter by your preferences'**
  String get filterByPreferences;

  /// Filter section for Pokémon type
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get filterType;

  /// Apply filter button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
