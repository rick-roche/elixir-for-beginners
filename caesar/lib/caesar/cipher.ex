defmodule Caesar.Cipher do
    require Logger

    @alphabet_size Application.get_env(:caesar, :alphabet_size)

    @moduledoc """
    Caesar Cipher module, which maps chars to new chars
    """

    @doc """
    Encrypt the message by applying a mapping that shifts the alphabet by the `shift` value.

    ## Examples

        iex> Caesar.Cipher.encrypt("hello world!", 1)
        "gdkkn vnqkc!"
    """
    def encrypt(msg, shift) do
        Logger.debug("encrypting \"#{msg}\" with a shift number: #{shift}")
        # convert msg into char_list
        msg
            |> to_charlist
        # iterate over list apply shift mapping
            |> Enum.map(&shift_char(&1, shift))
        # return list as binary string
            |> List.to_string
    end

    defp shift_char(char, shift) do
        case char do
            chr when chr in (?a..?z) -> calculate_mapping(?a, chr, shift)
            chr when chr in (?A..?Z) -> calculate_mapping(?A, chr, shift)
            chr -> chr
        end
    end

    defp calculate_mapping(base_letter, char, shift) do
        # find the ASCII integer of the char and normalize it
        # by subtracting the size of the alphabet
        normalize = &(&1 - @alphabet_size)
        # ensure shift number is within the alphabet size
        shift_num = rem(shift, @alphabet_size)
        #calculate the shifted value
        base_letter + rem(char - normalize.(base_letter) - shift_num, @alphabet_size)
    end
end