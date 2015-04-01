module Digits

export
  reversedigits,
  undigit,
  digithist,
  isanagram,
  ispalindrom,
  contains,
  startswith,
  endswith


reversedigits(n::Int) = reverse!(digits(n))

function undigit(l::Array{Int,1})
  return foldr((a,b)->b*10+a,l)
end

undigit(n::Int) = n

function digithist(l::Array{Int,1})
  return hist(l,-0.5:10)[2]
end

digithist(n::Int) = digithist(digits(n))

function isanagram(a::Array{Int,1}, b::Array{Int,1})
  return digithist(a) == digithist(b)
end

isanagram(a::Int, b::Int) = isanagram(digits(a),digits(b))
#TODO: add wrapper for type mixed inputs: int,Array  Array,int

function ispalindrome(l::Array{Int,1})
  return l == reverse(l)
  #TODO: possible performance improvement: loop only over half the list
end

function ispalindrome2(l::Array{Int,1})
  m = div(length(l),2)
  for i = 1:m
    if l[i] != l[end-i+1]
      return false
    end
  end
  return true
end

ispalindrome(n::Int) = ispalindrom(digits(n))

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

function endswith(a::Array{Int,1},b::Array{Int,1})
  if a == b
    return true
  end
  la = length(a)
  lb = length(b)
  if la > lb
    if a[1:lb] == b
      return true
    end
  else
    if b[1:la] == a
      return true
    end
  end
  return false
end

endswith(a::Array{Int,1},b::Int) = endswith(a,digits(b))
endswith(a::Int,b::Array{Int,1}) = endswith(digits(a),b)
endswith(a::Int,b::Int) = endswith(digits(a),digits(b))

function startswith(a::Array{Int,1},b::Array{Int,1})
  if a == b
    return true
  end
  la = length(a)
  lb = length(b)
  if la > lb
    if a[end-lb+1:end] == b
      return true
    end
  else
    if b[end-la+1:end] == a
      return true
    end
  end
  return false
end

startswith(a::Array{Int,1},b::Int) = startswith(a,digits(b))
startswith(a::Int,b::Array{Int,1}) = startswith(digits(a),b)
startswith(a::Int,b::Int) = startswith(digits(a),digits(b))



end # module
