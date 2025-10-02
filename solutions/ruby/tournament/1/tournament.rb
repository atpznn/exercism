class PersonMatch
  attr_reader :name, :w, :d, :l 

  def initialize(name) 
    @name = name
    @w = 0 
    @d = 0
    @l = 0
  end
  
  def add_lost_point; @l += 1; end
  def add_win_point; @w += 1; end
  def add_draw_point; @d += 1; end

  def mp
    @w + @d + @l
  end
  
  def p
    @w * 3 + @d * 1 
  end
end

class Tournament
  
  def self.row_template(name: "Team", mp: "MP", w: "W", d: "D", l: "L", p: "P")
    "#{name.to_s.ljust(30)} | #{mp.to_s.rjust(2)} | #{w.to_s.rjust(2)} | #{d.to_s.rjust(2)} | #{l.to_s.rjust(2)} | #{p.to_s.rjust(2)}\n"
  end
  
  def self.process_score_from_line(input)
    team_data = {} 

    input.lines.each do |line|
      team_a, team_b, result = line.strip.split(';')
      
      next unless team_a && team_b && result

      player_a = team_data[team_a] ||= PersonMatch.new(team_a)
      player_b = team_data[team_b] ||= PersonMatch.new(team_b)

      case result.strip.downcase
      when "win" 
        player_a.add_win_point
        player_b.add_lost_point
      when "loss"
        player_a.add_lost_point
        player_b.add_win_point
      when "draw"
        player_a.add_draw_point
        player_b.add_draw_point
      end
    end
    
    team_data.values 
  end
  
  def self.tally(input)
    match_results = self.process_score_from_line(input)
    
    sorted_results = match_results.sort do |a, b|
      [b.p, a.name] <=> [a.p, b.name]
    end

    header = self.row_template
    
    rows = sorted_results.map do |team| 
      self.row_template(
        name: team.name, 
        mp: team.mp, 
        w: team.w, 
        d: team.d, 
        l: team.l, 
        p: team.p
      )
    end
    
    header + rows.join()
  end
end
