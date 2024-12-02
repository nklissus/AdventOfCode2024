# Advent of Code 2024
This repository will be used to store my work for the 2024 installment of Advent of Code. I'm refreshing my basic Ruby skills this year so it might be slow going at first, but it's good to keep these skills fresh.

## Day 01
Pretty simple task to start off. Ruby makes it really easy to interact with arrays so this is as simple as reading each line and converting them to arrays. Part 2 is actually even easier than Part 1 since we don't have to sort the arrays.

## Day 02
A little bit more complex and I'm sure there's a better way to structure the code, but this problem was as simple as identifying any "bad" lines given a certain set of parameters. Part 2 adds a little challenge since we have to go back and reevaluate those "bad" rows but converting the evaluation logic into a function made it pretty easy. A big thing I got caught up on was that Ruby doesn't implicitly create copies of arrays (like Python might) and you have to explicitly use the `.dup` function of an array to create a copy.
