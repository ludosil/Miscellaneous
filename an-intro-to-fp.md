A few years ago I joined a company that used F#; I hadn't encountered functional programming (FP) before, but in learning F#, and the general principles around FP, I developed a different perspective on programming that I find invaluable today.

With FP you're able

- to code how you think
- to write less code
- to combine the benefits of static and dynamic languages

This is a short article to outline what FP is and why I think it's worth learning. If you've never heard of FP or you're curious, I hope it's useful. Where code is listed, and not explicitly marked as a particular language, please read as generic pseudocode.

## What is FP?

As the name suggests it's all about functions. In lieu of a precise definition, at least initially, a simple example can demonstrate what is, and what isn't, FP.

Let's say we have a vector or list x and we want to compute y = f(x); how do we implement that in code? The traditional approach goes something like *instantiate a list of elements - loop over the list - assign each element individually*

```pseudocode
// assume x exists and has length n
y = list(n)
for i = 1:n
	y[i] = f(x[i])
```

The equivalent FP code is:

```pseudocode
y = map(f, x)
```

The map function takes a list (x) and applies a function to each element of that list (f). 

The example is minimal but instructive:

- The FP code is virtually a direct translation of ***what we want to do***, whereas the non-FP code is more concerned with the lower-level details of ***how it's done***
- The FP code is one line vs. three otherwise
- In the non-FP code we could encounter a runtime error if we overstep the array bounds, say if n is specified incorrectly or if the language is zero-based. This can't happen in the FP code since the map function will always return a list of the same length as the input

In the context of differentiating between programming styles, the what vs. the how is fundamental. 

What we've referred to as non-FP is generally known as ***imperative programming***, or ***IP*** , so called because the code is typically written as a series of instructions to be carried out. There is the associated process of changing state that we'll re-visit later.

## Where did the code go?

```pseudocode
//   IP                          FP
y = list(n)
for i = 1:n           
	y[i] = f(x[i])    vs.    y = map(x, f)
```

The calculation line is similar in both snippets. but the FP code doesn't require the declaration or the for loop. Why is this?

In the IP approach there is no implicit link between the variables x and y. Our intent is that they represent the mathematical relationship y = f(x), but there is no direct mechanism to achieve that. An IP style specifies calculations at a low level, and as such requires the explicit construction of the list y, and the subsequent calculations to populate it.

In contrast, we can express the  concept y = f(x) directly in the FP paradigm. ***We're able to code how we think***, and that is the crux of FP.

Are we getting something for nothing here, given that we can compress three lines into one? Yes and no. The FP code will be compiled to a lower-level language that makes a similar computation to the IP code; y will be allocated memory and there will be a loop to construct the values. So it may feel like we're writing more code than we need to in the IP  case.

The caveat is that the IP style offers more control over low-level details such as calculation efficiency, memory allocation and garbage collection. Depending on the context of application, this may or may not be a deciding factor in the choice of language to use.

## Higher-order functions and first-class values

In our initial look at FP we skipped over an important detail: ***how can you pass a function to a function*?** The two functions in this case being map and f.

```pseudocode
y = map(f, x)
```

If you learned to code using a language such as VBA, C++ or Java, this might look a little weird, yet it's standard practice in FP. There are two fundamental (and related) concepts at play here. A **higher-order function** takes a function(s) as one of its arguments, our current example being map. This is enabled within a programming language by **making functions first-class values**; they can be passed as arguments to (and returned from) functions just as naturally as you would with any numeric type or a string or a logical value.

When you start using FP, applying higher-order functions seems a little weird. I'd say it is intuitive in terms how we think, but it might go against what you've done previously, at least to begin with. There is sometimes a period of 'unlearning' before switching into a functional model of thinking. 

## Getting started: map, filter, reduce and list comprehensions

There are around 100 higher-order functions in the List module of the standard F# language: https://msdn.microsoft.com/visualfsharpdocs/conceptual/collections.list-module-%5bfsharp%5d. 

But you can get started (and do a lot!) with just three. The table below demos simple applications of map, filter and fold. 

