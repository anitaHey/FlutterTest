class PlaceItem {
  final int id;
  final String title;
  final String subtitle;
  int check_num;
  int message_num;
  final String image;

  PlaceItem(this.id, this.title, this.subtitle, this.image, this.check_num,
      this.message_num);
}

class PlaceItems {
  static PlaceItems instance;
  List<PlaceItem> _listItems = new List<PlaceItem>();

  static PlaceItems getInstance() {
    if (instance == null) {
      instance = new PlaceItems();
    }
    return instance;
  }

  static void setInstance(PlaceItems newInstance) {
    instance = newInstance;
  }

  PlaceItems() {
    setInstance(this);
    addItems();
  }

  void addItems() {
    _listItems.add(new PlaceItem(0, "101大樓", "110台北市信義區信義路五段7號",
        'assets/images/taipei101.jpeg', 5497, 103));
    _listItems.add(new PlaceItem(1, "Miramar美麗華百樂園", "10491台北市中山區敬業三路20號",
        'assets/images/miramar.jpg', 1275, 53));
    _listItems.add(new PlaceItem(
        2, "微風信義", "110台北市信義區忠孝東路五段68號", 'assets/images/breeze.jpg', 670, 40));
    _listItems.add(new PlaceItem(3, "象山", "110台北市信義區信義路五段150巷401弄31號",
        'assets/images/mountain.jpg', 2415, 201));
    _listItems.add(new PlaceItem(4, "臺北市建國假日花市", "106台北市大安區建國南路一段",
        'assets/images/flower.jpg', 243, 17));
    _listItems.add(new PlaceItem(5, "台北和平籃球館", "106台北市大安區敦南街76巷28號",
        'assets/images/sport.jpg', 1789, 506));
    _listItems.add(new PlaceItem(
        6, "台北植物園", "10066台北市中正區南海路53號", 'assets/images/plant.jpg', 6199, 459));
  }

  List<PlaceItem> get listItems => _listItems;
}
