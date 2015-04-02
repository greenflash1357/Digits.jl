using Digits
using Base.Test


# test data
n = 1234567890
p = 1234567890987654321
l = digits(n)
lp = digits(p)

# reversedigits
@test reversedigits(n) == reverse!(digits(n))
@test reversedigits(p) == digits(p)

# undigit
@test undigit(l) == n
@test undigit(n) == n
@test undigit(Int[]) == 0

# digithist
@test digithist(l) == [1,1,1,1,1,1,1,1,1,1]
@test digithist(n) == [1,1,1,1,1,1,1,1,1,1]
@test digithist(p) == [1,2,2,2,2,2,2,2,2,2]

# isanagram
@test isanagram(122334,431232) == true
@test isanagram(digits(122334),digits(431232)) == true
@test isanagram(122334,433232) == false

# ispalindrom
@test ispalindrome(p) == true
@test ispalindrome(lp) == true
@test ispalindrome(n) == false

# contains
@test contains(n,3456) == true
@test contains(l,567) == true
@test contains(n,digits(123)) == true
@test contains(l,digits(789)) == true
@test contains(n,457) == false

# startswith
@test startswith(n,123) == true
@test startswith(l,1234) == true
@test startswith(l,digits(12)) == true
@test startswith(n,digits(1)) == true
@test startswith(n,2345) == false

# endswith
@test endswith(n,7890) == true
@test endswith(l,90) == true
@test endswith(l,digits(90)) == true
@test endswith(n,digits(567890)) == true
@test endswith(n,45678) == false

# crop
@test crop(n,3) == 4567890
@test crop(n,-4) == 123456
@test crop(l,5) == digits(67890)
@test crop(l,-8) == digits(12)
@test crop(n,10) == 0
@test crop(l,10) == [0]
@test crop(n,0) == n
@test crop(l,0) == l
