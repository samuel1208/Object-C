/* -*- mode:objc -*- */
#import "AObjcClass.h"
#import "lib.hpp"

@interface AObjcClass (AObjcClass)
AClass *aObj;
@end

@implementation AObjcClass

- (id) init
{
  self = [super init];
  if (self) {
	aObj = new AClass;
  }
  return self;
}

- (void) foo:(NSString *)str
{
  aObj->foo([str cStringUsingEncoding:[NSString defaultCStringEncoding]]);
}

@end
