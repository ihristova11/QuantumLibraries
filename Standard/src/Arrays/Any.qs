// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

namespace Microsoft.Quantum.Arrays {

    function _Or(left : Bool, right : Bool) : Bool {
        return left or right;
    }

    /// # Summary
    /// Given an array and a predicate that is defined
    /// for the elements of the array, checks if at least one element of
    /// the array satisfies the predicate.
    ///
    /// # Remarks
    /// The function is defined for generic types, i.e., whenever we have
    /// an array `'T[]` and a function `predicate: 'T -> Bool` we can produce
    /// a `Bool` value that indicates if some element satisfies `predicate`.
    ///
    /// # Type Parameters
    /// ## 'T
    /// The type of `array` elements.
    ///
    /// # Input
    /// ## predicate
    /// A function from `'T` to `Bool` that is used to check elements.
    /// ## array
    /// An array of elements over `'T`.
    ///
    /// # Output
    /// A `Bool` value of the OR function of the predicate applied to all elements.
    ///
    /// # Example
    /// ```qsharp
    ///open Microsoft.Quantum.Intrinsic;
    ///open Microsoft.Quantum.Arrays;
    ///open Microsoft.Quantum.Logical;
    ///
    ///operation ArrayAny_Demo() : Unit {
    ///    let arrayOfInts = [1, 2, 3, 4, 5];
    ///    let is3Present = Any(EqualI(_, 3), arrayOfInts);
    ///    Message($"{is3Present}");
    ///}
    /// ```
    function Any<'T> (predicate : ('T -> Bool), array : 'T[]) : Bool {
       return Fold(_Or, false, Mapped(predicate, array));
    }

}
