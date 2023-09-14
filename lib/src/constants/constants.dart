enum CurrentCryptoCurrenciesSpotTrading {
  bitcoin(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=BTC'),
  ethereum(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=ETH'),
  bitcoinCash(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=BCH'),
  litecoin(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=LTC'),
  ripple(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=XRP');

  const CurrentCryptoCurrenciesSpotTrading({required this.URL});

  final String URL;
}

enum CurrentCryptoCurrenciesLeveragedTrading {
  bitcoinPerJPY(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=BTC_JPY'),
  ethereumPerJPY(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=ETH_JPY'),
  bitcoinCashPerJPY(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=BCH_JPY'),
  litecoinPerJPY(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=LTC_JPY'),
  ripplePerJPY(URL: 'https://api.coin.z.com/public/v1/ticker?symbol=XRP_JPY');

  const CurrentCryptoCurrenciesLeveragedTrading({required this.URL});

  final String URL;
}

enum CryptoCurrenciesName {
  bitcoin(Abbreviation: 'BTC'),
  ethereum(Abbreviation: 'ETH'),
  bitcoinCash(Abbreviation: 'BTC'),
  litecoin(Abbreviation: 'ETH'),
  ripple(Abbreviation: 'BTC');

  const CryptoCurrenciesName({required this.Abbreviation});

  final String Abbreviation;
}

const String homeScreenTabName = 'ホーム';
const String rateScreenTabName = 'レート';
const String chatScreenTabName = 'チャット';
const String cryptoCurrencyTabName = '暗号資産';
const String exchangeSpotTabName = '取引所 現物';
const String exchangeLeverageTabName = '取引所 レバ';
const String loginText = 'ログイン';
const String logoutText = 'ログアウト';
const String userAccountText = 'ユーザーアカウント';
const String backHomeTabButton = 'ホームに戻る';
const String inputUserName = 'ユーザー名を入力してください';
const String inputMailAddress = 'メールアドレスを入力してください';
const String inputPassword = 'パスワードを入力してください';
const String inputPasswordForConfirm = 'パスワード(確認用)を入力してください';
const String jsonKeyNameStatus = 'status';
const String jsonKeyNameData = 'data';
const String jsonKeyNameResponseTime = 'responsetime';
const String lastTradedPrice = 'last';
const String createAccountText = 'アカウント作成';
const String inputAccountNameForm = 'アカウント名';
const String inputMailAddressForm = 'メールアドレス';
const String inputPasswordForm = 'パスワード';
const String inputPasswordForConfirmForm = 'パスワード(確認用)';
const String finishedButton = '完了';
const String deletedAccountButton = 'アカウント削除';
const String createdAccountNotice = 'アカウントを作成しました';
const String differencePasswordNotice = 'パスワードが一致しません';
const String notFinishedInputNotice = '入力が完了していない項目があります';
String accountNameText = '_NameController.text';
String mailAddressText = '_MailController.text';
String passwordText = '_PassController.text';
String passwordForConfirmText = '_CheckController.text';
late String currentLastValue = 'snapshot.data!.data.first[lastTradedPrice]';
const String noConnection = 'There is no connection!';
const String disconnection = 'lost connection';
String pepperValue = '?T3c/UoCn7A!';
