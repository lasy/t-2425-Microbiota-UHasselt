**Identifying microbiota sub-communities using topic models**

Abstract

Microbiota communities can be highly diverse, with hundreds of different species cohabitating in the same ecosystem (alpha diversity). Across ecosystems or samples, we also observe differences in microbiota composition, with some bacteria present in some samples and absent (or in lower abundance) in others (beta diversity). Due to interactions such as metabolic exchanges, some groups of bacteria frequently co-occur (positive interactions) or are mutually exclusive (negative interactions), forming sub-communities. These sub-communities result in samples being more similar to each other than expected by chance, if there were no interactions between bacteria.

Traditionally, clustering methods have been applied to microbiota data to define community types (CT). However, sub-communities often co-exist within samples, and most large microbiota datasets do not support clear clustering evidence. "Topic models", initially proposed for modeling population structure and popularized in the natural language processing field, provide an elegant alternative to clustering. These models can identify sub-communities and reduce the dimensionality of microbiota data.

This presentation will explain what topic models are, how they can be applied to microbiota data, and their advantages over clustering methods. It will also introduce the *alto* R package, which implements a method to "align topics across resolution" (K, the number of topics) to identify both robust and spurious topics.

 

 

## Outline

**Introduction**

- <u>Running examples</u>
  1. Vaginal microbiota
  2. Gut microbiota
- <u>Context</u>: microbiota are highly dimensional and highly diverse
  - Typical dimensions & Distribution (heatmaps)
  - Diversity of microbiomes: $\alpha$ and $\beta$ Diversity
  - PCoA
- <u>Question 1</u>: Are there any sub-types of microbiota composition or some ways to reduce the complexity of microbiota compositions?
- <u>Needs 1</u>:
  - Clustering and/or dimension reduction? PCoA?
  - Gaps: Meaning of PCoA axes? Are there any clusters?
- <u>Duality</u> (Two sides of the same coins)
  - If there are sub-types or sub-groups, then this means that some bacteria co-occur more frequently. 
  - Interactions between bacteria through metabolite exchanges ➞ Subcommunities
- <u>Questions 2</u>: 
  - Can we identify these subcommunities from observational data? (with the same tools?)
- <u>Needs 2:</u>
  - A method that identifies subcommunities and that tells us if and how much of a subcommunity is present in each sample.

**Topic models for identifying microbiota subcommunities**

- What are topic models?
- Can we apply them as such to microbiota data?
- Comparison with clustering (on PCoA) (Valencia by clusters and by topic proportions)

**Choosing K, the number of topics/subcommunities**

- Cross-validation
  - Perplexity
- Topic alignment
  - Duality: by sample composition or by topic composition 
  - "True" vs. "Spurious" sub-communities

**Conclusions**

- Summary
- Alternative to topic models
- Questions