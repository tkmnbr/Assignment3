## Type declaration for the function<br>
square :: Int -> Int<br>
square n = n ^ 2<br>

## A variable<br>
mypi :: Float<br>
mypi = 3.1415<br>

## Basic data types<br>
&& and<br>
|| or<br>
not not<br>
Char character<br>
Float floating point<br>
Double floating point with more precision<br>
Int integer maximum 2147483647<br>
Arbitrarily large integers need the data type Integer data type<br>

## Arithmetic operators<br>
+ addition<br>
- subtraction<br>
* multiplication<br>
/ division<br>
^ power<br>
div whole number division (prefix)<br>
mod remainder from whole number division (prefix)<br>

## Relational operators<br>
> greater than<br>
>= greater than or equal to<br>
== equal to<br>
/= not equal to<br>
<= less than or equal to<br>
< less than<br>

## Conversion from Int to Float<br>
fromIntegral(floor 5.6) + 6.7<br>
11.7<br>

## Commenting<br>
-- precedes a one-line comment<br>
{- this is a block of<br>
comments -}<br>

## Guards<br>
A boolean expression used in a conditional expression in<br>
Haskell is called a guard. Here's an example:<br>
max3 :: Int -> Int -> Int -> Int<br>
max3 x y z<br>
| x >= y && x >= z = x<br>
| y >= z = y<br>
| otherwise = z<br>

## Iteration == recursion<br>
Let's say you want to define a function that takes a<br>
non-negative integer n as a parameter and returns the sum<br>
of all integers from 1 through n. The nice thing about<br>
functional programming is that all you need to know is the<br>
conditional and the function call - there's no loop syntax.<br>
sumints :: Int -> Int<br>
sumints n<br>
| n == 1 = 1<br>
| otherwise = n + sumints (n - 1)<br>

## Tail recursion<br>
fact_tr :: Int -> Int<br>
fact_tr n = fact_tr_helper n 1<br>
<br>
fact_tr_helper :: Int -> Int -> Int<br>
fact_tr_helper n product<br>
| n == 0 = product<br>
| otherwise = fact_tr_helper (n - 1) (product * n)<br>
With tail recursion, the work happens inside the recursive function call<br>

## Lists<br>
List: a collection of an arbitrary number of values or items<br>
all of the same type. The empty list [ ] is a list.<br>
Fundamental data structure of functional programming languages...represent arrays, trees, graphs, whatever.<br>
[1,2,3] -- ok<br>
[7.1, 8.2, 4.5] -- ok<br>
[1, 2.0, 3, 4.7] -- this works too...Haskell promotes literal Int types to Float without loss of information<br>
['a','b','c'] -- ok, and note that a list of characters is a string<br>
['a',1,'c'] -- not so good<br>
<br>
indicating types of lists<br>
[1,2,3] :: [Int] -- the list [1,2,3] is a list of Int types<br>
[7.1, 8.2, 4.5] :: [Float]<br>
['a','b','c'] :: [Char] -- which is also a String "abc"<br>

## List operations<br>
: is the constructor function (equivalent of 'cons' in LISP or '.' or '|' in Prolog)<br>
1:[] ~> [1]<br>
2:[1] ~> [2,1]<br>
2:1:[] ~> [2,1]<br>
<br>
head returns the first element of a list passed as a parameter.<br>
head [1,2,3] ~> 1<br>
head "abcde" ~> 'a'<br>
head [] ~> error<br>
<br>
tail returns the list consisting of all but the first element of a list passed as a parameter.<br>
tail [1,2,3] ~> [2,3]<br>
tail "abcde" ~> "bcde"<br>
tail [] ~> error<br>
<br>
elem x l returns True if x is an element of the list l.<br>
elem 2 [1,2,3] ~> True<br>
elem 'c' "abcde" ~> True<br>
<br>
length l returns the number of top-level listelements in the list l.<br>
length [1,2,3] ~> 3<br>
length [] ~> 0<br>
length "abc" ~> 3<br>
<br>
++ joins two lists together.<br>
[1,2] ++ [3,4] ~> [1,2,3,4]<br>
"ab" ++ "cd" ~> "abcd"<br>
<br>
reverse l returns the list consisting of the elements of the original list in reverse order.<br>
reverse [1,2,3] ~> [3,2,1]<br>
reverse "abcde" ~> "edcba"<br>
<br>
zip list1 list2 takes a pair of lists (not necessarily of the same type) and returns a list of pairs<br>
zip [1,2] [3,4] ~> [(1,3),(2,4)]<br>
zip [1,2] [3,4,5] ~> [(1,3),(2,4)]<br>
zip [1,2,3] [4,5] ~> [(1,4),(2,5)]<br>
zip "ab" "cd" ~> [('a','c'),('b','d')]<br>

