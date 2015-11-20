//
//  Created by Isra San Jose on 19/11/2015.
//  Copyright © 2015 Isra San Jose. All rights reserved.
//

#import "NSObject+Parser.h"

@implementation NSObject (Parser)

- (NSDictionary*)mappingKeyIfNeeded
{
    return @{
             @"server_key1":@"mymodel_key1",
             @"server_key2":@"mymodel_key2"
            };
}

- (void)parseValue:(id)value forKey:(NSString *)key
{
    NSString *mappedKey = [[self mappingKeyIfNeeded] valueForKey:key];
    if (!mappedKey) {
        mappedKey = key;
    }

    if (![self respondsToSelector:NSSelectorFromString(mappedKey)]) {
        return;
    }

    NSError *error = nil;
    BOOL validated = [self validateValue:&value forKey:mappedKey error:&error];
    if (validated) {
        if (value != [NSNull null] && value != nil) {
            [self setValue:value forKey:mappedKey];
        } else {
            [self setNilValueForKey:mappedKey];
        }
    } else {
        NSLog(@"oops! the value for %@ is invalid in %@.",key,[self.class description]);
    }
}

- (void)parseValuesWithDictionary:(NSDictionary *)json
{
    for (NSString *key in json) {
        id value = json[key];
        [self parseValue:value forKey:key];
    }
}

@end
