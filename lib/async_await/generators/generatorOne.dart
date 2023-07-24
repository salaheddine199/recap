List<int> li = [2, 5, 8, 3, 2];

class ListIterator implements Iterator<int>{

  List<int> list = [];
  int? _current;
  int index = 0;

  ListIterator(this.list);

  @override
  int get current => 0; // modify it for null safety
  // int get current => _current; //throw UnimplementedError();

  @override
  bool moveNext() {
    if (index == list.length){
      _current = null;
      return false;
    }else{
      _current = list[index++];
      return true;
    }
  }

}



testIterator(){

  var obj = ListIterator(li); // li.iterator
  while(obj.moveNext())
    print("kda  "+obj._current.toString());

}

void main() => testIterator(); 