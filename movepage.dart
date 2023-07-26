List<Map<String, String>> data = [{"ask":"4138400","bid":"4136000","high":"4154895","last":"4138599","low":"4130000","symbol":"BTC","timestamp":"2023-07-25T06:02:43.361Z","volume":"228.5948"}];

void main(){

  final result = data.contains('ask');

  print(result);


}
