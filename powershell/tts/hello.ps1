Add-Type -AssemblyName System.Speech

$synth = New-Object System.Speech.Synthesis.SpeechSynthesizer
$synth.SelectVoice("Microsoft David Desktop")

while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 120 -Maximum 241)
    $synth.Speak("Hello")
}
