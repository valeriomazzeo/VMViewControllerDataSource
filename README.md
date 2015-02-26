# VMViewControllerDataSource

[![Pod Version](http://img.shields.io/cocoapods/v/VMViewControllerDataSource.svg?style=flat)]()
[![Pod Platform](http://img.shields.io/cocoapods/p/VMViewControllerDataSource.svg?style=flat)]()
[![Pod License](http://img.shields.io/cocoapods/l/VMViewControllerDataSource.svg?style=flat)](http://opensource.org/licenses/MIT)

## OVERVIEW

The VMViewControllerDataSource class implements a specialized datasource object that renders reusable UIViewController objects instead of cells objects.

In order to achieve that, the view controller data source implements either `tableView:cellForRowAtIndexPath:` or `collectionView:cellForItemAtIndexPath:`.

Every row or item created with a view controller data source is either a `VMViewControllerTableViewDataSourceCell` or a `VMViewControllerCollectionViewDataSourceCell` which has the view controller's view attached to its subviews hierarchy.

The view controller data source acts as datasource for your `UITableView` or `UICollectionView`.

Through message forwarding, your view controller can implement the `VMViewControllerTableViewDataSource` protocol and can respond to all the methods that are needed to build the table or the collection views, that can be then further customized with their standard delegate methods.

## Installation

VMViewControllerDataSource is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "VMViewControllerDataSource"
    
## USAGE

Just import the main header whenever you need on your project source files.

```
#import <VMViewControllerDataSource/VMViewControllerDataSource.h>
```

To run the example project; clone the repo, and run `pod install` from the Example directory first.

## LICENSE

VMViewControllerDataSource is available under the MIT License (MIT).

Copyright (c) 2015 Valerio Mazzeo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## AUTHOR

[Valerio Mazzeo](https://twitter.com/valeriomazzeo)
