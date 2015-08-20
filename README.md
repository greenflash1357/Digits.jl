# Digits

[![Build Status: Travis CI](https://travis-ci.org/greenflash1357/Digits.jl.svg?branch=master)](https://travis-ci.org/greenflash1357/Digits.jl)
[![Build status: Appveyor](https://ci.appveyor.com/api/projects/status/gvomfrq6v71pyt0d?svg=true)](https://ci.appveyor.com/project/greenflash1357/digits-jl)
[![Digits Pkg Test](http://pkg.julialang.org/badges/Digits_0.3.svg)](http://pkg.julialang.org/?pkg=Digits&ver=release)
[![Coverage Status](https://coveralls.io/repos/greenflash1357/Digits.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/greenflash1357/Digits.jl?branch=master)

A package for integer digit computations.

Based on julias `digits()` function.

### Installation / Testing

You can install the package by typing:
```julia
Pkg.add("Digits")
using Digits
```
or clone the latest version directly from the repo:
```julia
Pkg.clone("https://github.com/greenflash1357/Digits.jl.git")
using Digits
```

### Function Overview

##### reversedigits(n)/reversedigits!(l)
Returns the digits of n in reversed order, i.e. `reversedigits(n) == undigit(reverse!(digits(n)))`. For a list of digits this is equivalent to `reverse()` and `reverse!()`.

##### undigit(A [, base])
The inverse function to julias `digits()`. Accepting a vector of integers where more significant digits are at higher indexes, according to `digits()` and a base. Default is 10.

##### digithist(n)
Creates a digit histogram for a given number. The result is a 1-dimensional 10-element array containing the count of each digit. The first element contains the count of 0, while the last represents the count of 9.

##### contains(a,b)
Checks whether a or b is part of the other, e.g. `contains(1356,35)` will result in `true`.

##### startswith(a,b) / endswith(a,b)
Checks wether a or b is the first/last part of the other, e.g. `startswith(1356,1)`, `startswith(32,3236)`, `endswith(31,9831)` will all return `true`.

##### isanagram(a,b)
Returns true if a and b are valid permutations of their digits.

##### ispalindrome(n)
Returns true if n is a palindromic number.

##### crop(n,i)
Cuts off i digits from n. If i is positive the first (most significant) digits are cropped. If i is negative the last digits are cut off.

##### combine(a,b)
Return the combination of a and b, similar to a string concatenation, e.g. `combine(13,56)` -> `1356`.

##### crosssum(n)
Calculates the cross sum over n.

##### select(n,idx)
Returns the digits of n with index idx. idx can be an array or range, e.g. `select(64247,[2:4])` -> `424`

##### replace(n,idx,vals) / replace!(l,idx,vals)
Replaces the digits of n with index idx by the values in vals. vals has to be same size as idx.
For arrays of digits there is also an inplace version of replace.
Example: `replace(6215,[2,4],[8,7])` -> `6817`

##### replace(n,olddigit,newdigit) / replace!(l,olddigit,newdigit)
Replaces the all digits of n with value olddigit with newdigit. There is also an inplace operation for arrays of digits.
Example: `replace(1363,3,9)` -> `1969`

##### digitroot(n) / digitroot(l)
Computes the digital root of n. That is the iterative sum of the digits until the result is a single digit number. `digitroot(13548)` -> `3`


### Notes
- Most functions accept an array of digits aswell as an integer as input.
- For most of the array methods there exists an inplace operation.
- This package should also work for negative integers, but this can become tricky. Take a closer look at the digit representation of negative integers. `digits(-135)` -> `[-5, -3, -1]`.
