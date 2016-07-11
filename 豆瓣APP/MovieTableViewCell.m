//
//  MovieTableViewCell.m
//  豆瓣APP
//
//  Created by 唐半仙丶 on 16/6/30.
//  Copyright © 2016年 Tang. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setModel:(MovieModel *)model{
    
    self.titleLabel.text = model.title;
    self.starsLabel.text = model.stars;
    self.pubdateLabel.text = model.pubdate;
    
    [self.movieImageView setImageWithURL:[NSURL URLWithString:model.images[@"large"]]];
    

}

@end
