# Shuffling Table Items

This tutorial explores basic shuffling and how to implement it in Corona/Lua. For example, consider a basic card game where the player draws a random card. The initial consideration may be to simply select a random card using `math.random()`, but unlike rolling dice where a number can appear multiple times, a specific card should only appear once during a game.

Basically, shuffling logic applies any time you need to pull an item from a larger collection and ensure that it's never repeated, for instance:

* Randomly gather a series of questions for a quiz game and ensure that no question is repeated.
* Pick letters for a word game like Scrabble<span style="font-size: 80%;"><sup>&trade;</sup></span> where there's a predictable set of tiles for each game.


## Basic Shuffling

Let's further explore the "deck&nbsp;of&nbsp;cards" scenario where, before each game begins, the deck is shuffled. In&nbsp;Lua, this can be accomplished by randomly sorting a table of values. Consider a basic example based on standard playing cards:

``````lua
local cardDeck = { "AS", "AH", "2S", "3S", "KH", "QD", "QS", "KD", "4D", "10H" }
``````

Obviously, for an actual card game, you'd need to populate the table with all 52 cards, but we'll keep it simple for this tutorial.

With this <nobr>numerically-indexed</nobr> table (array), we can call the following function to randomize items:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,5,6,7,8,12,13,14,15,19]" }
math.randomseed( os.time() )  -- Seed the pseudo-random number generator

local function shuffleTable( t )

	if ( type(t) ~= "table" ) then
		print( "WARNING: shuffleTable() function expects a table" )
		return false
	end

	local j

	for i = #t, 2, -1 do
		j = math.random( i )
		t[i], t[j] = t[j], t[i]
	end
	return t
end

cardDeck = shuffleTable( cardDeck )
``````

Inspecting this code in more detail, we perform these tasks:

1. On the first line, we seed the <nobr>pseudo-random</nobr> number generator&nbsp;&mdash; this is an important line but it only needs to be done once, so it can simply be included near the top of `main.lua`.

2. Inside the function, we first confirm that a Lua table was passed in as the sole parameter. If not, the function issues a warning and returns `false`.

3. Next, we loop through the table (`t`) in reverse. Here, the loop index (`i`) is the count of items which have not yet been shuffled. Inside, we generate a random number between `1` and `i` and then swap the two table items. This process is repeated until the <nobr>next-to-last</nobr> item because, at this point, the last item will have been shuffled.

4. The final line calls the function and effectively shuffles the deck, setting the result back to the `cardDeck` variable which represents the deck.


## Drawing Cards

With the table shuffled, we can use the following code to pick cards from the deck. Since the table itself is already in random order, we don't have to worry about generating random numbers, just simply get the next number in the list. We also don't need to "remove&nbsp;drawn cards from <nobr>the deck" &mdash;</nobr> instead, we use a simple variable `currentIndex` which represents which card is on top of the deck. This variable begins at `1` when the game starts and, when cards are drawn, it increments by the same value:

``````{ brush="lua" gutter="false" first-line="1" highlight="[1,5,7,8,9,11,16]" }
local currentIndex = 1  -- Deck starts at top card (1)

local function drawCards( num, deck )

	local cardsDrawn = {}  -- Empty table to begin

	for i = currentIndex, num do
		cardsDrawn[#cardsDrawn+1] = deck[i]
	end

	currentIndex = currentIndex + num
	return cardsDrawn
end

-- Deal 5 cards to a player
local playerHand = drawCards( 5, cardDeck )
``````

Let's look further in detail at this code:

1. As stated above, we initially set a variable `currentIndex` to `1` to represent the top of the deck.

2. On the first line inside the `drawCards()` function, we create a local empty table (`cardsDrawn`) to store the cards that will be drawn.

3. In the loop following, we simply loop from `currentIndex` for `num` iterations and store that card in the `cardsDrawn` table.

4. At the end of the function, we increase `currentIndex` by `num`, effectively indicating that `num` amount of cards were drawn from the deck.

5. To draw cards, we simply call the `drawCards()` function with a number of cards (`5`) and the deck to draw from (`cardDeck`&nbsp;from the code in the previous&nbsp;section).

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

When the deck is exhausted and/or when you want to start a new game, you can just shuffle the deck, reset `currentIndex` to `1`, and start fresh. Because no cards were "removed" from the master card table (`cardDeck`), there's no need to <nobr>re-insert</nobr> cards or anything else complicated&nbsp;&mdash; simply <nobr>re-shuffle</nobr>, reset the starting card, and you're good to go!

</div>
</div>


## Conclusion

As you can see, creating a <nobr>non-repeating</nobr> sequence of random numbers is simple. From card games to trivia games and more, shuffling is easy to implement with just a couple basic functions!
