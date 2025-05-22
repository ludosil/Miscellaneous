In the context of software development, the notion of interface can be defined as *what software does*, and implementation as *how it does it*. Interface can of course be defined in very explicit terms, for example as the public interface of a class, but here it’s useful to consider in its most general form.

- Interface is high-level, implementation is low-level
- Interface is design, implementation is the details
- Interface exists independent of code
- Interface precedes implementation

A useful question to ask is how much time you spend (and when) on interface vs. implementation. An initial exploration of ideas with a basic model is fine, but that shouldn’t morph into an increasingly complex model without some element of iterative design-and-build. We’ve all seen it in practice; model gets built as a two-week rush job and is still in use 5 years later!

My own rule of thumb is to try and maintain an 70/30 split in respect of interface vs. implementation tasks. If I’m spending more than 30% of my time buried in the details, it’s symptomatic of a lack of clarity and thought up front.
