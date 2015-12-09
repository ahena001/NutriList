//
//  IngredientTableViewCell.h
//  
//
//  Created by Leonardo Martin on 12/8/15.
//
//

#import <UIKit/UIKit.h>

@interface IngredientTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *measureLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
