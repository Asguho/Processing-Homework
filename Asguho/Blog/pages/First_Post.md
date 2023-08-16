# Pass by value vs. pass by reference

## 2021-10-04

Pass by value betyder at man laver en hard copy a noget data til et ny sted i memory, hvorimod at pass by reference kun kopier referencen til det samme sted i memory. Pass by reference er væsentlig hurtigere, da man skal kopier mindre data.

### Java

Primitivere er pass by copy, da de opbevares i stack memory og derfor ikke har en reference. Objekter er pass by reference, da de har en reference.

https://sentry.io/answers/java-pass-by-reference-or-value/
# Immutable string

Er du bekendt med, om Java anvender "pass by value" eller "pass by reference," og hvad disse begreber indebærer? Kan du også forklare konceptet om, at en streng (string) er "immutable," og hvordan dette fungerer i Java?
