=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end

class Isogram
  def self.isogram?(input)
    return input.upcase.chars.map {|char| input.upcase.chars.select {|c| c == char && (c!='-'&& c!=' ') }}.select {|result| result.count>1}.count == 0
  end
end