//
//  ConstantDefinition.h
//  Matchismo
//
//  Created by huyheo on 5/20/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//


#define DEBUG 1


#ifdef DEBUG
#	define DebugLog(format, ...) NSLog((@"<Debug>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	ifdef TRACE_LOG
#		define DebugTrace(format, ...) NSLog((@"<Trace>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	else
#		define DebugTrace(format, ...)
#	endif
#	define InfoLog(format, ...) NSLog((@"<Info> :%s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	define WarningLog(format, ...) NSLog((@"<Warning>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#	define ErrorLog(format, ...) NSLog((@"<Error>: %s [Line %d] " format), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#	define DebugLog(format, ...)
#	define DebugTrace(format, ...)
#	define InfoLog(format, ...) NSLog(@"<Info>: " format, ##__VA_ARGS__)
#	define WarningLog(format, ...) NSLog(@"<Warning>: " format, ##__VA_ARGS__)
#	define ErrorLog(format, ...) NSLog(@"<Error>: " format, ##__VA_ARGS__)
#endif




#   define URL_INFO @""

#define kCellHeight 50.0



