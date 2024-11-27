!classDefinition: #HolidayCalendarTest category: 'HolidayCalendar'!
TestCase subclass: #HolidayCalendarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 08:08:45'!
test01AnyWeekdayCanBeHoliday
	"
	Given....When...Then....
	"

	| aSunday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (WeekdayHolidayRule for: Sunday).
	aSunday := April/23/2023.
	
	self assert: (holidayCalendar isHoliday: aSunday).
! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 08:08:40'!
test02ThereCanBeNoHolidays

	| aMonday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	aMonday := April/24/2023.
	
	self deny: (holidayCalendar isHoliday: aMonday).
	! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/24/2023 19:26:58'!
test03MoreThanOneWeekdayCanBeHoliday

	| aSaturday holidayCalendar aSunday |

	holidayCalendar := HolidayCalendar new.
	aSaturday := April/22/2023.
	aSunday := April/23/2023.
	
	holidayCalendar addHolidayRule: (WeekdayHolidayRule for: Saturday).
	holidayCalendar addHolidayRule: (WeekdayHolidayRule for: Sunday).
	
	self assert: (holidayCalendar isHoliday: aSaturday).
	self assert: (holidayCalendar isHoliday: aSunday).! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 07:55:57'!
test04AMonthDayCanBeHoliday

	| aNavidad holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (MonthDayHolidayRule for: December / 25).
	aNavidad := December/25/2023.
	
	self assert: (holidayCalendar isHoliday: aNavidad)! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 07:56:21'!
test05MoreThanOneMonthDayCanBeHoliday

	| aNavidad holidayCalendar aNewYear |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (MonthDayHolidayRule for: December/25).
	holidayCalendar addHolidayRule: (MonthDayHolidayRule for: January / 1).
	aNavidad := December/25/2023.
	aNewYear := January/1/2023.
	
	self assert: (holidayCalendar isHoliday: aNavidad).
	self assert: (holidayCalendar isHoliday: aNewYear).! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 07:58:21'!
test06IsHolidayWhenInRangeAndIsHolidayInInnerRule

	| aMonday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (BoundedHolidayRule 
		for: (WeekdayHolidayRule for: Monday) 
		between: April/24/2023 
		and: April/24/2023).
	aMonday := April/24/2023.
	
	self assert: (holidayCalendar isHoliday: aMonday)! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 07:59:20'!
test07IsNotHolidayWhenInRangeButNotHolidayForInnerRule

	| aTuesday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (BoundedHolidayRule 
		for: (WeekdayHolidayRule for: Monday) 
		between: April/24/2023 
		and: April/25/2023).
	aTuesday := April/25/2023.
	
	self deny: (holidayCalendar isHoliday: aTuesday)! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 07:59:46'!
test08IsNotHolidayWhenBeforeRangeAndIsHolidayForInnerRule

	| aMonday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (BoundedHolidayRule for: (WeekdayHolidayRule for: Monday) between: April/25/2023 and: April/25/2023).
	aMonday := April/24/2023.
	
	self deny: (holidayCalendar isHoliday: aMonday)! !

!HolidayCalendarTest methodsFor: 'tests' stamp: 'HAW 4/25/2023 08:00:02'!
test09IsNotHolidayWhenAfterRangeAndIsHolidayForInnerRule

	| aMonday holidayCalendar |

	holidayCalendar := HolidayCalendar new.
	holidayCalendar addHolidayRule: (BoundedHolidayRule for: (WeekdayHolidayRule for: Monday) between: April/24/2023 and: April/24/2023).
	aMonday := May/1/2023.
	
	self deny: (holidayCalendar isHoliday: aMonday)! !


!classDefinition: #HolidayCalendar category: 'HolidayCalendar'!
Object subclass: #HolidayCalendar
	instanceVariableNames: 'rules'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!HolidayCalendar methodsFor: 'holidays' stamp: 'HAW 4/24/2023 19:23:17'!
addHolidayRule: aHolidayRule

	rules add: aHolidayRule ! !

