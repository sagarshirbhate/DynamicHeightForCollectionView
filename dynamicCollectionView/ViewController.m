//
//  ViewController.m
//  dynamicCollectionView
//
//  Created by Sagar Shirbhate on 11/7/16.
//  Copyright © 2016 Sagar Shirbhate. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Demo Text Array
    data=[[NSMutableArray alloc]initWithObjects:@"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.",@"Dispose of any resources that can be recreated.",@"Do any additional setup after loading the view, typically from a nib.",@"Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.",@"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.",@"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.",@"Dispose of any resources that can be recreated.",@"Do any additional setup after loading the view, typically from a nib.",@"Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.",@"Dispose of any resources that can be recreated.",@"Do any additional setup after loading the view, typically from a nib.Do any additional setup after loading the view, typically from a nib.", nil];
    
    
    // Main Logic to get height as per collection View Required
    columncount=2;
    miniInteriorSpacing=10;
    
    if(![collectionView.collectionViewLayout isKindOfClass:[customLayout class]]){
        customLayout *layout = [customLayout new];
        layout.delegate=self;
        layout.columnCount=columncount;
        
        collectionView.collectionViewLayout = layout;
        
        [collectionView reloadData];
    } 
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return data.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView1 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.label.text=[data objectAtIndex:indexPath.row];
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat Size = [self calculateHeightForLbl:[data objectAtIndex:indexPath.row] width:self.view.frame.size.width/2-20 ];
    return CGSizeMake(self.view.frame.size.width/2-20 ,Size+30);

}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


-(float)calculateHeightForLbl:(NSString*)text width:(float)width{
    CGSize constraint = CGSizeMake(width,20000.0f);
    CGSize size;
    
    NSStringDrawingContext *context = [[NSStringDrawingContext alloc] init];
    CGSize boundingBox = [text boundingRectWithSize:constraint
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                            context:context].size;
    
    size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    
    return size.height+10;
}
@end
