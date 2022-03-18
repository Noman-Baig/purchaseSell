import 'dart:io';

void main() {
  List items = [
    {"productId": "2k01", "productName": "soap", "price": 30},
    {"productId": "2k02", "productName": "sugar", "price": 70},
    {"productId": "2k03", "productName": "medda", "price": 180},
    {"productId": "2k04", "productName": "besan", "price": 205},
    {"productId": "2k05", "productName": "oil", "price": 150}
  ];
  var start = "a";
  var itemsFile = File("items.csv");
  var customerFile = File("customer.csv");
  var date = DateTime.now().toString();
  var tDate = date.substring(0, 10);
  var tTime = date.substring(11, 19);

  // mainLoop #####
  while (start == "a") {
    var addWhile = "ba";
    var sellWhile = "ca";

    stdout.write("\npress A to Add S To Sell : ");
    var asInput = stdin.readLineSync()!.toLowerCase();

    if (asInput == "a") {
      addWhile = "b";
      while (addWhile == "b") {
        stdout.write("Enter C to continue D to Done : ");
        var inAddWhile = stdin.readLineSync()!.toLowerCase();
        if (inAddWhile == "c") {
          stdout.write("Enter Product Id : ");
          var pId = stdin.readLineSync()!.toLowerCase();
          stdout.write("Enter Product Name : ");
          var pName = stdin.readLineSync()!.toLowerCase();
          stdout.write("Enter Product Price : ");
          var pPrice = int.parse(stdin.readLineSync()!);
          items.add({
            "productId": "bg$pId",
            "productName": "$pName",
            "price": "$pPrice"
          });
          itemsFile.writeAsStringSync(itemsFile.readAsStringSync().toString() +
              "\n${pid},${pName.toString().toUpperCase()},${pPrice.toString().toUpperCase()},$tDate,$tTime");
        } else if (inAddWhile == "d") {
          addWhile = "ba";
          items.forEach((element) {
            print(
                "PRODUCT : ${element["productName"].toString().toUpperCase()} PRICE : ${element["price"]}");
          });
        } else {
          print("Enter Correct Option");
        }
      }
    } else if (asInput == "s") {
      sellWhile = "c";
      while (sellWhile == "c") {
        stdout.write("Enter Procuts Name : ");
        var serchName = stdin.readLineSync()!.toLowerCase();
        for (var i = 0; i < items.length; i++) {
          if (serchName == items[i]["productName"]) {
            stdout.write("Enter Quantity : ");
            var qty = int.parse(stdin.readLineSync()!);
            customerFile.writeAsStringSync(customerFile
                    .readAsStringSync()
                    .toString() +
                "\n${items[i]["productName"]},${items[i]["price"]},${qty},${items[i]["price"] * qty},$tDate,$tTime");
            sellWhile = "ca";
            break;
          } else {
            print("Item Not Found");
            sellWhile = "ca";
            break;
          }
        }
      }
    } else {
      print("Enter Correct Option");
    }
  }
}
