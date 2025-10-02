class Complement
  DIC = {
    "C" => "G",
    "G" => "C",
    "T" => "A",
    "A" => "U"
  }
  def self.of_dna(symbol)
    symbol.chars.map{|s| DIC[s]}.join
  end 
end