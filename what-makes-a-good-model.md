There's no single, right way to build a model, but there are useful criteria to consider. You could use this as a checklist to ensure that whatever you're building remains fit for purpose, and that planned development is appropriate.

Is it ***simple***? Is it ***visual***? At its core every model is the same:
- inputs -> calculations -> outputs - > analysis

It doesn't matter how complex the model is, you should always have a top-down view of the model and how it works. Consider the *piece-of-paper* test; can you sketch out your model and explain it to someone? If you can't it's too complex.

Is it ***tested***? How do you know your model is doing what it's meant to? Testing. Without testing you cannot make any assertions about whether it's correct and fit-for-purpose. There are different types of testing - unit, regression, integration, functional, negative, user, and others - and a broad-based approach is essential. For example user testing ensures that the model aligns to user requirements, while unit testing verfies low-level functionality in the model. 

A common issue is that testing often takes a back seat to model development; limited resource and deadlines don't help, but it's a false economy to push back testing. Early and consistent testing will always save time in the longer term.

Is it ***documented***? Like testing, documentation tends to get a look-in at the very end. It is often (wrongly) considered a box-checking exercise; proper documentation is central to ensuring that people can use/understand/extend/audit your model. Good documentation is concise and aligned to user requirements. If you're struggling to structure your documentation, then ask yourself user-centric questions that can elucidate what is useful and relevant. For example:

- Models are not static and tend to be developed over time. What does a future developer need to know in order to understand and work with, and extend if necessary, the model you're building?
- Every model is audited, internally and/or externally. What does an auditor want and need to know?
- What does a user need to know to run the model, to export the results, to work with related analysis tools?

Is it ***extensible***? Can you extend the model if you need to? Requirements tend to evolve over time, so what you build initially will tend to need to be updated, and it's wise to be aware of this when you begin. How you structure the model has an impact on how easy (or not) it is to extend.

Consider a model to value assets that - initially - just needs to cover swaps and government bonds. You could code this as effectively two models, one to value swaps and one to value bonds. But what if the model is later extended so that it needs to value other assets, say swaptions and corporate bonds? You could continue as is, and have four models within a model, but then you might ask: *shouldn't I value government and corporate bonds consistently?*  This is where good structure pays dividends.

Is it ***fast*** (enough)? Speed is great, and there's pride in writing efficient code, but don't obsess on it. Modern programming languages are almost always fast enough. Speed is an issue if running the model becomes a bottleneck, or if there's a significant cost to do so (say if it's run on the cloud and uses resources on demand).

If speed improvement is justified, then small changes will often yield signficant speed-up. It's rare that you need to change language, unless speed is the only game in town (think code that receives exchange data and send orders). Profiling tools will help to avoid guess work in identifying the 'slowspot'.

Is it ***modular***? Modularity is the extent to which a model can be separated into pieces. Modularity means that individual functions can be changed without impacting the wider model, analagous to how a mechanic might fix an engine by replacing a defective component, without needing to resort to wider changes. This is linked to the coding tenet of single responsibility principle, or SRP, whereby a given function should have one purpose. 

