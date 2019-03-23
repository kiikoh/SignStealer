import 'dart:math';

var touches = '';
var seqs = [];
var results = ['Not Enough Data', 'Not Enough Data', 'Not Enough Data'];

class SignSequence {
  var result;
  var touches = [];

  SignSequence(this.result, String _touches) {
    this.touches = _touches.split(' ');
    this.touches.removeLast();
  }

  @override
  String toString() {
    return "${this.result}: ${this.touches}";
  }
}

getPredictions() {
  var fasts = [];
  var curves = [];
  var changes = [];
  for (SignSequence pitch in seqs) {
    switch (pitch.result) {
      case "Fastball":
        fasts.add(pitch);
        break;
      case "Curveball":
        curves.add(pitch);
        break;
      case "Changeup":
        changes.add(pitch);
        break;
    }
  }
  results[0] = getMostCommonPair(fasts);
  results[1] = getMostCommonPair(curves);
  results[2] = getMostCommonPair(changes);
  return results;
}

String getMostCommonPair(pitches) {
  if (pitches.length < 2) {
    //gets rid of null pointers by requiring at least 2 data points
    return "Not Enough Data";
  }
  var pairs = [];
  for (var i = 0; i < pitches.length; i++) {
    var ps = [];
    for (var j = 0; j < pitches[i].touches.length - 1; j++) {
      ps.add("${pitches[i].touches[j]} ${pitches[i].touches[j + 1]}");
    }
    ps = ps.toSet().toList();
    pairs.addAll(ps);
  }
  var pairsSet =
      pairs.toSet().toList(); // makes sure all pairs fit into one category
  var counts = List<int>.filled(pairsSet.length, 0);
  for (var p in pairs) {
    int index = pairsSet.indexOf(p); // whatever index
    int value = counts[index]; // get value
    value++; // increment value
    counts[index] = value; // replace value
  }
  var sign = pairs[counts.indexOf(counts.reduce(max))];
  print("Answer: $sign");
  return sign;
}

reset() {
  touches = '';
  seqs = [];
  results = ['Not Enough Data', 'Not Enough Data', 'Not Enough Data'];
}
