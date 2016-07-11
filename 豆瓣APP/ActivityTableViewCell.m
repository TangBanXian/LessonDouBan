//
//  ActivityTableViewCell.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/29.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//MVC的封装
//setter方法
-(void)setModel:(ActivityModel *)model{
    
    _model = model;
    
    self.titleLabel.text = model.title;
    self.dateLabel.text = [NSString stringWithFormat:@"%@ - %@",model.begin_time,model.end_time];
    self.addressLabel.text = model.address;
    self.activityTypeLabel.text = model.category;
    self.interestedNumberLabel.text = [NSString stringWithFormat:@"%@",model.wisher_count];
    self.joinedNumberLabel.text = [NSString stringWithFormat:@"%@",model.participant_count];
    [self.imageV setImageWithURL:[NSURL URLWithString:model.image]];
    
}

@end
