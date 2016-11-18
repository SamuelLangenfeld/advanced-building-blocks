These exercises are from the Odin Project:

http://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks?ref=lc-pb

For this exercise I created a bubble sorting method and my own enumerable methods.

The bubble sort I implemented a method that compares elements of the array, sorting two at a time, moving left to right. It iterates through the array a number of times equal to one less than the elements of the array in order to make sure that the entire array is sorted correctly.

In the same file I implemented a bubble_sort_by method that takes an array to sort, but also accepts a block. This lets the user sort by whatever method they wish, instead of a simple less than/greater than sort.


For the second exercise I created my own enumerable methods for the Enumerable module. They do the same thing as their Enumerable method counterparts but I implemented them from scratch. My methods are only implemented for arrays and hashes. I defined the following methods:

my_each
my_each_with_index
my_select
my_all?
my_none?
my_count
my_map
my_inject


I later returned and added rspec testing for my enumerable methods.