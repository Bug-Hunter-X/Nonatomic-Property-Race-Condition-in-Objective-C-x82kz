# Objective-C nonatomic Property Race Condition

This repository demonstrates a common race condition that can occur in Objective-C when using `nonatomic` properties and accessing them concurrently from multiple threads.  Without proper synchronization, data corruption or crashes can result.

The `nonatomicBug.m` file showcases the problematic code, while `nonatomicSolution.m` provides a solution using GCD dispatch barriers for thread safety.

## Problem
The issue stems from the lack of atomic access to the `NSMutableArray` property. Multiple threads modifying the array simultaneously can lead to unpredictable and inconsistent states.

## Solution
The solution employs GCD dispatch barriers to ensure that only one thread accesses and modifies the array at a time.  This prevents race conditions and maintains data integrity.