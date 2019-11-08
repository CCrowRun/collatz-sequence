def collatz_sequence(number)
  sequence = [number]
  while number > 1
    if number % 2 == 0
      number = number/2
    elsif number % 2 == 1
      number = 3 * number + 1
    end
    sequence.push(number)
  end
  return sequence
end

def collatz_sequence_recursive(number)
  if number <= 1
    sequence = [number]
    return sequence
  else
    if number % 2 == 0
      next_number = number/2
    elsif number % 2 == 1
      next_number = 3 * number + 1
    end
    [number] + collatz_sequence_recursive(next_number)
  end
end

def longest_collatz(highest_input)
  i = 1
  longest_sequence = { input: 0, length: 0 }
  while i <= highest_input
    sequence_length = collatz_sequence(i).length
    longest_sequence = { input: i, length: sequence_length } if sequence_length > longest_sequence[:length]
    i += 1
  end
  return longest_sequence
end