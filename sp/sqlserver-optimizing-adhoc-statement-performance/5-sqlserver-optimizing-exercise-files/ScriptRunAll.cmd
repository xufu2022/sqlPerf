start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript01_1kAdHocSafeStatements.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript02_1kAdHocUnsafeForceableStatements.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript03_1kAdHocUnsafeUnforceableStatements.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript04_1kAdHocUnsafeStableStatements.sql
