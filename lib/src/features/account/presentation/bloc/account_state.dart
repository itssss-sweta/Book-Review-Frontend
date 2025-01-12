class AccountState {
  final bool isLoggingOut;
  final bool logoutSuccessful;
  final String? logoutError;
  final String? myListAddedMessage;

  AccountState({
    this.isLoggingOut = false,
    this.logoutSuccessful = false,
    this.logoutError,
    this.myListAddedMessage,
  });

  AccountState copyWith({
    bool? isLoggingOut,
    String? logoutError,
    String? myListAddedMessage,
    bool? logoutSuccessful,
  }) {
    return AccountState(
      isLoggingOut: isLoggingOut ?? this.isLoggingOut,
      logoutSuccessful: logoutSuccessful ?? this.logoutSuccessful,
      logoutError: logoutError ?? this.logoutError,
      myListAddedMessage: myListAddedMessage ?? this.myListAddedMessage,
    );
  }
}
