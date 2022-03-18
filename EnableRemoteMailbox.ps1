###THIS WILL ENABLE A REMOTE MAILBOX FOR THE USERNAME IN CSV FILE!###

param (
	
    [Parameter( Mandatory=$false)]
    [string]$CSVFileName="D:\verified\usernames.csv"

)

$logfile = "D:\verified\mailbox.log"

Get-Date | Out-File $logfile


If (Test-Path $CSVFileName) {

    #Import the CSV file
    $csvfile = Import-CSV $CSVFileName
        
    #Loop through CSV file
    foreach ($user in $csvfile) {

        try {
            #enable the remote mailbox    
Enable-RemoteMailbox $user.Username -remoteroutingaddress ($user.username+'@companyname.mail.onmicrosoft.com') -ErrorAction STOP


            "$($user.username) mailbox was created successfully in O365."| Out-File $logfile -Append
        }
        catch {
            
            $message = "A problem occured trying to create the $($user.username) O365 Mailbox"
            $message | Out-File $logfile -Append
            Write-Warning $message
            Write-Warning $_.Exception.Message
            $_.Exception.Message | Out-File $logfile -Append
        }

    }
}
else {

    $message = "The CSV file $CSVFileName was not found."
    $message | Out-File $logfile -Append
    throw $message

}