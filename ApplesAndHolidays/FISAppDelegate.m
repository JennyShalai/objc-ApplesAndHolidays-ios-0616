//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    NSMutableArray *appleArray = [NSMutableArray new];
    for (NSString *fruit in fruits) {
        if ([fruit isEqualToString:@"apple"]) {
            [appleArray addObject:fruit];
        }
    }
    return appleArray;
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *holidaysInSeason = database[season];
    return holidaysInSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *suppliesInHoliday = database[season][holiday];
    return suppliesInHoliday;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    bool isHolidayInSeason = NO;
    NSMutableArray * holidaysInSeason = database[season][holiday];
    if ([holidaysInSeason count] > 0) {
        isHolidayInSeason = YES;
    }
    return isHolidayInSeason;
}

-(BOOL)supply:(NSString *)supply isInHoliday:( NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    bool isSupplyInHoliday = NO;
    NSMutableArray * suppliesInHoliday = database[season][holiday];
    if ([suppliesInHoliday containsObject:supply]) {
        isSupplyInHoliday = YES;
    }
    return isSupplyInHoliday;
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *databaseMutable = [database mutableCopy];
    NSArray *value = @[];
    [databaseMutable [season] setValue:value forKey:holiday];
    return databaseMutable;
}

- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *databaseMutable = [database mutableCopy];
    [databaseMutable [season] setValue:supply forKey:holiday];
    return databaseMutable;
}

@end