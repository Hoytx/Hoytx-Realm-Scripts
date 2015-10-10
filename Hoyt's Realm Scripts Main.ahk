;--------------------------------------------------------------------
;Hoytx's Realm Scripts
;Contains a group of helpful scripts for RotMG
;--------------------------------------------------------------------
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
; CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.
;
;--------------------------------------------------------------------

#SingleInstance, Force
#Persistent
SetTitleMatchMode 2
Process, Priority,, High

;--------------------------------------------------------------------

;Scripts from Nightfirecat's realmscript

;--------------------------------------------------------------------

; sends passed string to the chat using the specified mode
sendChat(message, mode="public"){
	global
	local activation_key, key
	if(mode=="public"){
		activation_key = %CHAT_ACTIVATION_KEY%
		key = Enter
	} else if(mode=="guild") {
		activation_key = %GUILD_ACTIVATION_KEY%
		key = g
	} else { ;mode=="tell"
		activation_key = %TELL_ACTIVATION_KEY%
		key = Tab
	}
	if(activation_key){
		key = %activation_key%
	}
	local ClipSaved := ClipboardAll
	clipboard := message
	Blockinput, on
	Send {%key%}
	Send ^v
	Send {Enter}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ;save memory
}

; set a teleport target
^n::InputBox, tptarget, Teleport target, Please enter a person to teleport to:

; teleport to the target set with ^n
+RButton::
	sendChat("/teleport " tptarget)
	Return

; convert /tp to /teleport in the game chat
:*:/tp::
	ClipSaved := ClipboardAll
	clipboard := "/teleport"
	Blockinput, on
	Send ^a
	Send ^v
	Send {Space}
	Blockinput, off
	Sleep 100
	clipboard := ClipSaved
	ClipSaved := "" ;save memory
Return

;Opens textbox to save message for spamming.
^m::InputBox, textspam, Text Spam, Please enter a message to send to chat:

;Main Hotkeys

`:: ;(backtick)
	sendChat("/pause")
Return

^w::
	sendChat("/who")
Return

^s::
	sendChat("/server")
Return

^q::
Return

^e::
Return

F1::
	sendChat("Heal please?")
Return

F2::
	sendChat("Thank you. =)")
Return

F3::
	sendChat("No problem. =)")
Return

F4::
	sendChat("He lives and reigns and conquers the world")
Return

F10::
	sendChat(textspam)
Return

F11::
	sendChat("/tutorial")
Return

F12::
	sendChat("/nexustutorial")
Return

; scroll the chat log with the default in game keybinds

+WheelUp::
	Send {PgUp}
Return

+WheelDown::
	Send {PgDn}
Return

F9::
    ExitApp
return

;--------------------------------------------------------------------