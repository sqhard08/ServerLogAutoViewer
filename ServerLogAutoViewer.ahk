1#Requires AutoHotkey v2.0
#SingleInstance Force

servers := ["srv1", "srv2, "srv3]
commands := ["sudo journalctl -u srv1 -f --no-hostname -o cat",  
             "sudo journalctl -u srv2f --no-hostname -o cat", 
             "sudo journalctl -u srv3-f --no-hostname -o cat"]
password := "1"
x := 0
y := 0
width := 380
height := 200

for index, server in servers {
    command := commands[index]
    Run "C:\putty.exe -load " . server
    
    if !WinWait("ahk_class PuTTY", , 10) {
        MsgBox "Не удалось открыть окно PuTTY для сервера " . server
        continue
    }
    
    WinActivate "ahk_class PuTTY"
    Sleep 2000
    
    ; Ввод пароля
    SendInput password . "{Enter}"
    Sleep 5000  ; Увеличенное время ожидания после ввода пароля
    
    ; Ввод команды
    SendInput command . "{Enter}"
    Sleep 2000  ; Ждем после ввода команды
    
    ; Попытка переместить окно
    try {
        WinMove x, y, width, height, "ahk_class PuTTY"
    } catch as err {
        MsgBox "Не удалось переместить окно для сервера " . server . ": " . err.Message
    }
    
    ; Расчет новой позиции
    x += width
    if (x + width > A_ScreenWidth) {
        x := 0
        y += height
    }
    
    Sleep 3000  ; Дополнительная пауза между итерациями
}

MsgBox "Скрипт завершил выполнение."
