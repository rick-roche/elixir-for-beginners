## Recursion

defmodule Recursion do
    def countdown(0), do: IO.puts "Blast off!"
    def countdown(n) when n == 2 do
        IO.puts "#{n}...ignite engines..."
        countdown(n - 1)
    end
    def countdown(n) when is_integer n do
        IO.puts n
        countdown(n - 1)
    end
    def countdown(str) when is_binary(str), do: IO.puts "C'mon... countdown is a number!"
end

Recursion.countdown(5)
Recursion.countdown("ten")