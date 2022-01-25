#!../../bin/linux-x86_64/allmotion

#- You may have to change allmotion to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/allmotion.dbd",0,0)
allmotion_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/allmotion.db","user=liji")

iocInit()

## Start any sequence programs
#seq sncallmotion,"user=liji"
