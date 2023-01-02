void main() {
  var giveMeFive = true;
  print("Hello World");
  var numbers = [
    12,
    3,
    4,
    if (giveMeFive) 5,
  ];

  var oldFriends = [
    "a",
    "b",
  ];

  var newFriends = [
    "aa",
    for (var old in oldFriends) "test $old",
  ];
}
