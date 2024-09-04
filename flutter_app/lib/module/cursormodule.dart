class Cursor {
  String img;
  String name;
  String dec;
  String detail;
  String color;
  Cursor(
      {required this.img,
      required this.name,
      required this.dec,
      required this.color,
      required this.detail});
  static List<Cursor> cursorlist = [
    Cursor(
        img: "assets/Group 44.png",
        name: "Quality ",
        dec: "Join the movement!",
        color: "Color.fromARGB(94, 162, 95, 1),",
        detail:
            "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain. "),
    Cursor(
      img: "assets/Group 46.png",
      name: "Convenient ",
      dec: "Join the movement!",
      color: "Color.fromARGB(213, 113, 91, 1),",
      detail:
          "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers.",
    ),
    Cursor(
      img: "assets/Group.png",
      name: "Local",
      dec: "Join the movement!",
      color: "Color.fromARGB(248, 197, 105, 1),",
      detail:
          "We love the earth and know you do too! Join us in reducing our local carbon footprint one order at a time. ",
    ),
  ];
}
