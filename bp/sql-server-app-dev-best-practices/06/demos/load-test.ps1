# Borrowed from Merrill Aldrich
# http://sqlblog.com/blogs/merrill_aldrich/archive/2013/07/12/quick-and-dirty-powershell-sql-server-load-test.aspx
# Start  clients running the same SQL script simultaneously

# --- params ---
$numWorkers    = 10
$numIterations = 100
# --------------

$jobscript = {
    (1..$numIterations) | foreach {  
        Invoke-Sqlcmd -Query "SELECT * FROM Contact.Contact WHERE AddressId = $(Get-Random -minimum 100 -maximum 20000);" `
            -ServerInstance RUDI -Database PachaDataTraining -QueryTimeout 0
        Start-Sleep -Milliseconds 50
    }  
}

(1..$numWorkers) | foreach {
    Start-Job -ScriptBlock $jobscript
}
