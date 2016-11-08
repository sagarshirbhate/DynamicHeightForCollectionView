![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)
![Language](https://img.shields.io/badge/Language-Objective----C-yellowgreen.svg)

<sub>Dynamic Height For UICollectionView</sub>
-
* Simple solution for Dynamically adjust view as a blocks.
* Dynamically adjust height of collection view.
* No more White spaces

<sub>Difference between Normal CollectionView Layout and Custom CollectionView Layout</sub>
-
| While using Dynamic height only | While using Dynamic height with Custom Layout Made by Me|
| ------------- |:-------------:|
|![ScreenShot](https://github.com/sagarshirbhate/DynamicHeightForCollectionView/blob/master/ScreenShots/1.PNG)|![ScreenShot](https://github.com/sagarshirbhate/DynamicHeightForCollectionView/blob/master/ScreenShots/2.PNG)|



<sub>How to get Custom CollectionView Layout for your UICollectionView</sub>
-
<sub>Add Following Files to your project</sub>
-
 - ```customLayout.h```
 - ```customLayout.m```
 


<sub>Import customLayout in your controller where to use</sub>
-
```javascript
#import "customLayout.h"
```
And use 
```javascript 
<customLayoutDelegate> 
``` 
to your controller.

<sub>Write Simple Code in your viewDidLoad Method</sub>
-
```javascript

    columncount=2; // How much Columns you required
    miniInteriorSpacing=10; // Minimum Spacing you required
    
    if(![collectionView.collectionViewLayout isKindOfClass:[customLayout class]]){
        customLayout *layout = [customLayout new];
        layout.delegate=self;
        layout.columnCount=columncount;
        
        collectionView.collectionViewLayout = layout;
        
        [collectionView reloadData];
    } 
```

For getting height of Label I have written a method.
```javascript
-(float)calculateHeightForLbl:(NSString*)text width:(float)width;
```
