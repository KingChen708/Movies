//
//  MovieViewController.m
//  Movies
//
//  Created by King Chen on 6/15/15.
//  Copyright (c) 2015 King Chen. All rights reserved.
//

#import "MovieViewController.h"
#import <UIImageView+AFNetworking.h>

@interface MovieViewController ()

@property (weak, nonatomic) IBOutlet UIView *movieView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.movie[@"title"];
    self.titleLabel.text = self.movie[@"title"];
    self.detailLabel.text = self.movie[@"synopsis"];
    [self alignLabelWithTop:self.detailLabel];
}

- (void)viewWillAppear:(BOOL)animated{
    NSString *url = [self.movie valueForKeyPath:@"posters.thumbnail"];
    [self.image setImageWithURL:[NSURL URLWithString:url]];
}

- (void)viewDidAppear:(BOOL)animated{
    NSString *url = [self.movie valueForKeyPath:@"posters.detailed"];
    url = [self convertPostUrlStringToHighRes:url];
    [self.image setImageWithURL:[NSURL URLWithString:url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSString *)convertPostUrlStringToHighRes:(NSString *)urlString{
    NSRange range = [urlString rangeOfString:@".*cloudfront.net/" options:NSRegularExpressionSearch];
    NSString *returnValue =urlString;
    if(range.length > 0){
        returnValue = [urlString stringByReplacingCharactersInRange:range withString:@"https://content6.flixster.com/"];
    }
    return returnValue;
}

- (IBAction)move:(UISwipeGestureRecognizer *)sender {
    if(sender.direction==UISwipeGestureRecognizerDirectionUp) {
        [UIView animateWithDuration:0.5
                              delay:0.1
                            options:(UIViewAnimationCurveLinear|UIViewAnimationOptionAllowUserInteraction)
                         animations:^{
                             [UIView setAnimationDelegate:self];
                             self.movieView.frame = self.imageView.frame;                             
                             [self alignLabelWithTop:self.detailLabel];
                         }
                         completion:nil];
    }
}

// adjust the height of a multi-line label to make it align vertical with top
- (void) alignLabelWithTop:(UILabel *)label {
    CGSize maxSize = CGSizeMake(label.frame.size.width, 999);
    label.adjustsFontSizeToFitWidth = NO;
    
    // get actual height
    CGSize actualSize = [label.text sizeWithFont:label.font constrainedToSize:maxSize lineBreakMode:label.lineBreakMode];
    CGRect rect = label.frame;
    
    rect.size.height = actualSize.height;
    label.frame = rect;
}



@end
