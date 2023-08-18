---
title: Pass by value vs. pass by reference

publish_date: 2023-08-18
---

# Pass by value vs. pass by reference

## 18-08-2023

Pass by value betyder at man laver en hard copy af noget data til et ny sted i memory, hvorimod at pass by reference kun kopier referencen, og dermed peger det stadig til det samme sted i memory. Pass by reference er væsentlig hurtigere, da man skal kopier mindre data.

### Java

Primitivere er pass by copy, da de opbevares i stack memory og derfor ikke har en reference. Objekter er pass by reference, da de har en reference.

https://sentry.io/answers/java-pass-by-reference-or-value/

# Immutable string

Er du bekendt med, om Java anvender "pass by value" eller "pass by reference," og hvad disse begreber indebærer? Kan du også forklare konceptet om, at en streng (string) er "immutable," og hvordan dette fungerer i Java?

# Pass by value vs. pass by reference

### 18-08-2023

**Pass by value** og **pass by reference** refererer til, hvordan argumenter bliver overført til funktioner eller metoder i et programmeringssprog.

### Pass by value

I Java anvendes **pass by value**. Dette betyder, at når du sender en værdi som et argument til en funktion eller metode, sender du faktisk en kopi af værdien, og ændringer foretaget inden for funktionen påvirker ikke den originale værdi udenfor funktionen. Dette gælder for primitive datatyper som int, float, char osv.

### Pass by reference

På den anden side, i **pass by reference**, ville ændringer foretaget inden for funktionen påvirke den oprindelige værdi udenfor funktionen. Dette er mere typisk for sprog som C++ med referencer eller pointers, hvor du kan manipulere selve hukommelsesadressen.

### Objekter i java

I Java er det dog vigtigt at bemærke, at selvom objekter overføres ved hjælp af pass by value, overføres værdien af objektreferencen, ikke selve objektet. Dette betyder, at når du sender en objektreference som argument, kan du stadig ændre tilstanden af det objekt, som referencen peger på, men du kan ikke ændre selve referencen, så den peger på et andet objekt. Dette kan undertiden føre til forvirring, da det ikke er helt det samme som traditionel pass by reference.

# String object in Java

Når det kommer til streng (string) objekter i Java, så er de **immutable**, hvilket betyder, at de ikke kan ændres efter oprettelsen. Når du foretager ændringer på en streng (som f.eks. at tilføje, fjerne eller ændre tegn), oprettes faktisk en helt ny streng. Den oprindelige streng forbliver uændret i hukommelsen. Dette designvalg har flere fordele, herunder trådsikkerhed, ydeevne og forudsigelig opførsel.

For eksempel:

```java
String original = "Hello";
String modified = original.concat(" World"); // Dette opretter en ny streng
System.out.println(original); // Output: "Hello"
System.out.println(modified); // Output: "Hello World"`
```

Denne "immutable" natur af strengobjekter betyder, at hvis du arbejder med strenge og ønsker at foretage gentagne ændringer, bør du overveje brugen af `StringBuilder` eller `StringBuffer`, da disse klasser tillader mere effektive ændringer af tekstindhold.

https://www.baeldung.com/java-string-pool
