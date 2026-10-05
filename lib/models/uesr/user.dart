class User {
  User(this._id, this._passward, this._email);
  final String _email;
  final String _id;
  final String _passward;

  String get email => _email;
  String get id => _id;
  String get passward => _passward;
}
