enum ErrorType {
  network,
  internetConnection,
  unknown;

  String toMessage() {
    return switch (this) {
      ErrorType.network => "We can't get data right now\nPlease try later",
      ErrorType.internetConnection =>
        "No internet connection\nPlease, check it and retry",
      ErrorType.unknown =>
        "Something happened on our side\nWe are working on fixing that",
    };
  }
}
