import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi')
  ];

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @verificationfailed.
  ///
  /// In en, this message translates to:
  /// **'Verification failed'**
  String get verificationfailed;

  /// No description provided for @phoneAuth.
  ///
  /// In en, this message translates to:
  /// **'Phone Auth'**
  String get phoneAuth;

  /// No description provided for @enterphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enterphonenumber;

  /// No description provided for @verifyphoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Verify phone Number'**
  String get verifyphoneNumber;

  /// No description provided for @oTPScreen.
  ///
  /// In en, this message translates to:
  /// **'OTP Screen'**
  String get oTPScreen;

  /// No description provided for @entertheOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter the Otp'**
  String get entertheOtp;

  /// No description provided for @oTP.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get oTP;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @keypad.
  ///
  /// In en, this message translates to:
  /// **'Keypad'**
  String get keypad;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @demo.
  ///
  /// In en, this message translates to:
  /// **'Demo'**
  String get demo;

  /// No description provided for @yesterday10_07PM.
  ///
  /// In en, this message translates to:
  /// **'Yesterday 10:07 PM'**
  String get yesterday10_07PM;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get search;

  /// No description provided for @addupto31people.
  ///
  /// In en, this message translates to:
  /// **'Add up to 31 people'**
  String get addupto31people;

  /// No description provided for @frequentlyContacted.
  ///
  /// In en, this message translates to:
  /// **'Frequently Contacted'**
  String get frequentlyContacted;

  /// No description provided for @allContacts.
  ///
  /// In en, this message translates to:
  /// **'All Contacts'**
  String get allContacts;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @contactsonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Contacts on WhatsApp'**
  String get contactsonWhatsApp;

  /// No description provided for @nomessages.
  ///
  /// In en, this message translates to:
  /// **'No messages'**
  String get nomessages;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @askMetaAIorSearch.
  ///
  /// In en, this message translates to:
  /// **'Ask Meta AI or Search'**
  String get askMetaAIorSearch;

  /// No description provided for @lastmessagepreview.
  ///
  /// In en, this message translates to:
  /// **'Last message preview'**
  String get lastmessagepreview;

  /// No description provided for @hSSCGroup.
  ///
  /// In en, this message translates to:
  /// **'HSSC Group'**
  String get hSSCGroup;

  /// No description provided for @requesttojoin.
  ///
  /// In en, this message translates to:
  /// **'Request to join'**
  String get requesttojoin;

  /// No description provided for @announcements.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcements;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @hh15487851454hbcsdwdwdhbxhsbhsbsh.
  ///
  /// In en, this message translates to:
  /// **'+15487851454 hbcsdwdwdh bxhsbhsbsh'**
  String get hh15487851454hbcsdwdwdhbxhsbhsbsh;

  /// No description provided for @groupsyoucanjoin.
  ///
  /// In en, this message translates to:
  /// **'Groups you can join'**
  String get groupsyoucanjoin;

  /// No description provided for @hSSCGroup2022.
  ///
  /// In en, this message translates to:
  /// **'HSSC Group 2022'**
  String get hSSCGroup2022;

  /// No description provided for @addgroup.
  ///
  /// In en, this message translates to:
  /// **'Add group'**
  String get addgroup;

  /// No description provided for @haryanaGovtJobs2025.
  ///
  /// In en, this message translates to:
  /// **'Haryana Govt Jobs 2025'**
  String get haryanaGovtJobs2025;

  /// No description provided for @community_5groups.
  ///
  /// In en, this message translates to:
  /// **'Community • 5 groups'**
  String get community_5groups;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
