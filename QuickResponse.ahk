#SingleInstance force

global script := ""
global outputText := ""


^+1::SendText(1)
^+2::SendText(2)
^+3::SendText(3)
^+4::SendText(4)
^+5::SendText(5)
^+6::SendText(6)
^+7::SendText(7)
^+8::SendText(8)
^+9::SendText(9)
^+0::SendText(0)



SendText(script){
    FileRead, textFile, .\Scripts\%script%.txt
    If InStr(textFile, "$"){
        InputBox, name, Enter Name, Type a name to deceptively attempt to make this seem a little bit less like an impersonal script:
        outputText := StrReplace(textFile, "$", name, outputvarcount)
    } else{
        outputText := %textFile%
    }

    TempClipboard := Clipboard
    Clipboard = %outputText%
    Send, ^v
    Clipboard := TempClipboard
}


