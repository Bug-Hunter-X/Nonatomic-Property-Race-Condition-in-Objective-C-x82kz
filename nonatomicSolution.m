To address the race condition, use GCD dispatch barriers to serialize access to the `dataArray` property:

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

dispatch_queue_t dataQueue = dispatch_queue_create("com.example.dataQueue", DISPATCH_QUEUE_SERIAL);

// ... in some method ...
dispatch_barrier_async(dataQueue, ^{ 
    [self.dataArray addObject:someObject];
});

// ... in another thread ...
dispatch_barrier_async(dataQueue, ^{ 
    [self.dataArray removeObject:anotherObject];
});
```

The `dispatch_barrier_async` function ensures that all previous operations on `dataQueue` complete before the block is executed, and no new operations are started until the block finishes. This guarantees exclusive access and solves the race condition.