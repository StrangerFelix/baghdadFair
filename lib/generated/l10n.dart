// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Baghdad Exhibition`
  String get title {
    return Intl.message(
      'Baghdad Exhibition',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get changeLanguageButton {
    return Intl.message(
      'English',
      name: 'changeLanguageButton',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Address of complaint for inquiries`
  String get address_of_complaint {
    return Intl.message(
      'Address of complaint for inquiries',
      name: 'address_of_complaint',
      desc: '',
      args: [],
    );
  }

  /// `Inquiry`
  String get inquiry {
    return Intl.message(
      'Inquiry',
      name: 'inquiry',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Your message`
  String get your_message {
    return Intl.message(
      'Your message',
      name: 'your_message',
      desc: '',
      args: [],
    );
  }

  /// `Contact info`
  String get contact_info {
    return Intl.message(
      'Contact info',
      name: 'contact_info',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contact_us {
    return Intl.message(
      'Contact us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Call us`
  String get call_us {
    return Intl.message(
      'Call us',
      name: 'call_us',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get our_address {
    return Intl.message(
      'Address',
      name: 'our_address',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get our_location {
    return Intl.message(
      'Location',
      name: 'our_location',
      desc: '',
      args: [],
    );
  }

  /// `Participation instructions`
  String get participation_instructions {
    return Intl.message(
      'Participation instructions',
      name: 'participation_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Organizer`
  String get organizer {
    return Intl.message(
      'Organizer',
      name: 'organizer',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about_us {
    return Intl.message(
      'About us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Videos library`
  String get vid_library {
    return Intl.message(
      'Videos library',
      name: 'vid_library',
      desc: '',
      args: [],
    );
  }

  /// `Fairs`
  String get fairs {
    return Intl.message(
      'Fairs',
      name: 'fairs',
      desc: '',
      args: [],
    );
  }

  /// `Paricipating countries`
  String get par_countries {
    return Intl.message(
      'Paricipating countries',
      name: 'par_countries',
      desc: '',
      args: [],
    );
  }

  /// `Paricipating companies`
  String get par_companies {
    return Intl.message(
      'Paricipating companies',
      name: 'par_companies',
      desc: '',
      args: [],
    );
  }

  /// `Companies guide`
  String get companies_guide {
    return Intl.message(
      'Companies guide',
      name: 'companies_guide',
      desc: '',
      args: [],
    );
  }

  /// `Sponsoring companies`
  String get sponsoring_companies {
    return Intl.message(
      'Sponsoring companies',
      name: 'sponsoring_companies',
      desc: '',
      args: [],
    );
  }

  /// `Ads`
  String get ads {
    return Intl.message(
      'Ads',
      name: 'ads',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get statistics {
    return Intl.message(
      'Statistics',
      name: 'statistics',
      desc: '',
      args: [],
    );
  }

  /// `bod`
  String get bod {
    return Intl.message(
      'bod',
      name: 'bod',
      desc: '',
      args: [],
    );
  }

  /// `Baghdad's international fair history`
  String get fair_history {
    return Intl.message(
      'Baghdad\'s international fair history',
      name: 'fair_history',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Filter by date`
  String get filter_by_date {
    return Intl.message(
      'Filter by date',
      name: 'filter_by_date',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Latest news`
  String get latest_news {
    return Intl.message(
      'Latest news',
      name: 'latest_news',
      desc: '',
      args: [],
    );
  }

  /// `Show video`
  String get show_video {
    return Intl.message(
      'Show video',
      name: 'show_video',
      desc: '',
      args: [],
    );
  }

  /// `No filter`
  String get no_filter {
    return Intl.message(
      'No filter',
      name: 'no_filter',
      desc: '',
      args: [],
    );
  }

  /// `Higher price`
  String get higher_price {
    return Intl.message(
      'Higher price',
      name: 'higher_price',
      desc: '',
      args: [],
    );
  }

  /// `Less price`
  String get less_price {
    return Intl.message(
      'Less price',
      name: 'less_price',
      desc: '',
      args: [],
    );
  }

  /// `Oldest`
  String get oldest {
    return Intl.message(
      'Oldest',
      name: 'oldest',
      desc: '',
      args: [],
    );
  }

  /// `Top rated`
  String get top_rated {
    return Intl.message(
      'Top rated',
      name: 'top_rated',
      desc: '',
      args: [],
    );
  }

  /// `Low rated`
  String get low_rated {
    return Intl.message(
      'Low rated',
      name: 'low_rated',
      desc: '',
      args: [],
    );
  }

  /// `Search and filtering`
  String get search_and_filtering {
    return Intl.message(
      'Search and filtering',
      name: 'search_and_filtering',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization_fair {
    return Intl.message(
      'Specialization',
      name: 'specialization_fair',
      desc: '',
      args: [],
    );
  }

  /// `Orginizer`
  String get orginizer {
    return Intl.message(
      'Orginizer',
      name: 'orginizer',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get governorate {
    return Intl.message(
      'Governorate',
      name: 'governorate',
      desc: '',
      args: [],
    );
  }

  /// `Condition`
  String get condition {
    return Intl.message(
      'Condition',
      name: 'condition',
      desc: '',
      args: [],
    );
  }

  /// `Ended`
  String get ended {
    return Intl.message(
      'Ended',
      name: 'ended',
      desc: '',
      args: [],
    );
  }

  /// `Ongoing`
  String get ongoing {
    return Intl.message(
      'Ongoing',
      name: 'ongoing',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `All locations`
  String get all_locations {
    return Intl.message(
      'All locations',
      name: 'all_locations',
      desc: '',
      args: [],
    );
  }

  /// `Inside iraq`
  String get inside_iraq {
    return Intl.message(
      'Inside iraq',
      name: 'inside_iraq',
      desc: '',
      args: [],
    );
  }

  /// `Outside iraq`
  String get outside_iraq {
    return Intl.message(
      'Outside iraq',
      name: 'outside_iraq',
      desc: '',
      args: [],
    );
  }

  /// `Cancel filter`
  String get cancel_fair_filter {
    return Intl.message(
      'Cancel filter',
      name: 'cancel_fair_filter',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get newest {
    return Intl.message(
      'Newest',
      name: 'newest',
      desc: '',
      args: [],
    );
  }

  /// `General Specialization`
  String get general_specialization {
    return Intl.message(
      'General Specialization',
      name: 'general_specialization',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get public {
    return Intl.message(
      'Public',
      name: 'public',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get private {
    return Intl.message(
      'Private',
      name: 'private',
      desc: '',
      args: [],
    );
  }

  /// `Mixed`
  String get mixed {
    return Intl.message(
      'Mixed',
      name: 'mixed',
      desc: '',
      args: [],
    );
  }

  /// `Commodity trading`
  String get commodity_trade {
    return Intl.message(
      'Commodity trading',
      name: 'commodity_trade',
      desc: '',
      args: [],
    );
  }

  /// `Services trading`
  String get trade_services {
    return Intl.message(
      'Services trading',
      name: 'trade_services',
      desc: '',
      args: [],
    );
  }

  /// `Producing`
  String get producing {
    return Intl.message(
      'Producing',
      name: 'producing',
      desc: '',
      args: [],
    );
  }

  /// `Diamond partners`
  String get diamond_partners {
    return Intl.message(
      'Diamond partners',
      name: 'diamond_partners',
      desc: '',
      args: [],
    );
  }

  /// `Golden partners`
  String get golden_partners {
    return Intl.message(
      'Golden partners',
      name: 'golden_partners',
      desc: '',
      args: [],
    );
  }

  /// `Silver partners`
  String get silver_partners {
    return Intl.message(
      'Silver partners',
      name: 'silver_partners',
      desc: '',
      args: [],
    );
  }

  /// `Filter by years`
  String get filter_by_year {
    return Intl.message(
      'Filter by years',
      name: 'filter_by_year',
      desc: '',
      args: [],
    );
  }

  /// `Join the future`
  String get join_the_future {
    return Intl.message(
      'Join the future',
      name: 'join_the_future',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error {
    return Intl.message(
      'An error occurred',
      name: 'error',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
