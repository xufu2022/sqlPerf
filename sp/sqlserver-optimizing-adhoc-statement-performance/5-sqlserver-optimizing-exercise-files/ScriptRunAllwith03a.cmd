start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript01_1kAdHocSafeStatements.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript02_1kAdHocUnsafeForceableStatements.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript03a_1kAdHocUnsafeUnforceableStatements_ExecuteWsp_executesql.sql
start sqlcmd -S(local)\SQL2012Dev01 -dCredit -iScript04_1kAdHocUnsafeStableStatements.sql
