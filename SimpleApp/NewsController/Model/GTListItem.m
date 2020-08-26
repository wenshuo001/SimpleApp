//
//  GTListItem.m
//  SimpleApp
//
//  Created by 库兹马 on 2020/8/18.
//  Copyright © 2020 Wenshuo. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem

#pragma mark - NSSecureCoding
 

+ (BOOL)supportsSecureCoding{
    return YES;
}

- (id)copyWithZone:(nullable NSZone *)zone{
    return self;
}

- (void)configWithDictionary:(NSDictionary *)dictionary {
#warning 注意类型是否匹配
    self.category = [dictionary objectForKey:@"category"];
    self.thumbnail_pic_s = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.url = [dictionary objectForKey:@"url"];
}
#pragma mark -

- (nonnull id<NSObject>)diffIdentifier {
    return _uniqueKey;
}

- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    if (self == object) {
        return YES;
    }

    if (![((NSObject *)object) isKindOfClass:[GTListItem class]]) {
        return NO;
    }
    
    return [_uniqueKey isEqualToString:((GTListItem *)object).uniqueKey];
}
@end
