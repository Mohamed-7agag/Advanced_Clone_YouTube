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

  /// `Saved Videos`
  String get savedVideos {
    return Intl.message(
      'Saved Videos',
      name: 'savedVideos',
      desc: '',
      args: [],
    );
  }

  /// `Liked Videos`
  String get likedVideos {
    return Intl.message(
      'Liked Videos',
      name: 'likedVideos',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Time Watched`
  String get timeWatched {
    return Intl.message(
      'Time Watched',
      name: 'timeWatched',
      desc: '',
      args: [],
    );
  }

  /// `Help & Feedback`
  String get help {
    return Intl.message(
      'Help & Feedback',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Your Subscriptions`
  String get yourSubscriptions {
    return Intl.message(
      'Your Subscriptions',
      name: 'yourSubscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Create Short`
  String get createShort {
    return Intl.message(
      'Create Short',
      name: 'createShort',
      desc: '',
      args: [],
    );
  }

  /// `Upload Video`
  String get uploadVideo {
    return Intl.message(
      'Upload Video',
      name: 'uploadVideo',
      desc: '',
      args: [],
    );
  }

  /// `Go Live`
  String get goLive {
    return Intl.message(
      'Go Live',
      name: 'goLive',
      desc: '',
      args: [],
    );
  }

  /// `Create Post`
  String get createPost {
    return Intl.message(
      'Create Post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `You`
  String get you {
    return Intl.message(
      'You',
      name: 'you',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get subscriptions {
    return Intl.message(
      'Subscriptions',
      name: 'subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Trending`
  String get trending {
    return Intl.message(
      'Trending',
      name: 'trending',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Live`
  String get live {
    return Intl.message(
      'Live',
      name: 'live',
      desc: '',
      args: [],
    );
  }

  /// `Gaming`
  String get gaming {
    return Intl.message(
      'Gaming',
      name: 'gaming',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
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

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Add Comment`
  String get addComment {
    return Intl.message(
      'Add Comment',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Podcasts`
  String get poadcasts {
    return Intl.message(
      'Podcasts',
      name: 'poadcasts',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get food {
    return Intl.message(
      'Food',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get entertainment {
    return Intl.message(
      'Entertainment',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Math`
  String get math {
    return Intl.message(
      'Math',
      name: 'math',
      desc: '',
      args: [],
    );
  }

  /// `Subscriber`
  String get subscriber {
    return Intl.message(
      'Subscriber',
      name: 'subscriber',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Subscribed`
  String get subscribed {
    return Intl.message(
      'Subscribed',
      name: 'subscribed',
      desc: '',
      args: [],
    );
  }

  /// `Like`
  String get like {
    return Intl.message(
      'Like',
      name: 'like',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Remove Like`
  String get removeLike {
    return Intl.message(
      'Remove Like',
      name: 'removeLike',
      desc: '',
      args: [],
    );
  }

  /// `Remove Video`
  String get removeVideo {
    return Intl.message(
      'Remove Video',
      name: 'removeVideo',
      desc: '',
      args: [],
    );
  }

  /// `Programming`
  String get programming {
    return Intl.message(
      'Programming',
      name: 'programming',
      desc: '',
      args: [],
    );
  }

  /// `Search for Videos`
  String get searchForVideos {
    return Intl.message(
      'Search for Videos',
      name: 'searchForVideos',
      desc: '',
      args: [],
    );
  }

  /// `Unsubscribe`
  String get unsubscribe {
    return Intl.message(
      'Unsubscribe',
      name: 'unsubscribe',
      desc: '',
      args: [],
    );
  }

  /// `View Channel`
  String get viewChannel {
    return Intl.message(
      'View Channel',
      name: 'viewChannel',
      desc: '',
      args: [],
    );
  }

  /// `No Videos Found`
  String get noVideosFound {
    return Intl.message(
      'No Videos Found',
      name: 'noVideosFound',
      desc: '',
      args: [],
    );
  }

  /// `Views`
  String get views {
    return Intl.message(
      'Views',
      name: 'views',
      desc: '',
      args: [],
    );
  }

  /// `remove`
  String get remove {
    return Intl.message(
      'remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Popular Videos`
  String get popularVideos {
    return Intl.message(
      'Popular Videos',
      name: 'popularVideos',
      desc: '',
      args: [],
    );
  }

  /// `Subscription has been Cancelled`
  String get subscriptionCancelled {
    return Intl.message(
      'Subscription has been Cancelled',
      name: 'subscriptionCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
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
