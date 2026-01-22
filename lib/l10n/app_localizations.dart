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

  /// No description provided for @newcommunity.
  ///
  /// In en, this message translates to:
  /// **'New community'**
  String get newcommunity;

  /// No description provided for @hudhhuhewnssxhwu.
  ///
  /// In en, this message translates to:
  /// **'hudh huhewns sxhwu'**
  String get hudhhuhewnssxhwu;

  /// No description provided for @viewall.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewall;

  /// No description provided for @hudhhuheud.
  ///
  /// In en, this message translates to:
  /// **'hudh huheud'**
  String get hudhhuheud;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @mystatus.
  ///
  /// In en, this message translates to:
  /// **'My status'**
  String get mystatus;

  /// No description provided for @taptoaddstatus.
  ///
  /// In en, this message translates to:
  /// **'Tap to add status'**
  String get taptoaddstatus;

  /// No description provided for @minutesago.
  ///
  /// In en, this message translates to:
  /// **'25 minutes ago'**
  String get minutesago;

  /// No description provided for @recentupdates.
  ///
  /// In en, this message translates to:
  /// **'Recent updates'**
  String get recentupdates;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @viewedupdates.
  ///
  /// In en, this message translates to:
  /// **'Viewed updates'**
  String get viewedupdates;

  /// No description provided for @channels.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channels;

  /// No description provided for @stayupdatedontopicsthatmatterstoyouFindchannelstofollowbelow.
  ///
  /// In en, this message translates to:
  /// **'Stay updated on topics that matters to you. Find channels to follow below.'**
  String get stayupdatedontopicsthatmatterstoyouFindchannelstofollowbelow;

  /// No description provided for @findchannelstofollow.
  ///
  /// In en, this message translates to:
  /// **'Find channels to follow'**
  String get findchannelstofollow;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'574K followers'**
  String get followers;

  /// No description provided for @follow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get follow;

  /// No description provided for @exploremore.
  ///
  /// In en, this message translates to:
  /// **'Explore more'**
  String get exploremore;

  /// No description provided for @createchannel.
  ///
  /// In en, this message translates to:
  /// **'Create channel'**
  String get createchannel;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @newgroup.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get newgroup;

  /// No description provided for @broadcastlists.
  ///
  /// In en, this message translates to:
  /// **'Broadcast lists'**
  String get broadcastlists;

  /// No description provided for @linkeddevices.
  ///
  /// In en, this message translates to:
  /// **'Linked devices'**
  String get linkeddevices;

  /// No description provided for @starred.
  ///
  /// In en, this message translates to:
  /// **'Starred'**
  String get starred;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @readall.
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get readall;

  /// No description provided for @statusprivacy.
  ///
  /// In en, this message translates to:
  /// **'Status privacy'**
  String get statusprivacy;

  /// No description provided for @clearcalllog.
  ///
  /// In en, this message translates to:
  /// **'Clear call log'**
  String get clearcalllog;

  /// No description provided for @scheduledcalls.
  ///
  /// In en, this message translates to:
  /// **'Scheduled calls'**
  String get scheduledcalls;

  /// No description provided for @chats.
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get chats;

  /// No description provided for @updates.
  ///
  /// In en, this message translates to:
  /// **'Updates'**
  String get updates;

  /// No description provided for @communities.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get communities;

  /// No description provided for @calls.
  ///
  /// In en, this message translates to:
  /// **'Calls'**
  String get calls;

  /// No description provided for @addnewaccount.
  ///
  /// In en, this message translates to:
  /// **'Add new account'**
  String get addnewaccount;

  /// No description provided for @addWhatsAppaccount.
  ///
  /// In en, this message translates to:
  /// **'Add WhatsApp account'**
  String get addWhatsAppaccount;

  /// No description provided for @changenumber.
  ///
  /// In en, this message translates to:
  /// **'Change number'**
  String get changenumber;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @changingyourphonenumberwillmigrateyouraccountinfogroupssettings.
  ///
  /// In en, this message translates to:
  /// **'Changing your phone number will migrate your account info, groups & settings.'**
  String get changingyourphonenumberwillmigrateyouraccountinfogroupssettings;

  /// No description provided for @beforeproceedingpleaseconfirmthatyouareabletoreceiveSMScallsatyournewnumber.
  ///
  /// In en, this message translates to:
  /// **'Before proceeding, please confirm that you are able to receive SMS calls at your new number.'**
  String get beforeproceedingpleaseconfirmthatyouareabletoreceiveSMScallsatyournewnumber;

  /// No description provided for @ifyouhavebothanewphoneanewnumberfirstchangeyournumberonyouroldphone.
  ///
  /// In en, this message translates to:
  /// **'If you have both a new phone & a new number, first change your number on your old phone.'**
  String get ifyouhavebothanewphoneanewnumberfirstchangeyournumberonyouroldphone;

  /// No description provided for @deletethisaccount.
  ///
  /// In en, this message translates to:
  /// **'Delete this account'**
  String get deletethisaccount;

  /// No description provided for @ifyoudeletethisaccount.
  ///
  /// In en, this message translates to:
  /// **'If you delete this account'**
  String get ifyoudeletethisaccount;

  /// No description provided for @theaccountwillbedeletedfromWhatsAppandallyourdevices.
  ///
  /// In en, this message translates to:
  /// **'The account will be deleted from WhatsApp and all your devices'**
  String get theaccountwillbedeletedfromWhatsAppandallyourdevices;

  /// No description provided for @yourmessagehistorywillbeerased.
  ///
  /// In en, this message translates to:
  /// **'Your message history will be erased'**
  String get yourmessagehistorywillbeerased;

  /// No description provided for @youwillberemovedfromallyourWhatsAppgroups.
  ///
  /// In en, this message translates to:
  /// **'You will be removed from all your WhatsApp groups'**
  String get youwillberemovedfromallyourWhatsAppgroups;

  /// No description provided for @deleteyourpaymentshistoryandcancelanypendingpayments.
  ///
  /// In en, this message translates to:
  /// **'Delete your payments history and cancel any pending payments'**
  String get deleteyourpaymentshistoryandcancelanypendingpayments;

  /// No description provided for @anychannelsyoucreatedwillbedeleted.
  ///
  /// In en, this message translates to:
  /// **'Any channels you created will be deleted'**
  String get anychannelsyoucreatedwillbedeleted;

  /// No description provided for @anyactivechannelsubscriptionsassociatedwiththisaccountwillbecanceled.
  ///
  /// In en, this message translates to:
  /// **'Any active channel subscriptions associated with this account will be canceled'**
  String get anyactivechannelsubscriptionsassociatedwiththisaccountwillbecanceled;

  /// No description provided for @changenumberinsted.
  ///
  /// In en, this message translates to:
  /// **'Change number insted?'**
  String get changenumberinsted;

  /// No description provided for @todeleteyouraccountconfirmyourcountrycodeandenteryourphonenumber.
  ///
  /// In en, this message translates to:
  /// **'To delete your account, confirm your country code and enter your phone number'**
  String get todeleteyouraccountconfirmyourcountrycodeandenteryourphonenumber;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @india.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get india;

  /// No description provided for @phonenumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phonenumber;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @addyouremail.
  ///
  /// In en, this message translates to:
  /// **'Add your email'**
  String get addyouremail;

  /// No description provided for @emailhelpsusverifyyouraccountorreachyouincaseofsecurityorsupportissuesyouremailaddressWontbevisibletoothers.
  ///
  /// In en, this message translates to:
  /// **'Email helps us verify your account or reach you in case of security or support issues. your email address Won\'t be visible to others'**
  String get emailhelpsusverifyyouraccountorreachyouincaseofsecurityorsupportissuesyouremailaddressWontbevisibletoothers;

  /// No description provided for @leaenmore.
  ///
  /// In en, this message translates to:
  /// **'Leaen more'**
  String get leaenmore;

  /// No description provided for @enteryouremail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enteryouremail;

  /// No description provided for @helparticle.
  ///
  /// In en, this message translates to:
  /// **'Help article'**
  String get helparticle;

  /// No description provided for @openinbrowser.
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get openinbrowser;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @copylink.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get copylink;

  /// No description provided for @aboutsecuritycodechangenotifications.
  ///
  /// In en, this message translates to:
  /// **'About security code change notifications'**
  String get aboutsecuritycodechangenotifications;

  /// No description provided for @endtoendencryptedchatsbetweenyouandoneotherpersonhavetheirownsecuritycodethiscodeisusedtoverifythatthecallsandthemessagesyousendtothatchatareendtoendencrypted.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encrypted chats between you and one other person have their own security code. this code is used to verify that the calls and the messages you send to that chat are end-to-end encrypted'**
  String get endtoendencryptedchatsbetweenyouandoneotherpersonhavetheirownsecuritycodethiscodeisusedtoverifythatthecallsandthemessagesyousendtothatchatareendtoendencrypted;

  /// No description provided for @thesecuritycodecanbefoundinthecontactinfoscreenbothasaQRcodeanda60digitnumberthesecodesareuniquetoeachindividualchattheycanbecomparedbetweenpeopleineachchattoverifythatthemessagesyousendtothechatareendtoendencyptedsecuritycodesarejustvisibleversionsofthespecialkeyssharedbetweenyouDontworryitsnottheactualkeysthemselveswhicharealwayskeptsecret.
  ///
  /// In en, this message translates to:
  /// **'The security code can be found in the contact info screen, both as a QR code and a 60-digit number. these codes are unique to each individual chat. they can be compared between people in each chat to verify that the messages you send to the chat are end-to-end encypted.security codes are just visible versions of the special keys shared between you. Don\'t worry,it\'s not the actual keys themselves, which are always kept secret'**
  String get thesecuritycodecanbefoundinthecontactinfoscreenbothasaQRcodeanda60digitnumberthesecodesareuniquetoeachindividualchattheycanbecomparedbetweenpeopleineachchattoverifythatthemessagesyousendtothechatareendtoendencyptedsecuritycodesarejustvisibleversionsofthespecialkeyssharedbetweenyouDontworryitsnottheactualkeysthemselveswhicharealwayskeptsecret;

  /// No description provided for @attimesthesecuritycodesusedinendtoendencryptedchatsbetweenyouandoneotherpersonmightchangeThisislikelybecauseyouoryourcontactreinstalledWhatsAppchangedphonesoraddedorremovedapaireddeviceYoucanalwaysverifythatacontactssecuritycodeislegitimte.
  ///
  /// In en, this message translates to:
  /// **'At times, the security codes used in end-to-end encrypted chats between you and one other person might change. This is likely because you or your contact reinstalled WhatsApp, changed phones, or added or removed a paired device. You can always verify that a contact\'s security code is legitimte.'**
  String get attimesthesecuritycodesusedinendtoendencryptedchatsbetweenyouandoneotherpersonmightchangeThisislikelybecauseyouoryourcontactreinstalledWhatsAppchangedphonesoraddedorremovedapaireddeviceYoucanalwaysverifythatacontactssecuritycodeislegitimte;

  /// No description provided for @learnhowin.
  ///
  /// In en, this message translates to:
  /// **'Learn how in'**
  String get learnhowin;

  /// No description provided for @thisarticle.
  ///
  /// In en, this message translates to:
  /// **'this article'**
  String get thisarticle;

  /// No description provided for @onendtoendencryption.
  ///
  /// In en, this message translates to:
  /// **'on end-to-end encryption'**
  String get onendtoendencryption;

  /// No description provided for @receivenotificationwhensecuritycodeschange.
  ///
  /// In en, this message translates to:
  /// **'Receive notification when security codes change'**
  String get receivenotificationwhensecuritycodeschange;

  /// No description provided for @youcanreceivenotificationswhenyoursecuritycodechangesforacontactsphoneinanendtoendencryptedchattodosoyoullneedtoenablethesettingoneachdevicewhereyouwanttogetnotifications.
  ///
  /// In en, this message translates to:
  /// **'You can receive notifications when your security code changes for a contact\'s phone in an end-to-end encrypted chat. to do so, you\'ll need to enable the setting on each device where you want to get notifications'**
  String get youcanreceivenotificationswhenyoursecuritycodechangesforacontactsphoneinanendtoendencryptedchattodosoyoullneedtoenablethesettingoneachdevicewhereyouwanttogetnotifications;

  /// No description provided for @enablesecuritycodenotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable security code notifications'**
  String get enablesecuritycodenotifications;

  /// No description provided for @tellusalittlemore.
  ///
  /// In en, this message translates to:
  /// **'Tell us a little more'**
  String get tellusalittlemore;

  /// No description provided for @submitfeedback.
  ///
  /// In en, this message translates to:
  /// **'Submit feedback'**
  String get submitfeedback;

  /// No description provided for @doesthisansweryourquestion.
  ///
  /// In en, this message translates to:
  /// **'Does this answer your question?'**
  String get doesthisansweryourquestion;

  /// No description provided for @yourresponseisanonymoushelpsusimproveourhelpresources.
  ///
  /// In en, this message translates to:
  /// **'Your response is anonymous helps us improve our help resources'**
  String get yourresponseisanonymoushelpsusimproveourhelpresources;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @turnoffShowsecuritynotificationsonthisdevice.
  ///
  /// In en, this message translates to:
  /// **'Turn off Show security notifications on this device.'**
  String get turnoffShowsecuritynotificationsonthisdevice;

  /// No description provided for @thanksforlettingusknow.
  ///
  /// In en, this message translates to:
  /// **'Thanks for letting us know!'**
  String get thanksforlettingusknow;

  /// No description provided for @welluseyourfeedbacktohelpimproveWhatsAppsupport.
  ///
  /// In en, this message translates to:
  /// **'We\'ll use your feedback to help improve WhatsApp support'**
  String get welluseyourfeedbacktohelpimproveWhatsAppsupport;

  /// No description provided for @passkeys.
  ///
  /// In en, this message translates to:
  /// **'Passkeys'**
  String get passkeys;

  /// No description provided for @manageyourpasskey.
  ///
  /// In en, this message translates to:
  /// **'Manage your passkey'**
  String get manageyourpasskey;

  /// No description provided for @accessWhatsAppthesamewayyouunloackyourphonewithyourfingerprintfaceorscreenlockyourpasskeygivesyouasecureandeasywaytologbackintoyouraccount.
  ///
  /// In en, this message translates to:
  /// **'Access WhatsApp the same way you unloack your phone. with your fingerprint, face or screen lock. your passkey gives you a secure and easy way to log back into your account'**
  String get accessWhatsAppthesamewayyouunloackyourphonewithyourfingerprintfaceorscreenlockyourpasskeygivesyouasecureandeasywaytologbackintoyouraccount;

  /// No description provided for @thiswillbeusedtoverifyYouraccount.
  ///
  /// In en, this message translates to:
  /// **'This will be used to verify your account'**
  String get thiswillbeusedtoverifyYouraccount;

  /// No description provided for @deletepasskey.
  ///
  /// In en, this message translates to:
  /// **'Delete passkey?'**
  String get deletepasskey;

  /// No description provided for @ifyoudeletethispasskeyyouwontbeabletouseittologintoyouraccount.
  ///
  /// In en, this message translates to:
  /// **'If you delete this passkey, you won\'t be able to use it to log into your account'**
  String get ifyoudeletethispasskeyyouwontbeabletouseittologintoyouraccount;

  /// No description provided for @ifyoudevicetodeletebesuretoalsodeletethepasskeyfromyourdevicepasswordmanager.
  ///
  /// In en, this message translates to:
  /// **'If you device to delete, be sure to also delete the passkey from your device password manager.'**
  String get ifyoudevicetodeletebesuretoalsodeletethepasskeyfromyourdevicepasswordmanager;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @requestaccountinfo.
  ///
  /// In en, this message translates to:
  /// **'Request account info'**
  String get requestaccountinfo;

  /// No description provided for @accountinformation.
  ///
  /// In en, this message translates to:
  /// **'Account information'**
  String get accountinformation;

  /// No description provided for @channelsactivity.
  ///
  /// In en, this message translates to:
  /// **'Channels activity'**
  String get channelsactivity;

  /// No description provided for @requestsent.
  ///
  /// In en, this message translates to:
  /// **'Request sent'**
  String get requestsent;

  /// No description provided for @readybyDecember7_2025.
  ///
  /// In en, this message translates to:
  /// **'Ready by December 7, 2025'**
  String get readybyDecember7_2025;

  /// No description provided for @yourreportwillbereadyinabout3daysYoullhaveafewweekstodownloadyourreportafteritsavailable.
  ///
  /// In en, this message translates to:
  /// **'Your report will be ready in about 3 days. You\'ll have a few weeks to download your report after it\'s available'**
  String get yourreportwillbereadyinabout3daysYoullhaveafewweekstodownloadyourreportafteritsavailable;

  /// No description provided for @createreportsautomatically.
  ///
  /// In en, this message translates to:
  /// **'Create reports automatically'**
  String get createreportsautomatically;

  /// No description provided for @anewreportwillbecreatedeverymonth.
  ///
  /// In en, this message translates to:
  /// **'A new report will be created every month'**
  String get anewreportwillbecreatedeverymonth;

  /// No description provided for @securitynotifications.
  ///
  /// In en, this message translates to:
  /// **'Security notifications'**
  String get securitynotifications;

  /// No description provided for @yourchatsandcallsareprivate.
  ///
  /// In en, this message translates to:
  /// **'Your chats and calls are private'**
  String get yourchatsandcallsareprivate;

  /// No description provided for @endtoendencryptionkeepsyourpersonalmessagedandcallsbetweenyouandthepeopleyouchoosenooneoutsideofthechatnotevenWhatsAppcanreadlistentoorsharethemthisincludesyour.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption keeps your personal messaged and calls between you and the people you choose. no one outside of the chat, not even WhatsApp, can read, listen to, or share them. this includes your'**
  String get endtoendencryptionkeepsyourpersonalmessagedandcallsbetweenyouandthepeopleyouchoosenooneoutsideofthechatnotevenWhatsAppcanreadlistentoorsharethemthisincludesyour;

  /// No description provided for @textandvoicemessages.
  ///
  /// In en, this message translates to:
  /// **'Text and voice messages'**
  String get textandvoicemessages;

  /// No description provided for @audioandvideocalls.
  ///
  /// In en, this message translates to:
  /// **'Audio and video calls'**
  String get audioandvideocalls;

  /// No description provided for @photosvideosanddocuments.
  ///
  /// In en, this message translates to:
  /// **'Photos, videos and documents'**
  String get photosvideosanddocuments;

  /// No description provided for @locationsharing.
  ///
  /// In en, this message translates to:
  /// **'Location sharing'**
  String get locationsharing;

  /// No description provided for @statusupdates.
  ///
  /// In en, this message translates to:
  /// **'Status updates'**
  String get statusupdates;

  /// No description provided for @showsecuritynotificationsonthisdevice.
  ///
  /// In en, this message translates to:
  /// **'Show security notifications on this device'**
  String get showsecuritynotificationsonthisdevice;

  /// No description provided for @twostepverification.
  ///
  /// In en, this message translates to:
  /// **'Two-step verification'**
  String get twostepverification;

  /// No description provided for @forextrasecurityturnontwostepverificationwhichwillrequireaPINwhenregisteringyourphonenumberwithWhatsAppagain.
  ///
  /// In en, this message translates to:
  /// **'For extra security, turn on two-step verification, which will require a PIN when registering your phone number with WhatsApp again.'**
  String get forextrasecurityturnontwostepverificationwhichwillrequireaPINwhenregisteringyourphonenumberwithWhatsAppagain;

  /// No description provided for @turnon.
  ///
  /// In en, this message translates to:
  /// **'Turn on'**
  String get turnon;

  /// No description provided for @animation.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get animation;

  /// No description provided for @whenturnedonemojistickersorGIFswillmoveautomatically.
  ///
  /// In en, this message translates to:
  /// **'When turned on, emoji, stickers or GIFs will move automatically.'**
  String get whenturnedonemojistickersorGIFswillmoveautomatically;

  /// No description provided for @emoji.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get emoji;

  /// No description provided for @stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get stickers;

  /// No description provided for @gifs.
  ///
  /// In en, this message translates to:
  /// **'Gifs'**
  String get gifs;

  /// No description provided for @chatbackup.
  ///
  /// In en, this message translates to:
  /// **'Chat backup'**
  String get chatbackup;

  /// No description provided for @backupsettings.
  ///
  /// In en, this message translates to:
  /// **'Backup settings'**
  String get backupsettings;

  /// No description provided for @backupyourchatsandmediatoyourGoogleAccountsstorageYoucanrestorethemonanewphoneafteryoudownloadWhatsApponit.
  ///
  /// In en, this message translates to:
  /// **'Back up your chats and media to your Google Account\'s storage. You can restore them on a new phone after you download WhatsApp on it'**
  String get backupyourchatsandmediatoyourGoogleAccountsstorageYoucanrestorethemonanewphoneafteryoudownloadWhatsApponit;

  /// No description provided for @local2_09AM.
  ///
  /// In en, this message translates to:
  /// **'Local: 2:09 AM'**
  String get local2_09AM;

  /// No description provided for @lastBackupNever.
  ///
  /// In en, this message translates to:
  /// **'Last Backup: Never'**
  String get lastBackupNever;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'Back up'**
  String get backup;

  /// No description provided for @manageGogglestorage.
  ///
  /// In en, this message translates to:
  /// **'Manage Goggle storage'**
  String get manageGogglestorage;

  /// No description provided for @chooseanaccount.
  ///
  /// In en, this message translates to:
  /// **'Choose an account'**
  String get chooseanaccount;

  /// No description provided for @abcced123gmail_com.
  ///
  /// In en, this message translates to:
  /// **'abcced123@gmail.com'**
  String get abcced123gmail_com;

  /// No description provided for @addaccount.
  ///
  /// In en, this message translates to:
  /// **'Add account'**
  String get addaccount;

  /// No description provided for @goggleAccount.
  ///
  /// In en, this message translates to:
  /// **'Goggle Account'**
  String get goggleAccount;

  /// No description provided for @automaticbackups.
  ///
  /// In en, this message translates to:
  /// **'Automatic backups'**
  String get automaticbackups;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'Daily'**
  String get daily;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @onlywhenItapBackup.
  ///
  /// In en, this message translates to:
  /// **'Only when I tap \'Back up'**
  String get onlywhenItapBackup;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @includevideos.
  ///
  /// In en, this message translates to:
  /// **'Include videos'**
  String get includevideos;

  /// No description provided for @backupusingcellular.
  ///
  /// In en, this message translates to:
  /// **'Back up using cellular'**
  String get backupusingcellular;

  /// No description provided for @endtoendencryption.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption'**
  String get endtoendencryption;

  /// No description provided for @foraddedsecurityyoucanprotectyourbackupwithendtoendencryption.
  ///
  /// In en, this message translates to:
  /// **'For added security, you can protect your backup with end-to-end encryption.'**
  String get foraddedsecurityyoucanprotectyourbackupwithendtoendencryption;

  /// No description provided for @endtoendencryptedbackup.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encrypted backup'**
  String get endtoendencryptedbackup;

  /// No description provided for @chathistory.
  ///
  /// In en, this message translates to:
  /// **'Chat history'**
  String get chathistory;

  /// No description provided for @exportchat.
  ///
  /// In en, this message translates to:
  /// **'Export chat'**
  String get exportchat;

  /// No description provided for @areyousurewanttoarchiveALLchats.
  ///
  /// In en, this message translates to:
  /// **'Are you sure want to archive ALL chats?'**
  String get areyousurewanttoarchiveALLchats;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @unarchiveallchats.
  ///
  /// In en, this message translates to:
  /// **'Unarchive all chats'**
  String get unarchiveallchats;

  /// No description provided for @archiveallchats.
  ///
  /// In en, this message translates to:
  /// **'Archive all chats'**
  String get archiveallchats;

  /// No description provided for @clearallchats.
  ///
  /// In en, this message translates to:
  /// **'Clear all chats'**
  String get clearallchats;

  /// No description provided for @alsodeletemediareceivedinchatsfromthedevicegallery.
  ///
  /// In en, this message translates to:
  /// **'Also delete media received in chats from the device gallery'**
  String get alsodeletemediareceivedinchatsfromthedevicegallery;

  /// No description provided for @deletestarredmessages.
  ///
  /// In en, this message translates to:
  /// **'Delete starred messages'**
  String get deletestarredmessages;

  /// No description provided for @clearchats.
  ///
  /// In en, this message translates to:
  /// **'Clear chats'**
  String get clearchats;

  /// No description provided for @deleteallchats.
  ///
  /// In en, this message translates to:
  /// **'Delete all chats?'**
  String get deleteallchats;

  /// No description provided for @deletechats.
  ///
  /// In en, this message translates to:
  /// **'Delete chats'**
  String get deletechats;

  /// No description provided for @chattheme.
  ///
  /// In en, this message translates to:
  /// **'Chat theme'**
  String get chattheme;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes'**
  String get themes;

  /// No description provided for @thechatcolorandwallpaperwillbothchange.
  ///
  /// In en, this message translates to:
  /// **'The chat color and wallpaper will both change'**
  String get thechatcolorandwallpaperwillbothchange;

  /// No description provided for @customize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get customize;

  /// No description provided for @chatcolor.
  ///
  /// In en, this message translates to:
  /// **'Chat color'**
  String get chatcolor;

  /// No description provided for @wallpaper.
  ///
  /// In en, this message translates to:
  /// **'Wallpaper'**
  String get wallpaper;

  /// No description provided for @addanextralayerofprotection.
  ///
  /// In en, this message translates to:
  /// **'Add an extra layer of protection'**
  String get addanextralayerofprotection;

  /// No description provided for @yourbackupwillbesafeevenifyouloseyourphone.
  ///
  /// In en, this message translates to:
  /// **'Your backup will be safe, even if you lose your phone.'**
  String get yourbackupwillbesafeevenifyouloseyourphone;

  /// No description provided for @secureyourbackupwithapasskeypasswordoranencryptionkey.
  ///
  /// In en, this message translates to:
  /// **'Secure your backup with a passkey, password or an encryption key.'**
  String get secureyourbackupwithapasskeypasswordoranencryptionkey;

  /// No description provided for @nooneelsewillbeabletoaccessyourbackupNotevenWhatsApporGoogle.
  ///
  /// In en, this message translates to:
  /// **'No one else will be able to access your backup. Not even WhatsApp or Google.'**
  String get nooneelsewillbeabletoaccessyourbackupNotevenWhatsApporGoogle;

  /// No description provided for @usepasskey.
  ///
  /// In en, this message translates to:
  /// **'Use passkey'**
  String get usepasskey;

  /// No description provided for @moreoptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreoptions;

  /// No description provided for @transferchathistorytonewphone.
  ///
  /// In en, this message translates to:
  /// **'Transfer chat history to new phone'**
  String get transferchathistorytonewphone;

  /// No description provided for @transferyourchathistoryprivatelytoanotherAndroidphoneHaveyourmostuptodatemessageswithoutusingGooglestorageCertaindevicepermissionsareneededtoConnecttoyournewdevice.
  ///
  /// In en, this message translates to:
  /// **'Transfer your chat history privately to another Android phone. Have your most up-to-date messages without using Google storage. Certain device permissions are needed to Connect to your new device.'**
  String get transferyourchathistoryprivatelytoanotherAndroidphoneHaveyourmostuptodatemessageswithoutusingGooglestorageCertaindevicepermissionsareneededtoConnecttoyournewdevice;

  /// No description provided for @accountBans.
  ///
  /// In en, this message translates to:
  /// **'Account Bans'**
  String get accountBans;

  /// No description provided for @aboutaccountbans.
  ///
  /// In en, this message translates to:
  /// **'About account bans'**
  String get aboutaccountbans;

  /// No description provided for @aboutaccountbansontheWhatsAppBusinessapp.
  ///
  /// In en, this message translates to:
  /// **'About account bans on the WhatsApp Business app'**
  String get aboutaccountbansontheWhatsAppBusinessapp;

  /// No description provided for @abouttemporarilybannedaccounts.
  ///
  /// In en, this message translates to:
  /// **'About temporarily banned accounts'**
  String get abouttemporarilybannedaccounts;

  /// No description provided for @afteryouraccountisunbanned.
  ///
  /// In en, this message translates to:
  /// **'After your account is unbanned'**
  String get afteryouraccountisunbanned;

  /// No description provided for @aboutaccountbansforpreviouslyownedphonenumbers.
  ///
  /// In en, this message translates to:
  /// **'About account bans for previously owned phone numbers'**
  String get aboutaccountbansforpreviouslyownedphonenumbers;

  /// No description provided for @aboutaccountbansforunofficialapps.
  ///
  /// In en, this message translates to:
  /// **'About account bans for unofficial apps'**
  String get aboutaccountbansforunofficialapps;

  /// No description provided for @howtocontacttheGrievanceOfficerandWhatsAppinindia.
  ///
  /// In en, this message translates to:
  /// **'How to contact the Grievance Officer and WhatsApp in india'**
  String get howtocontacttheGrievanceOfficerandWhatsAppinindia;

  /// No description provided for @accounts.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accounts;

  /// No description provided for @howtorequestaccountinformation.
  ///
  /// In en, this message translates to:
  /// **'How to request account information'**
  String get howtorequestaccountinformation;

  /// No description provided for @howtorequestchannelsreport.
  ///
  /// In en, this message translates to:
  /// **'How to request channels report'**
  String get howtorequestchannelsreport;

  /// No description provided for @howtorequestadsreport.
  ///
  /// In en, this message translates to:
  /// **'How to request ads report'**
  String get howtorequestadsreport;

  /// No description provided for @aboutchangingphones.
  ///
  /// In en, this message translates to:
  /// **'About changing phones'**
  String get aboutchangingphones;

  /// No description provided for @howtochangeyourphonenumber.
  ///
  /// In en, this message translates to:
  /// **'How to change your phone number'**
  String get howtochangeyourphonenumber;

  /// No description provided for @aboutchangingphonenumbers.
  ///
  /// In en, this message translates to:
  /// **'About changing phone numbers'**
  String get aboutchangingphonenumbers;

  /// No description provided for @cantchangephonenumber.
  ///
  /// In en, this message translates to:
  /// **'Can\'t change phone number'**
  String get cantchangephonenumber;

  /// No description provided for @aboutusingoneWhatsAppaccountonmultiplephonesorwithmultiplephonenumbers.
  ///
  /// In en, this message translates to:
  /// **'About using one WhatsApp account on multiple phones, or with multiple phone numbers'**
  String get aboutusingoneWhatsAppaccountonmultiplephonesorwithmultiplephonenumbers;

  /// No description provided for @howtodeleteyouraccount.
  ///
  /// In en, this message translates to:
  /// **'How to delete your account'**
  String get howtodeleteyouraccount;

  /// No description provided for @aboutinactiveaccountdeletion.
  ///
  /// In en, this message translates to:
  /// **'About inactive account deletion'**
  String get aboutinactiveaccountdeletion;

  /// No description provided for @aboutaccountdeactivation.
  ///
  /// In en, this message translates to:
  /// **'About account deactivation'**
  String get aboutaccountdeactivation;

  /// No description provided for @channelAdmins.
  ///
  /// In en, this message translates to:
  /// **'Channel Admins'**
  String get channelAdmins;

  /// No description provided for @howtoshareachannelupdate.
  ///
  /// In en, this message translates to:
  /// **'How to share a channel update'**
  String get howtoshareachannelupdate;

  /// No description provided for @howtoeditchannelupdates.
  ///
  /// In en, this message translates to:
  /// **'How to edit channel updates'**
  String get howtoeditchannelupdates;

  /// No description provided for @howtoforwardtoyourchannel.
  ///
  /// In en, this message translates to:
  /// **'How to forward to your channel'**
  String get howtoforwardtoyourchannel;

  /// No description provided for @howtoforwardchannelinfoandsettings.
  ///
  /// In en, this message translates to:
  /// **'How to forward channel info and settings'**
  String get howtoforwardchannelinfoandsettings;

  /// No description provided for @howtoshareyourchannel.
  ///
  /// In en, this message translates to:
  /// **'How to share your channel'**
  String get howtoshareyourchannel;

  /// No description provided for @aboutchanneladmincontrols.
  ///
  /// In en, this message translates to:
  /// **'About channel admin controls'**
  String get aboutchanneladmincontrols;

  /// No description provided for @howtocreatechannelpolls.
  ///
  /// In en, this message translates to:
  /// **'How to create channel polls'**
  String get howtocreatechannelpolls;

  /// No description provided for @howtoinviteanddismisschanneladmins.
  ///
  /// In en, this message translates to:
  /// **'How to invite and dismiss channel admins'**
  String get howtoinviteanddismisschanneladmins;

  /// No description provided for @howtodeletechannelupdates.
  ///
  /// In en, this message translates to:
  /// **'How to delete channel updates'**
  String get howtodeletechannelupdates;

  /// No description provided for @howtoseechannelmetricsandinsights.
  ///
  /// In en, this message translates to:
  /// **'How to see channel metrics and insights'**
  String get howtoseechannelmetricsandinsights;

  /// No description provided for @howtopinchannelsandstarupdates.
  ///
  /// In en, this message translates to:
  /// **'How to pin channels and star updates'**
  String get howtopinchannelsandstarupdates;

  /// No description provided for @aboutbecomingapromotedchannelinthedirectory.
  ///
  /// In en, this message translates to:
  /// **'About becoming a promoted channel in the directory'**
  String get aboutbecomingapromotedchannelinthedirectory;

  /// No description provided for @aboutaddingsubscriptionstoyourchannel.
  ///
  /// In en, this message translates to:
  /// **'About adding subscriptions to your channel'**
  String get aboutaddingsubscriptionstoyourchannel;

  /// No description provided for @channelFollowersandViewers.
  ///
  /// In en, this message translates to:
  /// **'Channel Followers and Viewers'**
  String get channelFollowersandViewers;

  /// No description provided for @howtoreacttochannelupdates.
  ///
  /// In en, this message translates to:
  /// **'How to react to channel updates'**
  String get howtoreacttochannelupdates;

  /// No description provided for @howtovoteonchannelpolls.
  ///
  /// In en, this message translates to:
  /// **'How to vote on channel polls'**
  String get howtovoteonchannelpolls;

  /// No description provided for @howtomanagechannelnotifications.
  ///
  /// In en, this message translates to:
  /// **'How to manage channel notifications'**
  String get howtomanagechannelnotifications;

  /// No description provided for @howtolistentovoiceupdatesonWhatsAppChannels.
  ///
  /// In en, this message translates to:
  /// **'How to listen to voice updates on WhatsApp Channels'**
  String get howtolistentovoiceupdatesonWhatsAppChannels;

  /// No description provided for @howtounfollowachannel.
  ///
  /// In en, this message translates to:
  /// **'How to unfollow a channel'**
  String get howtounfollowachannel;

  /// No description provided for @howtomanageyourchannelsubscription.
  ///
  /// In en, this message translates to:
  /// **'How to manage your channel subscription'**
  String get howtomanageyourchannelsubscription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @aboutWhatsAppChannels.
  ///
  /// In en, this message translates to:
  /// **'About WhatsApp Channels'**
  String get aboutWhatsAppChannels;

  /// No description provided for @aboutcreatingaWhatsAppChannel.
  ///
  /// In en, this message translates to:
  /// **'About creating a WhatsApp Channel'**
  String get aboutcreatingaWhatsAppChannel;

  /// No description provided for @howtofindandfollowWhatsAppChannels.
  ///
  /// In en, this message translates to:
  /// **'How to find and follow WhatsApp Channels'**
  String get howtofindandfollowWhatsAppChannels;

  /// No description provided for @howtocreateaWhatsAppChannel.
  ///
  /// In en, this message translates to:
  /// **'How to create a WhatsApp Channel'**
  String get howtocreateaWhatsAppChannel;

  /// No description provided for @howtoforwardfromchannelstochatorstatus.
  ///
  /// In en, this message translates to:
  /// **'How to forward from channels to chat or status'**
  String get howtoforwardfromchannelstochatorstatus;

  /// No description provided for @abouthowWhatsApprecommendschannels.
  ///
  /// In en, this message translates to:
  /// **'About how WhatsApp recommends channels'**
  String get abouthowWhatsApprecommendschannels;

  /// No description provided for @aboutchannelsubscriptions.
  ///
  /// In en, this message translates to:
  /// **'About channel subscriptions'**
  String get aboutchannelsubscriptions;

  /// No description provided for @privacySafetyandSecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy, Safety and Security'**
  String get privacySafetyandSecurity;

  /// No description provided for @aboutsafetyandprivacyonchannels.
  ///
  /// In en, this message translates to:
  /// **'About safety and privacy on channels'**
  String get aboutsafetyandprivacyonchannels;

  /// No description provided for @howtoreportachannel.
  ///
  /// In en, this message translates to:
  /// **'How to report a channel'**
  String get howtoreportachannel;

  /// No description provided for @buildingPrivateSafeandSecureWhatsAppchannels.
  ///
  /// In en, this message translates to:
  /// **'Building Private, Safe, and Secure WhatsApp channels'**
  String get buildingPrivateSafeandSecureWhatsAppchannels;

  /// No description provided for @whatsAppChannelsGuidelines.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Channels Guidelines'**
  String get whatsAppChannelsGuidelines;

  /// No description provided for @aboutsafetyandprivacyonchannelsforadmins.
  ///
  /// In en, this message translates to:
  /// **'About safety and privacy on channels for admins'**
  String get aboutsafetyandprivacyonchannelsforadmins;

  /// No description provided for @aIExperiences.
  ///
  /// In en, this message translates to:
  /// **'AI Experiences'**
  String get aIExperiences;

  /// No description provided for @aboutAIexperiencesavailablethroughWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About AI experiences available through WhatsApp'**
  String get aboutAIexperiencesavailablethroughWhatsApp;

  /// No description provided for @aboutusingAIexperiencesavailablethroughWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About using AI experiences available through WhatsApp'**
  String get aboutusingAIexperiencesavailablethroughWhatsApp;

  /// No description provided for @aboutMetaAI.
  ///
  /// In en, this message translates to:
  /// **'About Meta AI'**
  String get aboutMetaAI;

  /// No description provided for @howtochatwithMetaAI.
  ///
  /// In en, this message translates to:
  /// **'How to chat with Meta AI'**
  String get howtochatwithMetaAI;

  /// No description provided for @howtochatwithMetaAIinanindividualorgroupchat.
  ///
  /// In en, this message translates to:
  /// **'How to chat with Meta AI in an individual or group chat'**
  String get howtochatwithMetaAIinanindividualorgroupchat;

  /// No description provided for @aboutsearchingWhatsAppandaskingMetaAI.
  ///
  /// In en, this message translates to:
  /// **'About searching WhatsApp and asking Meta AI'**
  String get aboutsearchingWhatsAppandaskingMetaAI;

  /// No description provided for @howtoaskMetaAIintheWhatsAppsearchbar.
  ///
  /// In en, this message translates to:
  /// **'How to ask Meta AI in the WhatsApp search bar'**
  String get howtoaskMetaAIintheWhatsAppsearchbar;

  /// No description provided for @howtocreateananimatedAIimageinachat.
  ///
  /// In en, this message translates to:
  /// **'How to create an animated AI image in a chat'**
  String get howtocreateananimatedAIimageinachat;

  /// No description provided for @howtogenerateanAIimageforyourprofilephotoorgroupicon.
  ///
  /// In en, this message translates to:
  /// **'How to generate an AI image for your profile photo or group icon'**
  String get howtogenerateanAIimageforyourprofilephotoorgroupicon;

  /// No description provided for @howtoeditAIgeneratedimages.
  ///
  /// In en, this message translates to:
  /// **'How to edit AI-generated images'**
  String get howtoeditAIgeneratedimages;

  /// No description provided for @howtoedityourphotosorimageswithMetaAI.
  ///
  /// In en, this message translates to:
  /// **'How to edit your photos or images with Meta AI'**
  String get howtoedityourphotosorimageswithMetaAI;

  /// No description provided for @howtopromptMetaAIwithanimage.
  ///
  /// In en, this message translates to:
  /// **'How to prompt Meta AI with an image'**
  String get howtopromptMetaAIwithanimage;

  /// No description provided for @howtocreateanduseAIgeneratedcallbackgrounds.
  ///
  /// In en, this message translates to:
  /// **'How to create and use AI-generated call backgrounds'**
  String get howtocreateanduseAIgeneratedcallbackgrounds;

  /// No description provided for @howtoshareanAIgeneratedimagetoyourstatus.
  ///
  /// In en, this message translates to:
  /// **'How to share an AI-generated image to your status'**
  String get howtoshareanAIgeneratedimagetoyourstatus;

  /// No description provided for @aboutAIs.
  ///
  /// In en, this message translates to:
  /// **'About AIs'**
  String get aboutAIs;

  /// No description provided for @howtochatwithAIs.
  ///
  /// In en, this message translates to:
  /// **'How to chat with AIs'**
  String get howtochatwithAIs;

  /// No description provided for @howtoreportanAI.
  ///
  /// In en, this message translates to:
  /// **'How to report an AI'**
  String get howtoreportanAI;

  /// No description provided for @aboutcreatinganAIthroughMetaAIStudio.
  ///
  /// In en, this message translates to:
  /// **'About creating an AI through Meta AI Studio'**
  String get aboutcreatinganAIthroughMetaAIStudio;

  /// No description provided for @howtocreateanAIthroughMetaAIstudio.
  ///
  /// In en, this message translates to:
  /// **'How to create an AI through Meta AI studio'**
  String get howtocreateanAIthroughMetaAIstudio;

  /// No description provided for @howtoedityourAIthroughMetaAIStudio.
  ///
  /// In en, this message translates to:
  /// **'How to edit your AI through Meta AI Studio'**
  String get howtoedityourAIthroughMetaAIStudio;

  /// No description provided for @howtodeleteyourAIthroughMetaAIStudio.
  ///
  /// In en, this message translates to:
  /// **'How to delete your AI through Meta AI Studio'**
  String get howtodeleteyourAIthroughMetaAIStudio;

  /// No description provided for @aboutAIstickers.
  ///
  /// In en, this message translates to:
  /// **'About AI stickers'**
  String get aboutAIstickers;

  /// No description provided for @howtocreateandshareAIstickers.
  ///
  /// In en, this message translates to:
  /// **'How to create and share AI stickers'**
  String get howtocreateandshareAIstickers;

  /// No description provided for @abouttheavailbilityofAIexperiencesavailablethroughWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About the availbility of AI experiences available through WhatsApp'**
  String get abouttheavailbilityofAIexperiencesavailablethroughWhatsApp;

  /// No description provided for @backupandRestore.
  ///
  /// In en, this message translates to:
  /// **'Back up and Restore'**
  String get backupandRestore;

  /// No description provided for @howtobackupyourchathistory.
  ///
  /// In en, this message translates to:
  /// **'How to back up your chat history'**
  String get howtobackupyourchathistory;

  /// No description provided for @howtorestoreyourchathistory.
  ///
  /// In en, this message translates to:
  /// **'How to restore your chat history'**
  String get howtorestoreyourchathistory;

  /// No description provided for @howtotransferyourchathistory.
  ///
  /// In en, this message translates to:
  /// **'How to transfer your chat history'**
  String get howtotransferyourchathistory;

  /// No description provided for @howtomovechatsfromanAndroiddevicetoaniPhone.
  ///
  /// In en, this message translates to:
  /// **'How to move chats from an Android device to an iPhone'**
  String get howtomovechatsfromanAndroiddevicetoaniPhone;

  /// No description provided for @howtomovechatsfromaniPhonetoanAndroiddevice.
  ///
  /// In en, this message translates to:
  /// **'How to move chats from an iPhone to an Android device'**
  String get howtomovechatsfromaniPhonetoanAndroiddevice;

  /// No description provided for @aboutendtoendencryptedbackup.
  ///
  /// In en, this message translates to:
  /// **'About end-to-end encrypted backup'**
  String get aboutendtoendencryptedbackup;

  /// No description provided for @aboutGoogleAccountbackups.
  ///
  /// In en, this message translates to:
  /// **'About Google Account backups'**
  String get aboutGoogleAccountbackups;

  /// No description provided for @howtoturnoffWhatsAppinyourdevicebackup.
  ///
  /// In en, this message translates to:
  /// **'How to turn off WhatsApp in your device backup'**
  String get howtoturnoffWhatsAppinyourdevicebackup;

  /// No description provided for @troubleshooting.
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting'**
  String get troubleshooting;

  /// No description provided for @cantsendorreceivemessages.
  ///
  /// In en, this message translates to:
  /// **'Can\'t send or receive messages'**
  String get cantsendorreceivemessages;

  /// No description provided for @aboutWaitingforthismessageThismaytakeawhile.
  ///
  /// In en, this message translates to:
  /// **'About \'Waiting for this message. This may take a while.\''**
  String get aboutWaitingforthismessageThismaytakeawhile;

  /// No description provided for @seeingWaitingforthismessageCheckyourphone.
  ///
  /// In en, this message translates to:
  /// **'Seeing \'Waiting for this message. Check your phone\''**
  String get seeingWaitingforthismessageCheckyourphone;

  /// No description provided for @fixincorrecttimestampsonmessages.
  ///
  /// In en, this message translates to:
  /// **'Fix incorrect timestamps on messages'**
  String get fixincorrecttimestampsonmessages;

  /// No description provided for @cantrememberpasswordforencryptedbackup.
  ///
  /// In en, this message translates to:
  /// **'Can\'t remember password for encrypted backup'**
  String get cantrememberpasswordforencryptedbackup;

  /// No description provided for @cantbackuporrestoreyourchathistory.
  ///
  /// In en, this message translates to:
  /// **'Can\'t back up or restore your chat history'**
  String get cantbackuporrestoreyourchathistory;

  /// No description provided for @cantmovechatsfromanAndroiddevicetoaniPhone.
  ///
  /// In en, this message translates to:
  /// **'Can\'t move chats from an Android device to an iPhone'**
  String get cantmovechatsfromanAndroiddevicetoaniPhone;

  /// No description provided for @cantmovechatsfromaniPhonetoanAndroiddevice.
  ///
  /// In en, this message translates to:
  /// **'Can\'t move chats from an iPhone to an Android device'**
  String get cantmovechatsfromaniPhonetoanAndroiddevice;

  /// No description provided for @canttransferchathistory.
  ///
  /// In en, this message translates to:
  /// **'Can\'t  transfer chat history'**
  String get canttransferchathistory;

  /// No description provided for @cantchangeorassignagroupadmin.
  ///
  /// In en, this message translates to:
  /// **'Can\'t change or assign a group admin'**
  String get cantchangeorassignagroupadmin;

  /// No description provided for @cantdownloadopenorsendmediafiles.
  ///
  /// In en, this message translates to:
  /// **'Can\'t download, open, or send media files'**
  String get cantdownloadopenorsendmediafiles;

  /// No description provided for @canthearvoicemessagesstatusaudioorvideos.
  ///
  /// In en, this message translates to:
  /// **'Can\'t hear voice messages, status audio, or videos'**
  String get canthearvoicemessagesstatusaudioorvideos;

  /// No description provided for @cantrecordvoicemessages.
  ///
  /// In en, this message translates to:
  /// **'Can\'t record voice messages'**
  String get cantrecordvoicemessages;

  /// No description provided for @seeingblurryphotos.
  ///
  /// In en, this message translates to:
  /// **'Seeing blurry photos'**
  String get seeingblurryphotos;

  /// No description provided for @cantsendlongervideos.
  ///
  /// In en, this message translates to:
  /// **'Can\'t send longer videos'**
  String get cantsendlongervideos;

  /// No description provided for @whatdoesInviteviaLinkunavailablemean.
  ///
  /// In en, this message translates to:
  /// **'What does \'Invite via Link unavailable\' mean?'**
  String get whatdoesInviteviaLinkunavailablemean;

  /// No description provided for @cantjoingroupwithinvitelink.
  ///
  /// In en, this message translates to:
  /// **'Can\'t join group with invite link'**
  String get cantjoingroupwithinvitelink;

  /// No description provided for @howtoedityourprofile.
  ///
  /// In en, this message translates to:
  /// **'How to edit your profile'**
  String get howtoedityourprofile;

  /// No description provided for @howtofreeupstorageonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'How to free up storage on WhatsApp'**
  String get howtofreeupstorageonWhatsApp;

  /// No description provided for @howtochnageyourringtoneforWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'How to chnage your ringtone for WhatsApp'**
  String get howtochnageyourringtoneforWhatsApp;

  /// No description provided for @howtousedarkmode.
  ///
  /// In en, this message translates to:
  /// **'How to use dark mode'**
  String get howtousedarkmode;

  /// No description provided for @howtochangefontsize.
  ///
  /// In en, this message translates to:
  /// **'How to change font size'**
  String get howtochangefontsize;

  /// No description provided for @individualandGroupChats.
  ///
  /// In en, this message translates to:
  /// **'Individual and Group Chats'**
  String get individualandGroupChats;

  /// No description provided for @howtoreplytoamessage.
  ///
  /// In en, this message translates to:
  /// **'How to reply to a message'**
  String get howtoreplytoamessage;

  /// No description provided for @howtodeletechats.
  ///
  /// In en, this message translates to:
  /// **'How to delete chats'**
  String get howtodeletechats;

  /// No description provided for @howtoclearchats.
  ///
  /// In en, this message translates to:
  /// **'How to clear chats'**
  String get howtoclearchats;

  /// No description provided for @howtopinorunpinachat.
  ///
  /// In en, this message translates to:
  /// **'How to pin or unpin a chat'**
  String get howtopinorunpinachat;

  /// No description provided for @howtoeditfavoritesfromtheChatstab.
  ///
  /// In en, this message translates to:
  /// **'How to edit favorites from the Chats tab'**
  String get howtoeditfavoritesfromtheChatstab;

  /// No description provided for @aboutlists.
  ///
  /// In en, this message translates to:
  /// **'About lists'**
  String get aboutlists;

  /// No description provided for @howtouselists.
  ///
  /// In en, this message translates to:
  /// **'How to use lists'**
  String get howtouselists;

  /// No description provided for @howtouseclicktochat.
  ///
  /// In en, this message translates to:
  /// **'How to use click to chat'**
  String get howtouseclicktochat;

  /// No description provided for @howtodeletemessages.
  ///
  /// In en, this message translates to:
  /// **'How to delete messages'**
  String get howtodeletemessages;

  /// No description provided for @howtoforwardmessages.
  ///
  /// In en, this message translates to:
  /// **'How to forward messages'**
  String get howtoforwardmessages;

  /// No description provided for @aboutforwardinglimits.
  ///
  /// In en, this message translates to:
  /// **'About forwarding limits'**
  String get aboutforwardinglimits;

  /// No description provided for @howtopinamessages.
  ///
  /// In en, this message translates to:
  /// **'How to pin a messages'**
  String get howtopinamessages;

  /// No description provided for @howtomessageyourself.
  ///
  /// In en, this message translates to:
  /// **'How to message yourself'**
  String get howtomessageyourself;

  /// No description provided for @howtoformatyourmessages.
  ///
  /// In en, this message translates to:
  /// **'How to format your messages'**
  String get howtoformatyourmessages;

  /// No description provided for @howtochangeyourapporchattheme.
  ///
  /// In en, this message translates to:
  /// **'How to change your app or chat theme'**
  String get howtochangeyourapporchattheme;

  /// No description provided for @aboutdisappearingmessages.
  ///
  /// In en, this message translates to:
  /// **'About disappearing messages'**
  String get aboutdisappearingmessages;

  /// No description provided for @howtoturndisappearingmessagesonoroff.
  ///
  /// In en, this message translates to:
  /// **'How to turn disappearing messages on or off'**
  String get howtoturndisappearingmessagesonoroff;

  /// No description provided for @howtoturndisappearingmessagesonoroffinagroup.
  ///
  /// In en, this message translates to:
  /// **'How to turn disappearing messages on or off in a group'**
  String get howtoturndisappearingmessagesonoroffinagroup;

  /// No description provided for @aboutviewonce.
  ///
  /// In en, this message translates to:
  /// **'About view once'**
  String get aboutviewonce;

  /// No description provided for @howtosendandopenviewoncemediaandvoicemessages.
  ///
  /// In en, this message translates to:
  /// **'How to send and open view once media and voice messages'**
  String get howtosendandopenviewoncemediaandvoicemessages;

  /// No description provided for @howtocreateandinviteintoagroup.
  ///
  /// In en, this message translates to:
  /// **'How to create and invite into a group'**
  String get howtocreateandinviteintoagroup;

  /// No description provided for @howtoarchiveorunarchiveachatorgroup.
  ///
  /// In en, this message translates to:
  /// **'How to archive or unarchive a chat or group'**
  String get howtoarchiveorunarchiveachatorgroup;

  /// No description provided for @howtochangegroupadminsettings.
  ///
  /// In en, this message translates to:
  /// **'How to change group admin settings'**
  String get howtochangegroupadminsettings;

  /// No description provided for @turnchatlockonoroff.
  ///
  /// In en, this message translates to:
  /// **'Turn chat lock on or off'**
  String get turnchatlockonoroff;

  /// No description provided for @howtoexitanddeletegroupsasanadmin.
  ///
  /// In en, this message translates to:
  /// **'How to exit and delete groups as an admin'**
  String get howtoexitanddeletegroupsasanadmin;

  /// No description provided for @howtoexitagroupasamember.
  ///
  /// In en, this message translates to:
  /// **'How to exit a group as a member'**
  String get howtoexitagroupasamember;

  /// No description provided for @howtoaddandremovegroupmembers.
  ///
  /// In en, this message translates to:
  /// **'How to add and remove group members'**
  String get howtoaddandremovegroupmembers;

  /// No description provided for @howtomakechangestogroupsr.
  ///
  /// In en, this message translates to:
  /// **'How to make changes to groupsr'**
  String get howtomakechangestogroupsr;

  /// No description provided for @howtomentioninagroup.
  ///
  /// In en, this message translates to:
  /// **'How to mention in a group'**
  String get howtomentioninagroup;

  /// No description provided for @howtomanagegroupadmins.
  ///
  /// In en, this message translates to:
  /// **'How to manage group admins'**
  String get howtomanagegroupadmins;

  /// No description provided for @howtorejoinagroupchat.
  ///
  /// In en, this message translates to:
  /// **'How to rejoin a group chat'**
  String get howtorejoinagroupchat;

  /// No description provided for @aboutgroupjoinrequests.
  ///
  /// In en, this message translates to:
  /// **'About group join requests'**
  String get aboutgroupjoinrequests;

  /// No description provided for @howtocreateandediteventsingroups.
  ///
  /// In en, this message translates to:
  /// **'How to create and edit events in groups'**
  String get howtocreateandediteventsingroups;

  /// No description provided for @howtorespondtoevents.
  ///
  /// In en, this message translates to:
  /// **'How to respond to events'**
  String get howtorespondtoevents;

  /// No description provided for @howtousepolls.
  ///
  /// In en, this message translates to:
  /// **'How to use polls'**
  String get howtousepolls;

  /// No description provided for @howtouselivelocation.
  ///
  /// In en, this message translates to:
  /// **'How to use live location'**
  String get howtouselivelocation;

  /// No description provided for @howtosearchWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'How to search WhatsApp'**
  String get howtosearchWhatsApp;

  /// No description provided for @howtocheckreadreceipts.
  ///
  /// In en, this message translates to:
  /// **'How to check read receipts'**
  String get howtocheckreadreceipts;

  /// No description provided for @howtousebroadcastlists.
  ///
  /// In en, this message translates to:
  /// **'How to use broadcast lists'**
  String get howtousebroadcastlists;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// No description provided for @howtosendmediacontactsorlocation.
  ///
  /// In en, this message translates to:
  /// **'How to send media, contacts, or location'**
  String get howtosendmediacontactsorlocation;

  /// No description provided for @findingmediafiles.
  ///
  /// In en, this message translates to:
  /// **'Finding media files'**
  String get findingmediafiles;

  /// No description provided for @howtoforwardmedia.
  ///
  /// In en, this message translates to:
  /// **'How to forward media'**
  String get howtoforwardmedia;

  /// No description provided for @howtoeditphotosandvideos.
  ///
  /// In en, this message translates to:
  /// **'How to edit photos and videos'**
  String get howtoeditphotosandvideos;

  /// No description provided for @howtostopWhatsAppfromsavingmediatoyourphone.
  ///
  /// In en, this message translates to:
  /// **'How to stop WhatsApp from saving media to your phone'**
  String get howtostopWhatsAppfromsavingmediatoyourphone;

  /// No description provided for @howtousestickers.
  ///
  /// In en, this message translates to:
  /// **'How to use stickers'**
  String get howtousestickers;

  /// No description provided for @howtocreateandsharecustomstickersandstickerpacks.
  ///
  /// In en, this message translates to:
  /// **'How to create and share custom stickers and sticker packs'**
  String get howtocreateandsharecustomstickersandstickerpacks;

  /// No description provided for @howtocreateavatars.
  ///
  /// In en, this message translates to:
  /// **'How to create avatars'**
  String get howtocreateavatars;

  /// No description provided for @howtouseavatars.
  ///
  /// In en, this message translates to:
  /// **'How to use avatars'**
  String get howtouseavatars;

  /// No description provided for @howtocreateGIFs.
  ///
  /// In en, this message translates to:
  /// **'How to create GIFs'**
  String get howtocreateGIFs;

  /// No description provided for @howtosendGIFs.
  ///
  /// In en, this message translates to:
  /// **'How to send GIFs'**
  String get howtosendGIFs;

  /// No description provided for @howtouseemoji.
  ///
  /// In en, this message translates to:
  /// **'How to use emoji'**
  String get howtouseemoji;

  /// No description provided for @howtoconfigureautodownload.
  ///
  /// In en, this message translates to:
  /// **'How to configure auto-download'**
  String get howtoconfigureautodownload;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @howtomanageyournotifications.
  ///
  /// In en, this message translates to:
  /// **'How to manage your notifications'**
  String get howtomanageyournotifications;

  /// No description provided for @howtomanageconversationtones.
  ///
  /// In en, this message translates to:
  /// **'How to manage conversation tones'**
  String get howtomanageconversationtones;

  /// No description provided for @howtochangeyourringtoneforWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'How to change your ringtone for WhatsApp'**
  String get howtochangeyourringtoneforWhatsApp;

  /// No description provided for @howtomuteorunmuteindividualorgroupchatnotifications.
  ///
  /// In en, this message translates to:
  /// **'How to mute or unmute individual or group chat notifications'**
  String get howtomuteorunmuteindividualorgroupchatnotifications;

  /// No description provided for @cantseeorhearnotifications.
  ///
  /// In en, this message translates to:
  /// **'Can\'t see or hear notifications'**
  String get cantseeorhearnotifications;

  /// No description provided for @troubleshootproblemswithnotificationbadges.
  ///
  /// In en, this message translates to:
  /// **'Troubleshoot problems with notification badges'**
  String get troubleshootproblemswithnotificationbadges;

  /// No description provided for @cantseenotificationcount.
  ///
  /// In en, this message translates to:
  /// **'Can\'t see notification count'**
  String get cantseenotificationcount;

  /// No description provided for @videoNotes.
  ///
  /// In en, this message translates to:
  /// **'Video Notes'**
  String get videoNotes;

  /// No description provided for @aboutvideonotes.
  ///
  /// In en, this message translates to:
  /// **'About video notes'**
  String get aboutvideonotes;

  /// No description provided for @howtosendvideonotes.
  ///
  /// In en, this message translates to:
  /// **'How to send video notes'**
  String get howtosendvideonotes;

  /// No description provided for @howtoplayvideonotes.
  ///
  /// In en, this message translates to:
  /// **'How to play video notes'**
  String get howtoplayvideonotes;

  /// No description provided for @howtopreviewvideonotes.
  ///
  /// In en, this message translates to:
  /// **'How to preview video notes'**
  String get howtopreviewvideonotes;

  /// No description provided for @howtodeleteavideonote.
  ///
  /// In en, this message translates to:
  /// **'How to delete a video note'**
  String get howtodeleteavideonote;

  /// No description provided for @voiceMessagesandChats.
  ///
  /// In en, this message translates to:
  /// **'Voice Messages and Chats'**
  String get voiceMessagesandChats;

  /// No description provided for @howtosendvoicemessages.
  ///
  /// In en, this message translates to:
  /// **'How to send voice messages'**
  String get howtosendvoicemessages;

  /// No description provided for @howtoplayvoicemessages.
  ///
  /// In en, this message translates to:
  /// **'How to play voice messages'**
  String get howtoplayvoicemessages;

  /// No description provided for @howtoturnvoicemessagetranscriptsonoroff.
  ///
  /// In en, this message translates to:
  /// **'How to turn voice message transcripts on or off'**
  String get howtoturnvoicemessagetranscriptsonoroff;

  /// No description provided for @howtopreviewavoicemessage.
  ///
  /// In en, this message translates to:
  /// **'How to preview a voice message'**
  String get howtopreviewavoicemessage;

  /// No description provided for @howtodeletevoicemessages.
  ///
  /// In en, this message translates to:
  /// **'How to delete voice messages'**
  String get howtodeletevoicemessages;

  /// No description provided for @aboutvoicechats.
  ///
  /// In en, this message translates to:
  /// **'About voice chats'**
  String get aboutvoicechats;

  /// No description provided for @howtostartavoicechat.
  ///
  /// In en, this message translates to:
  /// **'How to start a voice chat'**
  String get howtostartavoicechat;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @howtoaddorsuggestagrouptoacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to add or suggest a group to a community'**
  String get howtoaddorsuggestagrouptoacommunity;

  /// No description provided for @howtomanagecommunityadmins.
  ///
  /// In en, this message translates to:
  /// **'How to manage community admins'**
  String get howtomanagecommunityadmins;

  /// No description provided for @howtoinvitemembersintoacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to invite members into a community'**
  String get howtoinvitemembersintoacommunity;

  /// No description provided for @howtomakechangestoacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to make changes to a community'**
  String get howtomakechangestoacommunity;

  /// No description provided for @howtocreateandcustomizeeventsincommunitygroups.
  ///
  /// In en, this message translates to:
  /// **'How to create and customize events in community groups'**
  String get howtocreateandcustomizeeventsincommunitygroups;

  /// No description provided for @howtoremoveamemberfromacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to remove a member from a community'**
  String get howtoremoveamemberfromacommunity;

  /// No description provided for @howtodeactivateacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to deactivate a community'**
  String get howtodeactivateacommunity;

  /// No description provided for @aboutcommunities.
  ///
  /// In en, this message translates to:
  /// **'About communities'**
  String get aboutcommunities;

  /// No description provided for @howtocreateacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to create a community'**
  String get howtocreateacommunity;

  /// No description provided for @aboutcommunityannouncements.
  ///
  /// In en, this message translates to:
  /// **'About community announcements'**
  String get aboutcommunityannouncements;

  /// No description provided for @aboutgeneralchatforcommunities.
  ///
  /// In en, this message translates to:
  /// **'About general chat for communities'**
  String get aboutgeneralchatforcommunities;

  /// No description provided for @howtokeepyourgroupsandcommunitysafe.
  ///
  /// In en, this message translates to:
  /// **'How to keep your groups and community safe'**
  String get howtokeepyourgroupsandcommunitysafe;

  /// No description provided for @aboutbuildingprivatesafeandsecurecommunitiesonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About building private, safe, and secure communities on WhatsApp'**
  String get aboutbuildingprivatesafeandsecurecommunitiesonWhatsApp;

  /// No description provided for @whatdoesThiscommunityisnolongeravailablemean.
  ///
  /// In en, this message translates to:
  /// **'What does \'This community is no longer available\' mean?'**
  String get whatdoesThiscommunityisnolongeravailablemean;

  /// No description provided for @member.
  ///
  /// In en, this message translates to:
  /// **'Member'**
  String get member;

  /// No description provided for @howtofindandjoineventsinacommunitygroup.
  ///
  /// In en, this message translates to:
  /// **'How to find and join events in a community group'**
  String get howtofindandjoineventsinacommunitygroup;

  /// No description provided for @howtojoinagroupinacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to join a group in a community'**
  String get howtojoinagroupinacommunity;

  /// No description provided for @howtoexitacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to exit a community'**
  String get howtoexitacommunity;

  /// No description provided for @howtorejoinacommunity.
  ///
  /// In en, this message translates to:
  /// **'How to rejoin a community'**
  String get howtorejoinacommunity;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @aboutadsinWhatsAppStatusandChannels.
  ///
  /// In en, this message translates to:
  /// **'About ads in WhatsApp Status and Channels'**
  String get aboutadsinWhatsAppStatusandChannels;

  /// No description provided for @howtoviewandadjustyouradpreferencesinWhatsAppStatusorChannles.
  ///
  /// In en, this message translates to:
  /// **'How to view and adjust your ad preferences in WhatsApp Status or Channles'**
  String get howtoviewandadjustyouradpreferencesinWhatsAppStatusorChannles;

  /// No description provided for @howtohideorreportanadinWhatsAppStatusorChannels.
  ///
  /// In en, this message translates to:
  /// **'How to hide or report an ad in WhatsApp Status or Channels'**
  String get howtohideorreportanadinWhatsAppStatusorChannels;

  /// No description provided for @howtosearchforbusinessesinsideWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'How to search for businesses inside WhatsApp'**
  String get howtosearchforbusinessesinsideWhatsApp;

  /// No description provided for @howtoselectalocationwhenlookingforbusinesses.
  ///
  /// In en, this message translates to:
  /// **'How to select a location when looking for businesses'**
  String get howtoselectalocationwhenlookingforbusinesses;

  /// No description provided for @howtoscanabusinessWhatsAppQRcode.
  ///
  /// In en, this message translates to:
  /// **'How to scan a business\' WhatsApp QR code'**
  String get howtoscanabusinessWhatsAppQRcode;

  /// No description provided for @howyoursearchhistoryishandledintheDiscoverbusinessesfeature.
  ///
  /// In en, this message translates to:
  /// **'How your search history is handled in the Discover businesses feature'**
  String get howyoursearchhistoryishandledintheDiscoverbusinessesfeature;

  /// No description provided for @aboutconnectingwithbusinesses.
  ///
  /// In en, this message translates to:
  /// **'About connecting with businesses'**
  String get aboutconnectingwithbusinesses;

  /// No description provided for @controlswhencommunicatingwithbusinesses.
  ///
  /// In en, this message translates to:
  /// **'Controls when communicating with businesses'**
  String get controlswhencommunicatingwithbusinesses;

  /// No description provided for @aboutverifiedbusinessaccounts.
  ///
  /// In en, this message translates to:
  /// **'About verified business accounts'**
  String get aboutverifiedbusinessaccounts;

  /// No description provided for @businessaccountbecomesastandardaccount.
  ///
  /// In en, this message translates to:
  /// **'Business account becomes a standard account'**
  String get businessaccountbecomesastandardaccount;

  /// No description provided for @aboutsupportforcustomerissues.
  ///
  /// In en, this message translates to:
  /// **'About support for customer issues'**
  String get aboutsupportforcustomerissues;

  /// No description provided for @aboutrespondingtosurveysaboutbusinessmessages.
  ///
  /// In en, this message translates to:
  /// **'About responding to surveys about business messages'**
  String get aboutrespondingtosurveysaboutbusinessmessages;

  /// No description provided for @aboutgroupchatswithmultiplerepresntativesofabusiness.
  ///
  /// In en, this message translates to:
  /// **'About group chats with multiple represntatives of a business'**
  String get aboutgroupchatswithmultiplerepresntativesofabusiness;

  /// No description provided for @howtoblockorunblockabusiness.
  ///
  /// In en, this message translates to:
  /// **'How to block or unblock a business'**
  String get howtoblockorunblockabusiness;

  /// No description provided for @howtoreportacatalogorbusiness.
  ///
  /// In en, this message translates to:
  /// **'How to report a catalog or business'**
  String get howtoreportacatalogorbusiness;

  /// No description provided for @privacyandsecurityforbusinessmessages.
  ///
  /// In en, this message translates to:
  /// **'Privacy and security for business messages'**
  String get privacyandsecurityforbusinessmessages;

  /// No description provided for @aboutsharingyourinformationwithbusinessesonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About sharing your information with businesses on WhatsApp'**
  String get aboutsharingyourinformationwithbusinessesonWhatsApp;

  /// No description provided for @aboutsecuritycodesthatautomaticallyfillonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About security codes that automatically fill on WhatsApp'**
  String get aboutsecuritycodesthatautomaticallyfillonWhatsApp;

  /// No description provided for @aboutreceivingsecuritycodesonlinkeddevices.
  ///
  /// In en, this message translates to:
  /// **'About receiving security codes on linked devices'**
  String get aboutreceivingsecuritycodesonlinkeddevices;

  /// No description provided for @cantreceivesecuritycodesfromotherappsonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'Can\'t receive security codes from other apps on WhatsApp'**
  String get cantreceivesecuritycodesfromotherappsonWhatsApp;

  /// No description provided for @aboutinteractionswithbusinesschatsthatincludeoffersandannouncements.
  ///
  /// In en, this message translates to:
  /// **'About interactions with business chats that include offers and announcements'**
  String get aboutinteractionswithbusinesschatsthatincludeoffersandannouncements;

  /// No description provided for @aboutcomplaintsraisedbyWhatsAppusersinrelationtothegoodsorservicessoldbyBusinessesinindia.
  ///
  /// In en, this message translates to:
  /// **'About complaints raised by WhatsApp users in relation to the goods or services sold by Businesses in india'**
  String get aboutcomplaintsraisedbyWhatsAppusersinrelationtothegoodsorservicessoldbyBusinessesinindia;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @aboutshoppingonWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'About shopping on WhatsApp'**
  String get aboutshoppingonWhatsApp;

  /// No description provided for @howtoshopwhilechattingwithbusinesses.
  ///
  /// In en, this message translates to:
  /// **'How to shop while chatting with businesses'**
  String get howtoshopwhilechattingwithbusinesses;

  /// No description provided for @aboutusingtheshoppingbutton.
  ///
  /// In en, this message translates to:
  /// **'About using the shopping button'**
  String get aboutusingtheshoppingbutton;

  /// No description provided for @howtoviewacatalog.
  ///
  /// In en, this message translates to:
  /// **'How to view a catalog'**
  String get howtoviewacatalog;

  /// No description provided for @howtoshareproductsorservicesfromacatalog.
  ///
  /// In en, this message translates to:
  /// **'How to share products or services from a catalog'**
  String get howtoshareproductsorservicesfromacatalog;

  /// No description provided for @aboutsharingyourcatalogtoyourWhatsAppbusinessstatus.
  ///
  /// In en, this message translates to:
  /// **'About sharing your catalog to your WhatsApp business status'**
  String get aboutsharingyourcatalogtoyourWhatsAppbusinessstatus;

  /// No description provided for @howtoplaceanorderusingcart.
  ///
  /// In en, this message translates to:
  /// **'How to place an order using cart'**
  String get howtoplaceanorderusingcart;

  /// No description provided for @aboutbuyinggoodsorservicesfrombusinesses.
  ///
  /// In en, this message translates to:
  /// **'About buying goods or services from businesses'**
  String get aboutbuyinggoodsorservicesfrombusinesses;
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
