#####load
- `load`方法在程序加载的时候就被调用，和这个类是否被调用没有关系（无论这个类你用没用，你只要在类中实现了load方法，那么它就会被调用，这种调用是自动调用的），load方法总是在main函数之前被调用；子类中实现load方法会自动先去调用父类的load方法；
- 使用场景：由于调用load方法时的环境很不安全，我们应该尽量减少load方法的逻辑。另一个原因是load方法是线程安全的，它内部使用了锁，所以我们应该避免线程阻塞在load方法中
    - 一个常见的使用场景是在load方法中实现Method Swizzle
    
    ```
    + (void)load {
    Method originalFunc = class_getInstanceMethod([self class], @selector(originalFunc));
    Method swizzledFunc = class_getInstanceMethod([self class], @selector(swizzledFunc));

    method_exchangeImplementations(originalFunc, swizzledFunc);
}
    ```
**在Child类的load方法中，由于还没调用Other的load方法，所以输出结果是"Original Output"，而在main函数中，输出结果自然就变成了"Swizzled Output"**

#####initialize
- 这个方法是在第一次给某个类发送消息时调用（比如实例化一个对象），**只会被调用一次**`initialize`方法实际上是一种惰性调用，也就是说如果一个类一直没被用到，那它的`initialize`方法也不会被调用，这一点有利于节约资源。
- 调用：和load方法相类似，在initialize方法内部也会调用父类的方法。
- 和load方法的不同：1、即使子类没有实现initialize方法，也会调用父类的initialize方法。
- 在实例化子类，运行后发现父类的initialize方法竟然调用了两次，**这是因为在创建子类对象时，首先要创建父类对象，所以会调用一次父类的initialize方法，然后创建子类时，尽管自己没有实现initialize方法，但还是会调用到父类的方法**
- 虽然initialize方法对一个类而言只会调用一次，但这里由于出现了两个类，所以调用两次符合规则，但不符合我们的需求
- 正确的姿势是：

```
+ (void)initialize {
    if (self == [Parent class]) {
        NSLog(@"Initialize Parent, caller Class %@", [self class]);
    }
}
```
- 使用场景：initialize方法主要用来对一些不方便在编译期初始化的对象进行赋值。


####总结

- 1、load和initialize方法都会在实例化对象之前调用，以main函数为分水岭，前者在main函数之前调用，后者在之后调用。这两个方法会被自动调用，不能手动调用它们。
- 2、load和initialize方法都不用显示的调用父类的方法而是自动调用，即使子类没有initialize方法也会调用父类的方法，而load方法则不会调用父类。
- 3、load和initialize方法内部使用了锁，因此它们是线程安全的。实现时要尽可能保持简单，避免阻塞线程，不要再使用锁

