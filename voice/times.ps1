<#  File: times.ps1
    This file sets up the PowerShell jobs that execute the main payload.
    
#>
$dir = "$HOME\bin"
$times = '08:44am','09:41am','10:31am','11:17am','12:24pm','01:23pm','02:53pm','03:57pm','04:08pm','05:4pm','06:56pm','07:49pm','07:57pm','08:05pm','08:09pm','08:31pm','10:39pm'
$days = 'Monday','Tuesday','Wednesday','Thursday','Friday'
$trig = @()
foreach($time in $times){
    $trig += New-JobTrigger -Weekly -At $time -DaysofWeek $days
}
Register-ScheduledJob -Name 'FunnyVoice' -Trigger $trig -FilePath $dir\voice.ps1