package thx.stream;

import utest.Assert;
using thx.Iterators;
using thx.Functions;
using thx.stream.TestStream;

class TestStreamCreate {
  public function new() {}

  public function testNew() {
    var stream = new Stream(function(l) {
      (0...3).forEach.fn(l(Next(_)));
      l(Done);
      return function() {};
    });

    stream.assertValues([0,1,2]);
  }

  public function testCreate() {
    var stream = Stream.create(function(o) {
      (0...3).forEach(o.next);
      o.done();
    });

    stream.assertValues([0,1,2]);
  }

  public function testOfValues() {
    Stream.ofValues([0,1,2]).assertValues([0,1,2]);
    Stream.ofIterator(0...3).assertValues([0,1,2]);
  }
}