| Higher-order function | Example                                                      | Code                             |
| --------------------- | ------------------------------------------------------------ | -------------------------------- |
| map                   | square each element in the list<br>[1,2,3,4] -> [1,4,9,16]   | ```map(f(x) x^2, xs)```          |
| filter                | filter the odd elements<br>[1,2,3,4] -> [2,4]                | ```filter(f(x) x%2==0, xs)```    |
| reduce                | reduce the list to a single value <br>by multiplying the elements<br>3[1,2,3,4] -> 24 | ```reduce(f(x1,x2) x1*x2, xs)``` |

The f(x) expression is known as a ***Lambda*** or ***anonymous*** function. It is syntax in FP that enables the function to be defined in place, and without a name, hence anonymous. The Lambda name comes from Lambda calculus, a mathematical concept that underpins FP - https://en.wikipedia.org/wiki/Lambda_calculus.

Map applies a function to each element of the list and returns the result. In the example above, and previously, we returned the same type i.e. a list of integers mapping to a list of integers. But we're not constrained to do so. We could for example apply the square root function so that a list of integers maps to a list of floats. In real-world applications we'd often map between more complex user-defined types. 

Filter does exactly what it says; it returns a filtered list where the items removed are those that evaluate to false in the supplied function. In this case the function returns true for even numbers and false for odd numbers, hence the odd numbers are removed. This type of function is known as a ***predicate***. 

Reduce takes a list and returns a single value. It does this by repeatedly (or recursively in FP parlance) applying a specified function to the next part of the list. In the example above the first step would be compute 1*2 and then to replace the first two elements with the result i.e. [2;3;4]. Repeated application would then yield [6;4] and [24]. When the list has length one it returns the single value.

**Changing state**

As we did before, i's useful to consider how we might achieve the same results in a non-functional way, this time for the filter function. It's a simple example but even here we'd still require considerable extra code to do that in an imperative style. The thought process might be *copy the original list - iterate through each element - check it against the predicate function - keep/remove as necessary*

```pseudocode
// l = [1,2,3,4]
evens = l
i = 1
while i <= length(evens)
	if (evens[i]%2 == 0)
		i = i + 1
	else
		evens.remove(i)
```

We mentioned that changing state is an integral part of IP, and it's a useful point to revisit what this actually means, and how it relates to the FP paradigm. When we looked at the original map example, the state of the list is changed within the for loop i.e. ```y[i] = f(x[i])``` In the filter example above, the state of the list is changed when we remove an element.

In contrast, FP is built around the notion of ***immutability***, the idea that once values are created they cannot/should not be modified. So if we write ```y = map(f, x)``` we shouldn't at a later point in the code try to modify y in any way, though we can of course create a new value by transforming y as needed. 

Immutability is useful because, as with other aspects of FP, it moves us away from needing to think about lower-level details of how it's done towards the question of what we want to do. It acts as a constraint that forces us to think more clearly. Something you will hear often about FP is that you think more and code less!

**List comprehensions**

There is an alternative way to express map and filter expressions in what is known as a list comprehension, and is used in Haskell and Python. This is illustrated below using Python-style notation.

| Higher-order function | Example                                                      | Pseudocode                    | List comprehension (Python)     |
| :-------------------- | ------------------------------------------------------------ | ----------------------------- | ------------------------------- |
| map                   | square each element <br>in the list<br>[1;2;3;4] -> [1;4;9;16] | ```map(f(x) x^2, xs)```       | ```[x^2 for x in xs]```         |
| filter                | filter the odd elements<br>[1;2;3;4] -> [2;4]                | ```filter(f(x) x%2==0, xs)``` | ```[x for x in xs if x%2==0]``` |

List comprehensions can offer a more intuitive way to express functional ideas, especially for those used to an imperative style. It's easy to see how the explicit for loop structure has been condensed down into a single line. List comprehensions can also be nested and combine both map and filter operations. 

## Summary

Learning about FP changed my perspective on writing code, so I hope this might be useful to a few people. As with many skills you can learn and apply the basics very quicky. You don't need to be an expert (I'm not) to start using it in your day-to-day work. 
