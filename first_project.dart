import 'dart:io';

void main() {
  final List<String> productNames = ['Xiaomi', 'Iphone', 'Samsung', 'Lenovo'];
  final List<int> productPrices = [600, 2000, 500, 800];
  final List<int> productRams = [6, 8, 4, 8];

  const String loginQuestion =
      'Please, select Login type:\n1 - Login with email and password\n2 - Login as Guest';
  print(loginQuestion);
  final loginType = stdin.readLineSync();
  if (loginType == '1') {
    print('Enter the email');
    final email = stdin.readLineSync();
    print("Enter the password");
    final password = stdin.readLineSync();
    if (email == null ||
        email.isEmpty ||
        password == null ||
        password.isEmpty) {
      print('Email and password cant be empty');
      return;
    }
  } else {
    print('You are logged as Guest');
  }
  print('Products:');
  productNames.forEach((name) {
    final int index = productNames.indexOf(name);
    print('${index} - $name');
  });
  print('Enter a product number:');
  final productNumberString = stdin.readLineSync();
  if (productNumberString == null) {
    print("You didn't enter right input");
    return;
  } else {
    final int productNumber = int.parse(productNumberString);
    print('Name: ${productNames[productNumber]}');
    print('Ram: ${productRams[productNumber]}');
    print('Price: ${productPrices[productNumber]}');

    print('Do you want continue? Yes or No?');
    final answer = stdin.readLineSync();
    if (answer == null || answer.toLowerCase() == 'no') {
      return;
    }
    print('Please enter the Payment type');
    print('1 - Cash');
    print('2 - Credit');
    final paymentType = stdin.readLineSync();
    if (paymentType == '1') {
      print('Please select pickup type');
      print('1 - Delivery');
      print('2 - Take it yourself');
      final pickupType = stdin.readLineSync();
      if (pickupType == '1') {
        final int totalPrice = productPrices[productNumber] + 10;
        print('Total price with delivery - $totalPrice');
      } else {
        print('Total price - ${productPrices[productNumber]}');
      }
    } else {
      print('Do you want installment? Yes or no');
      final installmentAnswer = stdin.readLineSync();
      if (installmentAnswer?.toLowerCase() == 'no') {
        print('Total price - ${productPrices[productNumber]}');
        print('Please enter the card info:');
        final cardInfo = stdin.readLineSync();
        if (cardInfo == null || cardInfo.length < 16) {
          print('Your card info incorrect');
          return;
        }
      } else {
        print('Please select Bank:');
        print('1 - Birkart');
        print('2 - Tamkart');
        print('3 - Bolkart');

        final bankNumber = stdin.readLineSync();
      }
    }
  }
}
