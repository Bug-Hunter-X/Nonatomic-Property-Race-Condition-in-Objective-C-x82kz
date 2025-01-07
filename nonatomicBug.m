In Objective-C, a common yet subtle issue arises when dealing with properties declared using `nonatomic` and accessed concurrently from multiple threads. Without proper synchronization mechanisms like locks or atomic operations, race conditions can occur, leading to unexpected behavior or crashes.  For example:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

// ... in some method ...
[self.dataArray addObject:someObject];

// ... in another thread ...
[self.dataArray removeObject:anotherObject];
```

If both threads execute simultaneously, the `addObject` and `removeObject` operations might interfere, potentially causing data corruption or exceptions. This can manifest in unpredictable ways, making debugging challenging.