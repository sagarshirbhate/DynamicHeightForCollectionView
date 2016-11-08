//
//  customLayout.m
//  dynamicCollectionView
//
//  Created by Sagar Shirbhate on 11/7/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "customLayout.h"

@implementation customLayout
@synthesize columnCount;

- (id)init
{
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup
{
    self.minimumInteritemSpacing = 10.0f;
    self.minimumLineSpacing = 10.0f;
    self.sectionInset = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 10.0f);
    self.columnCount = 2;
    
    CGFloat itemWidth = ([UIScreen mainScreen].bounds.size.width-((self.columnCount+1)*self.minimumInteritemSpacing))/self.columnCount;
    
    self.itemSize = CGSizeMake(itemWidth, itemWidth);
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *itemAttributes = [NSMutableArray array];
    self.contentHeight = 0;
    
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    NSMutableArray *columnHeights = [[NSMutableArray alloc] initWithCapacity:columnCount];
    CGFloat minimumLineSpacing = [self minimumLineSpacingForSection:0];
    CGFloat minimumInteritemSpacing = [self minimumInteritemSpacingForSection:0];
    UIEdgeInsets sectionInset = [self sectionInsetForSection:0];
    
    self.contentHeight += sectionInset.top;
    
    for (NSInteger i = 0; i < columnCount; i++) {
        columnHeights[i] = @(self.contentHeight);
    }
    
    for (NSInteger i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        NSInteger columnIndex = [columnHeights indexOfObject:[columnHeights valueForKeyPath:@"@min.self"]];
        
        CGSize size = [self itemSizeForIndexPath:indexPath];
        CGFloat x = sectionInset.left + (size.width + minimumInteritemSpacing) * columnIndex;
        
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        attributes.frame = CGRectMake(x, [columnHeights[columnIndex] floatValue], size.width, size.height);
        [itemAttributes addObject:attributes];
        
        columnHeights[columnIndex] = @(CGRectGetMaxY(attributes.frame) + minimumLineSpacing);
    }
    
    self.contentHeight = [[columnHeights valueForKeyPath:@"@max.self"] floatValue];
    
    if (itemCount == 0) {
        self.contentHeight += [UIScreen mainScreen].bounds.size.height;
    }
    
    self.contentHeight += sectionInset.bottom;
    
    return itemAttributes;
}
- (CGSize)collectionViewContentSize
{
    return CGSizeMake(self.collectionView.frame.size.width, self.contentHeight);
}

- (UIEdgeInsets)sectionInsetForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
        return [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }
    else {
        return self.sectionInset;
    }
}

- (CGFloat)minimumInteritemSpacingForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        return [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
    }
    else {
        return self.minimumInteritemSpacing;
    }
}

- (CGFloat)minimumLineSpacingForSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)]) {
        return [self.delegate collectionView:self.collectionView layout:self minimumLineSpacingForSectionAtIndex:section];
    }
    else {
        return self.minimumLineSpacing;
    }
}

- (CGSize)itemSizeForIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)]) {
        CGSize size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
        
        return size;
    }
    else {
        return self.itemSize;
    }
}
@end
