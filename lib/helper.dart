// var newMap = {'checked': false, 'itemValue': ""};

class PostMkr {
  String title;
  var lst = List();

  PostMkr() {
    this.title = "";
  }

  setTitle(title) {
    this.title = title;
  }

  addItems(i) {
    this.lst.add([i, ListItem()]);
  }
}

class ListItem {
  int key;
  bool checked = false;
  String itemValue;
  ListItem() {
    this.itemValue = "";
  }

  flipChecked() {
    this.checked = !this.checked;
    print("inside:" + this.checked.toString());
  }

  setItemValue(str) {
    this.itemValue = str;
  }
}
