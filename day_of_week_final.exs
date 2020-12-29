defmodule Sample.Calendar do
  def day_abbrev(day) do
    cond do
      day == :Monday    -> 
          IO.puts "We got Monday. This is a multi-line condition."
          "M"
      day == :Tuesday   -> "Tu"
      day == :Wednesday -> "W"
      day == :Thursday  -> "Th"
      day == :Friday    -> "F"
      day == :Saturday  -> "Sa"
      day == :Sunday    -> "Su"
      true              -> "Invalid day"
    end
  end

  # we could also do pattern matching
  def day_abbrev2(:Monday),    do: "M"
  def day_abbrev2(:Tuesday),   do: "Tu"
  def day_abbrev2(:Wednesday), do: "W"
  def day_abbrev2(:Thursday),  do: "Th"
  def day_abbrev2(:Friday),    do: "F"
  def day_abbrev2(:Saturday),  do: "Sa"
  def day_abbrev2(:Sunday),    do: "Su"
  def day_abbrev2(_),          do: "Invalid day"

  def day_abbrev3(day) do
    case day do
      :Monday    -> "M"
      :Tuesday   -> "Tu"
      :Wednesday -> "W"
      :Thursday  -> "Th"
      :Friday    -> "F"
      :Saturday  -> "Sa"
      :Sunday    -> "Su"
      _          -> "Invalid day"
    end
  end

  # case w/pattern matching to parse a date
  
  def describe_date( date ) do
    case date do
      {_, 1, _}      -> "Brand new month"
      {12, 25, _}    -> "Merry XMas"
      {month, 25, _} -> "Only #{12 - month} months until XMas"
      {10, 31, 1517} -> "The reformation"
      {10, 31, _}    -> "Happy Halloween"
      {7, 4, 1776}   -> "Signing of DofI"
      {7, 4, x} when x < 1776 -> "Waiting for 'Merica"
      {7, 4, x} when x > 1776 -> "Happy Independence Day: #{x-1776} years!"
      {_, m, _} when m <= 12  -> "Just another day"
      {_, _, _}      -> "Invalid month"
    end
  end

end

