quickSort(List a) {
    if (a.length <= 1) {
      return a;
    }

    int pivot = a[0];
    List<int> less = [];
    List<int> more = [];
    List<int> pivotList = [];

    // Partition
    a.forEach((var i){
      if (i.compareTo(pivot) < 0) {
        more.add(i);
      } else if (i.compareTo(pivot) > 0) {
        less.add(i);
      } else {
        pivotList.add(i);
      }
    });

    // Recursively sort sublists
    less = quickSort(less);
    more = quickSort(more);

    // Concatenate results
    less.addAll(pivotList);
    less.addAll(more);
    return less;
  }