!HolidayCalendar methodsFor: 'holidays' stamp: 'HAW 4/24/2023 19:30:00'!
isHoliday: aPotentialHoliday 
	
	^ rules anySatisfy: [ :aRule | aRule isHoliday: aPotentialHoliday ]! !


!HolidayCalendar methodsFor: 'initialization' stamp: 'HAW 4/24/2023 19:29:03'!
initialize

	rules := Set new.
	! !


!classDefinition: #HolidayRule category: 'HolidayCalendar'!
Object subclass: #HolidayRule
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!HolidayRule methodsFor: 'testing' stamp: 'HAW 4/24/2023 19:31:02'!
isHoliday: aPotentialHoliday

	self subclassResponsibility ! !


!classDefinition: #BoundedHolidayRule category: 'HolidayCalendar'!
HolidayRule subclass: #BoundedHolidayRule
	instanceVariableNames: 'holidayRule range'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!BoundedHolidayRule methodsFor: 'initialization' stamp: 'HAW 4/25/2023 08:01:48'!
initializeFor: aHolidayRule between: aFrom and: aTo 
	
	holidayRule := aHolidayRule.
	range := aFrom to: aTo ! !


!BoundedHolidayRule methodsFor: 'testing' stamp: 'HAW 4/25/2023 08:03:03'!
inRange: aPotentialHoliday

	^range includes: aPotentialHoliday ! !

!BoundedHolidayRule methodsFor: 'testing' stamp: 'HAW 4/24/2023 19:44:26'!
isHoliday: aPotentialHoliday 
	
	^(holidayRule isHoliday: aPotentialHoliday)  and: [ self inRange: aPotentialHoliday]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoundedHolidayRule class' category: 'HolidayCalendar'!
BoundedHolidayRule class
	instanceVariableNames: ''!

!BoundedHolidayRule class methodsFor: 'instance creation' stamp: 'HAW 4/24/2023 19:38:39'!
for: aHolidayRule between: aFrom and: aTo 
	
	^self new initializeFor: aHolidayRule between: aFrom and: aTo ! !


!classDefinition: #MonthDayHolidayRule category: 'HolidayCalendar'!
HolidayRule subclass: #MonthDayHolidayRule
	instanceVariableNames: 'monthdayHoliday'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!MonthDayHolidayRule methodsFor: 'initialization' stamp: 'HAW 4/24/2023 19:28:15'!
initializeFor: aMonthdayHoliday 
	
	monthdayHoliday := aMonthdayHoliday.! !


!MonthDayHolidayRule methodsFor: 'testing' stamp: 'HAW 4/24/2023 19:28:36'!
isHoliday: aPotentialHoliday 
	
	^aPotentialHoliday dayOfMonth = monthdayHoliday ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MonthDayHolidayRule class' category: 'HolidayCalendar'!
MonthDayHolidayRule class
	instanceVariableNames: ''!

!MonthDayHolidayRule class methodsFor: 'instance creation' stamp: 'HAW 4/24/2023 19:28:09'!
for: aMonthdayHoliday 
	
	^self new initializeFor: aMonthdayHoliday ! !


!classDefinition: #WeekdayHolidayRule category: 'HolidayCalendar'!
HolidayRule subclass: #WeekdayHolidayRule
	instanceVariableNames: 'weekdayHoliday'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'HolidayCalendar'!

!WeekdayHolidayRule methodsFor: 'initialization' stamp: 'HAW 4/24/2023 19:24:20'!
initializeFor: aWeekdayHoliday 
	
	weekdayHoliday := aWeekdayHoliday.! !


!WeekdayHolidayRule methodsFor: 'testing' stamp: 'HAW 4/24/2023 19:24:55'!
isHoliday: aPotentialHoliday 
	
	^aPotentialHoliday day = weekdayHoliday ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WeekdayHolidayRule class' category: 'HolidayCalendar'!
WeekdayHolidayRule class
	instanceVariableNames: ''!

!WeekdayHolidayRule class methodsFor: 'instance creation' stamp: 'HAW 4/24/2023 19:24:12'!
for: aWeekdayHoliday 
	
	^self new initializeFor: aWeekdayHoliday ! !
