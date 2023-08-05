defmodule TwentyFortyEight.BoardTest do
  use ExUnit.Case

  alias TwentyFortyEight.Board

  describe "shift(:left)" do
    test "simple" do
      board = %Board{
        width: 4,
        height: 4,
        data: [nil, 2, 2, nil, 4, 4, nil, nil, nil, nil, 8, 8, nil, 2, 4, 2]
      }

      assert Board.shift(board, :left) == %Board{
               width: 4,
               height: 4,
               data: [4, nil, nil, nil, 8, nil, nil, nil, 16, nil, nil, nil, 2, 4, 2, nil]
             }
    end
  end

  describe "shift(:right)" do
    test "simple" do
      board = %Board{
        width: 4,
        height: 4,
        data: [nil, 2, 2, nil, 4, 4, nil, nil, nil, nil, 8, 8, nil, 2, 4, 2]
      }

      assert Board.shift(board, :right) == %Board{
               width: 4,
               height: 4,
               data: [nil, nil, nil, 4, nil, nil, nil, 8, nil, nil, nil, 16, nil, 2, 4, 2]
             }
    end
  end

  describe "shift(:up)" do
    test "simple" do
      board = %Board{
        width: 4,
        height: 4,
        data: [nil, nil, nil, nil, nil, nil, nil, nil, 2, 4, 8, 16, 2, 4, 8, 16]
      }

      assert Board.shift(board, :up) == %Board{
               width: 4,
               height: 4,
               data: [4, 8, 16, 32, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]
             }
    end
  end

  describe "shift(:down)" do
    test "simple" do
      board = %Board{
        width: 4,
        height: 4,
        data: [2, 4, 8, 16, 2, 4, 8, 16, nil, nil, nil, nil, nil, nil, nil, nil]
      }

      assert Board.shift(board, :down) == %Board{
               width: 4,
               height: 4,
               data: [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 4, 8, 16, 32]
             }
    end
  end
end
