sealed class AboutState {}

class Loading extends AboutState {}

class Content extends AboutState {
  final String? version;

  Content(this.version);
}
