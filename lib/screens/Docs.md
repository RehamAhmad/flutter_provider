# Flutter Provider
widget is using 3 ways to listen to changes 
[Provider] -> Provider.of<PName>(Context).value;


- User Listen: false when a provider is called anywhere outside build method [cause-a-run-time-exception]
- 

[Provder.of<T>(context)] == [context.watch<T>()] // LISTEN TRUE
[Provder.of<T>(context,listen:false)] == [context.read<T>()] // LISTEN False

[Consumer] -> Consumer


[Selector] -> It's an even finer optimization system 
-> It does a deep comparison of the value that obtained from provider<T> and the one returned by the selector callback, if they are different a [rebuild-happened]
-> You can use shouldRebuild to implement a custom logic to decide when a children should rebuild override the default deep comparison
-> Be sure to use classes that override operator[=] or collections [when-compare-List<Something>-with-List<Something>-it-wont-change-because-they-are-equal]



// => [https://medium.com/flutter-community/using-selector-in-provider-b32113d5da64]