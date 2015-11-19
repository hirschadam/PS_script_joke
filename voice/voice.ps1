<#  File: voice.ps1
    Purpose: This is the main payload for the Text-To-Speech prank,
             it executes the Speech Synthesizer from a document containing phrases.
    
#>
[Reflection.Assembly]::LoadWithPartialName('System.Speech') | Out-Null 

$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$scriptPath = Join-Path $executingScriptDirectory "phrases.txt"
Invoke-Item $scriptPath -OutFile $HOME\bin\phrases.txt
$phrases =  Get-Content $HOME\bin\phrases.txt
$phrase = Get-Random $phrases
$object = New-Object System.Speech.Synthesis.SpeechSynthesizer 
$object.SelectVoiceByHints('Male')
$object.Speak($phrase)