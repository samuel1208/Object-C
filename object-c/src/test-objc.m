/* -*- mode:objc -*- */
#import <Foundation/Foundation.h>
#import "lib.h"
#import "AObjcClass.h"

int main(void)
{
  CREATE_AUTORELEASE_POOL(pool);

  NSString *string = [[NSString alloc] initWithCString:"I'm from NSString." encoding: [NSString defaultCStringEncoding]];
  NSLog(@"Hello, objc.\n");
  f([string cStringUsingEncoding:[NSString defaultCStringEncoding]]);

  AObjcClass *objcObj = [[AObjcClass alloc] init];
  [objcObj foo:@"Hello, objc class."];

  RELEASE(pool);  
  return 0;
}
