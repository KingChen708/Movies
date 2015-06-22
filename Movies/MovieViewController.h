//
//  MovieViewController.h
//  Movies
//
//  Created by King Chen on 6/15/15.
//  Copyright (c) 2015 King Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (strong, nonatomic)NSDictionary *movie;

@end