## Tuples<br>
A tuple is another kind of collection: it's a fixed number of elements of possibly different types.<br>
(1,3) :: (Int,Int)<br>
('a','c') :: (Char,Char)<br>
<br>
We can give tuple types names like this:<br>
type RentalCar = (String,String,Int,Float)<br>
and the type of a list of rental cars can be named like this<br>
type AvailableCars = [RentalCar]<br>

## Automated type checking<br>
myelem :: (Eq a) => a -> [a] -> Bool<br>
myelem item inlist<br>
| null inlist = False<br>
| item == head inlist = True<br>
| otherwise = myelem item (tail inlist)<br>

## Pattern<br>
Using patterns, we can write this <br>
<br>
nonzero n<br>
| n == 0 = False<br>
| otherwise = True<br>
<br>
like this:<br>
nonzero 0 = False<br>
nonzero _ = True<br>
<br>
Patterns can be...<br>
<br>
a literal value -- 24, 'x', "abc", True<br>
any argument value matches if it is equal to the literal value<br>
<br>
a variable -- x, foo, list1<br>
any argument value will match a variable<br>
<br>
a wild card -- _<br>
any argument value will match the wild card<br>
<br>
a tuple pattern -- ($p_1$, $p_2$, ... , $p_n$)<br>
an argument of form ($v_1$, $v_2$, ... , $v_3$) will match this if each $v_k$ matches $p_k$<br>

## Constructer patterns<br>
head :: [a] -> a<br>
head (x:_) = x<br>

tail :: [a] -> [a]<br>
tail (_:xs) = xs<br>

null :: [a] -> Bool<br>
null [] = True<br>
null (_:_) = False<br>

## Pattern matching over lists<br>
-- old school version<br>
mylength inlist<br>
| null inlist = 0<br>
| otherwise = 1 + mylength (tail inlist)<br>

-- newer, hipper Haskell pattern matching version<br>
mylength [] = 0<br>
mylength (_:xs) = 1 + mylength xs<br>

-- old school version<br>
mysum :: [Int] -> Int<br>
mysum inlist<br>
| null inlist = 0<br>
| otherwise = (head inlist) + mysum (tail inlist)<br>

mysum [] = 0<br>
mysum(x:xs) = x + mysum xs<br>

myelem item inlist<br>
| null inlist = False<br>
| item == head inlist = True<br>
| otherwise = myelem item (tail inlist)<br>

myelem item [] = False<br>
myelem item (item:xs) = True<br>
myelem item (_:xs) = myelem item xs<br>
<br>
myappend list1 list2<br>
| null list1 = list2<br>
| otherwise = (head list1):(myappend (tail list1) list2)<br>
<br>
myappend [] list2 = list2<br>
myappend(x:xs) list2 = x:(myappend xs list2)<br>
<br>
myinsert x list1<br>
| null list1 = [x]<br>
| x <= head list1 = x:list1<br>
| otherwise = (head list1):(myinsert x (tail list1))<br>
<br>
myinsert x [] = x<br>
myinsert x (y:ys)<br>
| x <= y = x:(y:ys)<br>
| y:(myinsert x ys)<br>

## The Map Function<br>
The map function takes two arguments: a function which itself expects a single argument of some type, and a list of items of the same type. map then applies the function passed as the first argument to each of the elements of the second argument, collects the results in a list and returns that list.<br>

Defenition<br>
map :: (a -> b) -> [a] -> [b]<br>
map fcn [] = []<br>
map fcn (x:xs) = fcn x : map fcn xs<br>

Continue on lec11 p 46











