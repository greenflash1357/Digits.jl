module Digits

export
  undigit
  digithist
  isanagram


function undigit(l:Array{Int,1})
  return foldr((a,b)->b*10+a,l)
end

function digithist(l::Array{Int,1})
  return hist(l,-0.5:10)[2]
end

digithist(i::Int) = digithist(digits(i))

function isanagram(a::Array{Int,1}, b::Array{Int,1})
  return digithist(a) == digithist(b)
end

function isanagram(a::Int, b::Int)
  return isanagram(digits(a),digits(b))
end



end # module

