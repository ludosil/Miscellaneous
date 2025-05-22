Would you rather have £1000 now or £2000 in a year’s time?

Hyper-inflation aside, and unless you really need the money, it seems a no-brainer. You’d forgo the immediate reward and collect a larger one in the future.

Software development is no different, except it’s not so easy to recognise the payoffs and costs and thus to make a rational decision. Plus it’s not always your decision to make.

I try to view decisions around design in a long-term (or strategic) perspective. There’s no simple rule, but it can help to ask basic questions:

- does this meet stakeholder requirements? are they liable to change? if so, am I in a good position to adapt?
- is the model fully tested? is it being tested from the start? if not, are we missing bugs that can easily propagate? is there an automated testing framework available?
- what does it look like to an auditor? what would an auditor want to see/be able to do with the model?
- is it simple as it needs to be?
- is it documented? from the perspective of an end-user or a new developer that may need to expand the model, do they have all the info they need to use and build upon the model?
- is it fast enough? does it need to be faster in the future?
- is it scalable? does it need to be scalable in the future?
- how extensible is it?
- is it modular? if one part of the model changes, do you need to change the whole structure or just one part?

The common denominator is that there’s always more (potential) work to do, and if you consider that up-front, you can minimise the amount of work that needs to be done in the future. That extra work becomes less ad-hoc than a natural extension to the initial work.

It’s not always a popular choice to take the long-term view— the payoff is less visible — but it’s worth it. Just be prepared to make your case to spend a little more time now to save a lot more time in the future.
