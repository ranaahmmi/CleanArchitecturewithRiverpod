
# Flutter Clean Architecture with Riverpod

Flutter App Architecture with Riverpod.

Popular Flutter App Architectures: Bloc and Stacked

Most notably, the Bloc Architecture has gained some good adoption, mainly thanks to the popularity of the Bloc Library, which is used by various large companies. It is very opinionated and gives us a strict set of rules for how we're to structure our Flutter apps (and this is a good thing!).

Another promising one is the Stacked Architecture, which is based on the Stacked package and is largely inspired by MVVM.

They both rely on Provider, which is the recommended package for state management in the official Flutter documentation.

And while there's nothing wrong with either Bloc or Stacked, the author of Provider has created the Riverpod package to "make some improvements that would be otherwise impossible" (in his own words).

Over time, I've come to appreciate the power of Riverpod as a complete solution for dependency injection and state management. So I decided to build my own architecture on top of it.

# My Take on Flutter App Architecture (using Riverpod)
While building Flutter apps of varying complexity, I've experimented a lot with app architecture and developed a deep understanding about what works well and what doesn't.

The result is a reference architecture that I've used in all my latest projects.

This architecture is composed of four layers (data, domain, application, presentation).



ranaahmmmi
