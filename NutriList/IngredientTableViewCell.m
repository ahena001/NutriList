//
//  IngredientTableViewCell.m
//  
//
//  Created by Leonardo Martin on 12/8/15.
//
//

#import "IngredientTableViewCell.h"

@implementation IngredientTableViewCell

@synthesize valueLabel, measureLabel, nameLabel;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
