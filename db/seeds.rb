File.open('flashcard_samples.txt').each_slice(3) do |line|
  Card.create(front: line[0].chomp, back: line[1].chomp)
end
