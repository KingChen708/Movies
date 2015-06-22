//
//  MovieCell.m
//  Movies
//
//  Created by King Chen on 6/15/15.
//  Copyright (c) 2015 King Chen. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.image.layer.cornerRadius = 3;
    self.image.clipsToBounds = YES;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.image.image = nil;
}

@end
