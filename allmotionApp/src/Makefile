TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = allmotion
# allmotion.dbd will be created and installed
DBD += allmotion.dbd

# allmotion.dbd will be made up from these files:
allmotion_DBD += base.dbd
#allmotion_DBD += busyRecord.dbd
allmotion_DBD += asyn.dbd
allmotion_DBD += calc.dbd
allmotion_DBD += stream.dbd
allmotion_DBD += drvAsynIPPort.dbd
allmotion_DBD += drvAsynSerialPort.dbd
allmotion_DBD += system.dbd
#allmotion_DBD += devIocStats.dbd
allmotion_DBD += asSupport.dbd
#allmotion_DBD += caPutLog.dbd
allmotion_DBD += asSupport.dbd

# Include dbd files from all support applications:
#allmotion_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
allmotion_LIBS += asyn
#allmotion_LIBS += busy
allmotion_LIBS += calc
allmotion_LIBS += stream
#allmotion_LIBS += devIocStats
allmotion_LIBS += autosave
#allmotion_LIBS += caPutLog

# allmotion_registerRecordDeviceDriver.cpp derives from allmotion.dbd
allmotion_SRCS += allmotion_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
allmotion_SRCS_DEFAULT += allmotionMain.cpp
allmotion_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#allmotion_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
allmotion_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

