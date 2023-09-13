# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  nil 
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2  
end

def github_points_100_plus?(candidate)
  candidate[:github_points] >= 100 
end

def knows_ruby_or_python?(candidate)
  candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python")
end 

def applied_last_15_days?(candidate)
  (Date.today - candidate[:date_applied]).to_i <= 15
end

def over_17?(candidate)
  candidate[:age] >= 18
end

def qualified_candidates(candidates)
  qualified = []
  
  candidates.each do |candidate|
    if experienced?(candidate) && 
       github_points_100_plus?(candidate) &&
       knows_ruby_or_python?(candidate) &&
       applied_last_15_days?(candidate) &&
       over_17?(candidate)
       
       qualified << candidate
    end
  end

  return qualified
end

def ordered_by_qualifications(candidates)
  
  ordered_candidates = candidates.sort_by do |candidate| 
    [-candidate[:years_of_experience], -candidate[:github_points]]
  end

  return ordered_candidates
end