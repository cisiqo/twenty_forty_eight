defmodule TwentyFortyEight.SequenceTest do
  use ExUnit.Case

  alias TwentyFortyEight.Sequence

  describe "pad" do
    test "adds nothing when the list is the correct length" do
      assert Sequence.pad([1, 2, 3], 3) == [1, 2, 3]
    end
  end

  describe "combined" do
    test "length of input and output are the same" do
      assert Sequence.combined([nil, nil]) == [nil, nil]
    end

    test "numbers are shifted to the left" do
      assert Sequence.combined([nil, 2, nil, nil]) == [2, nil, nil, nil]
    end

    test "combination with no matching numbers results in same" do
      assert Sequence.combined([2, 4, 8]) == [2, 4, 8]
    end

    test "simple combination adds" do
      assert Sequence.combined([2, 2]) == [4, nil]
    end

    test "three of the smame only combindes first pair" do
      assert Sequence.combined([2, 2, 2]) == [4, 2, nil]
    end

    test "two of same separated by not same does not combined" do
      assert Sequence.combined([2, 4, 2]) == [2, 4, 2]
    end

    test "six of the same results in 3 combined values" do
      assert Sequence.combined([2, 2, 2, 2, 2, 2]) == [4, 4, 4, nil, nil, nil]
    end

    test "large numbers combined as well" do
      assert Sequence.combined([2_048, 2_048, 2]) == [4_096, 2, nil]
    end
  end
end
