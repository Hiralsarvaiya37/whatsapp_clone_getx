abstract class CallEvent {}

class LoadContacts extends CallEvent {}

class SearchContacts extends CallEvent {
  final String query;
  SearchContacts(this.query);
}

class AddToFavorites extends CallEvent {
  final String user;
  AddToFavorites(this.user);
}
