# Advent of Code 2024
This repository will be used to store my work for the 2024 installment of [Advent of Code](https://adventofcode.com/2024). I'm refreshing my basic Ruby skills this year so it might be slow going at first, but it's good to keep these skills fresh.

## Day 01
Pretty simple task to start off. Ruby makes it really easy to interact with arrays so this is as simple as reading each line and converting them to arrays. Part 2 is actually even easier than Part 1 since we don't have to sort the arrays.

## Day 02
A little bit more complex and I'm sure there's a better way to structure the code, but this problem was as simple as identifying any "bad" lines given a certain set of parameters. Part 2 adds a little challenge since we have to go back and reevaluate those "bad" rows but converting the evaluation logic into a function made it pretty easy. A big thing I got caught up on was that Ruby doesn't implicitly create copies of arrays (like Python might) and you have to explicitly use the `.dup` function of an array to create a copy.

## Day 03
This one immediately screamed "regex" so that was the tactic I started with. It ended up being very straight forward except that Ruby uses `..` instead of `,` when slicing strings but once I got that dialed in it was done. Part 2 just required a couple additions to the regex expression. The sample input was different for part 2 which tripped me up until I noticed, but once I updated that it worked on the first try.

## Day 04
A classic AOC problem that involves making a matrix. I went with my standard array of arrays to hold all the values. The search logic took a little longer than it should have since you have to have the correct letters in the correct order but it was pretty straight forward after I got that straightened out. Ruby has some pretty cool assignment operators (`<<` for adding to arrays) and logic shorthand (`next unless`, `count += 1 if valid`, `next_m.all? {}`, etc.). It's hard to think to use them on the fly, but they make the code much easier to read after a cleanup pass

## Day 05
Today took me a bit to undestand the logic but once I figured out how to structure the rules (in a `Hash` which you have to initialize explicitly in Ruby) I could check each update row pretty easily. Part 2 definitely took me a bit and my initial thought was to just iterate through each permutation of each update row (I should know better, permutations are never the answer in AOC). But once I'd taken a second look at how the rules were structured I discovered that I just had to find which "pages" had the most "pages" after them based on the rules and could then order them that way. It still felt kind of messy, but I did learn some more Ruby tricks (in numeric ranges `(#..#)` is inclusive of the last number and `(#...#)` is exclusive of the last number, and you can often add `unless` after a line to conditionally perform it -- including assignments) so it felt ok.

## Day 06
The general premise seemed pretty straight forward today and part 1 was not too bad. I used the Ruby `cycle` feature to loop through an array of directions since the guard always turns right, this let me call `array_name.next` to get the next element of an array looping back around the first one once I got to the last. A flood fill algorithm might have been more efficient, but my naive method worked well enough. Part 2 was a little bit harder until I figured out that obstructions could only be placed in the locations identified in part 1, but this still resulted in almost 5,000 possible positions so my loop identification function ended up being kind of slow at scale. It still completed in less than 30 seconds so I'm satisfied with it for now.