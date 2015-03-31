module Digits

export
  reversedigits,
  undigit,
  digithist,
  isanagram,
  ispalindrom,
  contains


reversedigits(n::Int) = reverse!(digits(n))

function undigit(l::Array{Int,1})
  return foldr((a,b)->b*10+a,l)
end

function digithist(l::Array{Int,1})
  return hist(l,-0.5:10)[2]
end

digithist(n::Int) = digithist(digits(n))

function isanagram(a::Array{Int,1}, b::Array{Int,1})
  return digithist(a) == digithist(b)
end

function isanagram(a::Int, b::Int)
  return isanagram(digits(a),digits(b))
end

function ispalindrom(l::Array{Int,1})
  return l == reverse(l)
  #TODO: possible performance improvement: loop only over half the list
end

function ispalindrom2(l::Array{Int,1})
  m = div(length(l),2)
  for i = 1:m
    if l[i] != l[end-i+1]
      return false
    end
  end
  return true
end

ispalindrom(n::Int) = ispalindrom(digits(n))

function contains(a::Array{Int,1},b::Array{Int,1})
  la = length(a)
  lb = length(b)
  if la > lb
    for i = 1:la-lb+1
      if a[i:i+lb-1] == b
        return true
      end
    end
  elseif lb > la
    for i = 1:lb-la+1
      if b[i:i+la-1] == a
        return true
      end
    end
  elseif a == b
    return true
  end
  return false
end

contains(a::Array{Int,1},b::Int) = contains(a,digits(b))
contains(a::Int,b::Array{Int,1}) = contains(digits(a),b)
contains(a::Int,b::Int) = contains(digits(a),digits(b))




end # module
