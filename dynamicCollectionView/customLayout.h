//
//  customLayout.h
//  dynamicCollectionView
//
//  Created by Sagar Shirbhate on 11/7/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol customLayoutDelegate <UICollectionViewDelegateFlowLayout>
@optional
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section;
@end


@interface customLayout: UICollectionViewFlowLayout
@property (nonatomic, weak) id<customLayoutDelegate> delegate;

@property (nonatomic, assign) CGFloat singleCellWidth;
@property (assign,nonatomic) CGFloat columnCount;
@property (nonatomic, assign) CGFloat contentHeight;

@end
