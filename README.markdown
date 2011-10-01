# WSCoreLaziness.framework 

From time to time I often find myself repeating certain small amounts of code which consists of a few lines. In the beginning it was ok, since I didn't mind it because of my lack of experience in Cocoa coding. Afterwards it got really annoying. Coming from Ruby (and Rails) background I remembered how awesome it was to have `ActiveSupport` around. It had so many helpful classes and functions that would improve developers' productivity and clear up the code!

WSCoreLaziness is a shot at making ActiveSupport for Cocoa frameworks. The idea is simple - create a collection of (as of this writing) Foundation framework categories that aim to shorten the amount of your typing and increase the amount of hitting `Esc` and `Tab` keys, provide familiar API and sensible defaults.

The framework is being developed using TDD using standard SenTestingKit.framework that comes together with Xcode.

Here are some links related to this project:

* [GitHub repository](https://github.com/walkingsmarts/WSCoreLaziness) - where the code & documentation lays.
* [Site's twitter](https://twitter.com/walkingsmarts) - general twitter account for this site.
* [Personal twitter](https://twitter.com/eimantas) - my personal twitter account.

## Framework's file structure

Each framework should have it's own directory. In directory of a framework, files named `NSClass+WSCoreLaziness.h` and `NSClass+WSCoreLaziness.m` should reside showing that `NSClass` has a category from WSCoreLaziness. Since it's very fresh and has less than 50 methods it has only categories for most generic Cocoa classes like `NSString`, `NSArray`, `NSDictionary` and their mutable children. Same goes for tests covering the aforementioned categories. Here's the outline of a framework having foundation classes extended with categories:

- /WSCoreLaziness
    - /Foundation
        - /NSString+WSCoreLaziness.h
        - /NSString+WSCoreLaziness.m
        - /NSArray+WSCoreLaziness.h
        - /NSArray+WSCoreLaziness.m
        - ...
- /WSCoreLazinessTest
    - /Foundation
        - /NSStringWSCoreLazinessTest.h
        - /NSStringWSCoreLazinessTest.m
        - /NSArrayWSCoreLazinessTest.h
        - /NSArrayWSCoreLazinessTest.m
        - ...

## General convention

Since the classes I write categories for are not owned, every method is prefixed with `ws_`. It's recommended practice. Although it makes code look a bit uglier, but it's better to be safe than sorry.
