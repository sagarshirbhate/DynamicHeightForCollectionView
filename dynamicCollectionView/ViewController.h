//
//  ViewController.h
//  dynamicCollectionView
//
//  Created by Sagar Shirbhate on 11/7/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "customLayout.h"

@interface ViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,customLayoutDelegate>
{
    NSArray * data ;
    IBOutlet UICollectionView * collectionView;
    NSInteger columncount,miniInteriorSpacing;
}


@end

