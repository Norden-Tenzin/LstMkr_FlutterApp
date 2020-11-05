import "helper.dart";

main(List<String> args) {
  var x = PostMkr();
  int curr = 1;

  for (int i = 0; i < 10; i++) {
    x.addItems(curr);
    curr++;
  }
  var mapLst = Map.fromIterable(x.lst, key: (e) => e[0], value: (e) => e[1]);
  for (int i = 0; i < 10; i++) {
    x.addItems(curr);
    curr++;
  }
  print(mapLst);
  print(x.lst);
  mapLst = Map.fromIterable(x.lst, key: (e) => e[0], value: (e) => e[1]);

  print(mapLst);
}
