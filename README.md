# Park Info

This is a *very* simple library to access information about theme parks.

Currently, it is only handling Disney parks, but I plan to add others quickly.

## Installation
`gem install park_info`

## Usage

```
> require 'park_info'
 => true
 
> mk = ParkInfo::DisneyWorld::MagicKingdom.new
 => #<ParkInfo::DisneyWorld::MagicKingdom:0x007fefc7887f98>
 
> barnstormer = a.attractions[5]
 => #<ParkInfo::DisneyAttraction:0x007fefc724bf30 @data=..."}>}>
> barnstormer.name
 => "The Barnstormer"
 
> barnstormer.waitTime.keys
 => ["fastPass", "status", "singleRider", "postedWaitMinutes", "rollUpStatus", "rollUpWaitTimeMessage"]
 
> barnstormer.waitTime.status
 => "Operating"
 
> barnstormer.waitTime.postedWaitMinutes
 => 20
```

Currently, the data is cached locally for 5 minutes.

## Supported Theme Parks

* Disney World Orlando
  - Animal Kingdom (`ParkInfo::DisneyWorld::AnimalKingdom`)
  - Epcot (`ParkInfo::DisneyWorld::Epcot`)
  - Hollywood Studios (`ParkInfo::DisneyWorld::HollywoodStudios`)
  - Magic Kingdom (`ParkInfo::DisneyWorld:MagicKingdom`)

