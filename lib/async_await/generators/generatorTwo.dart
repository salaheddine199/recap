List<int> li = [2, 5, 8, 3, 2];

class MyInt extends Iterable<String>{

  final List<String> li2;
  MyInt(this.li2);

  @override
  Iterator<String> get iterator => li2.iterator;

}



textIterable(){

  final myli2 = MyInt(["One", "Two", "Three", "Four", "Five"]);
  for(final i in myli2)
    print(i);

  final ll = myli2.map((e) => e.length);
  for(final i in ll)
    print(i);


}

void main() => textIterable(); 