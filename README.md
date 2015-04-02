# Digits

[![Build Status](https://travis-ci.org/greenflash1357/Digits.jl.svg?branch=master)](https://travis-ci.org/greenflash1357/Digits.jl)

A package for integer digit computations.

Based on julias digits() function.

### Installation / Testing

You can test the package by typing:
```julia
Pkg.clone("https://github.com/greenflash1357/Digits.jl.git")
using Digits
```

### Function Overview

##### reversedigits(n)
Returns the digits of n in reversed order, i.e. reversedigits(n) == reverse!(digits(n))

##### undigit(A)
The reverse function to julias digits(). Accepting a 1-dimensional integer array where more significant digits are at higher indexes, according to digits().

##### digithist(n)
Creates a digit histogram for a given number. The result is a 1-dimensional 10-element array containing the count of each digit. The first element contains the count of 0, while the last represents the count of 9.

##### contains(a,b)
Checks whether a or b is part of the other, e.g. contains(1356,35) will result in true.

##### startswith(a,b)/endswith(a,b)
Checks wether a or b is the first/last part of the other, e.g. startswith(1356,1), startswith(32,3236), endswith(31,9831) will all return true.

##### isanagram(a,b)
Returns true if a and b are valid permutations of their digits.

##### ispalindrome(n)
Returns true if n is a palindromic number.

##### crop(n,i)
Cuts off i digits from n. If i is positive the first (most significant) digits are cropped. If i is negative the last digits are cut off.

##### combine(a,b)
Return the combination of a and b, similar to a string concatenation, e.g. combine(13,56) -> 1356.

##### crosssum(n)
Calculates the cross sum over n.

Note: Most functions accept an array of digits aswell as the number.
