.model large
.stack 100h
.data
hi db 'Welcome to DOS ASSEMBLY SIMPLE MULTICHOICE QUIZ by (C)thetechdog',13,10,'$' ;amazing program name, right?!
i1 db 'What is the boiling point of water?',13,10,'$'
i1a db 'a)100 degrees C',13,10,'$' ;+3
i1b db 'b)0 degrees C',13,10,'$'  ;+0
i1c db 'c)101 degrees C',13,10,'$' ;+2
i1d db 'd)80 degrees C',13,10,'$' ;+1
i2 db 10,'1+1=?',13,10,'$'
i2a db 'a)4',13,10,'$' ;+2
i2b db 'b)1',13,10,'$' ;+0
i2c db 'c)2',13,10,'$' ;+3
i2d db 'd)-2',13,10,'$' ;+1
i3 db 10,'The Intel 4004 is a...',13,10,'$'
i3a db 'a)8-bit CPU',13,10,'$' ;+2
i3b db 'b)4-bit CPU',13,10,'$' ;+3
i3c db 'c)16-bit CPU',13,10,'$' ;+1
i3d db 'd)32-bit CPU',13,10,'$' ;+0
i4 db 10,'What does PC mean?',13,10,'$'
i4a db 'a)Portable Computer',13,10,'$' ;+2
i4b db 'b)Pocket CD',13,10,'$' ;+0
i4c db 'c)Programmable Console',13,10,'$' ;+1
i4d db 'd)Personal Computer',13,10,'$' ;+3
i5 db 10,'The OS that MS-DOS was built upon?',13,10,'$'
i5a db 'a)PC DOS',13,10,'$' ;+1
i5b db 'b)FreeDOS',13,10,'$' ;+0
i5c db 'c)86-DOS/QDOS',13,10,'$' ;+3
i5d db 'd)CP/M',13,10,'$' ;+2
i6 db 10,'How many layers does a 128GB Blu-ray disc have?',13,10,'$'
i6a db 'a)4',13,10,'$' ;+3
i6b db 'b)3',13,10,'$' ;+2
i6c db 'c)6',13,10,'$' ;+1
i6d db 'd)2',13,10,'$' ;+0
z db 10,'+0 points',13,10,'$'
u db 10,'+1 point',13,10,'$'
d db 10,'+2 points',13,10,'$'
t db 10,'+3 points',13,10,'$'
cmax db 10,'Congratulations! Everything is correct! Bravo. - Rank A',13,10,'$' ;18 points
cgood db 10,'Hey, you are pretty good! - Rank B',13,10,'$' ;13-17 points
cmed db 10,'Hmm... Passable, but you can do better! - Rank C',13,10,'$';7-12 points
cbad db 10,'Not good! Try again! - Rank D',13,10,'$';1-6 points
cmin db 10,'Unbelievable... All of your answers are plain wrong! - Rank E',13,10,'$' ;0 points

.code
;Initializing data segment
mov ax,@data   ;data segment base address
mov ds,ax
;print welcome message
mov dx,offset hi
call output
;print i1 (and every choice, using interrupt 9)
mov dx,offset i1
call output
mov dx,offset i1a
call output
mov dx,offset i1b
call output
mov dx,offset i1c
call output
mov dx,offset i1d
call output

mov bx,0 ;preparing bx for score calculation

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a1
;compare choice with character b
cmp al,62h
je b1
;compare choice with character c
cmp al,63h
je c1
;compare choice with character d
cmp al,64h
je d1

;awarding points i1
a1:
call three
jmp int2

b1:
call zero
jmp int2

c1:
call two
jmp int2

d1:
call one
jmp int2

int2:
;print i2
mov dx,offset i2
call output
mov dx,offset i2a
call output
mov dx,offset i2b
call output
mov dx,offset i2c
call output
mov dx,offset i2d
call output

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a2
;compare choice with character b
cmp al,62h
je b2
;compare choice with character c
cmp al,63h
je c2
;compare choice with character d
cmp al,64h
je d2

;awarding points i2
a2:
call two
jmp int3

b2:
call zero
jmp int3

c2:
call three
jmp int3

d2:
call one
jmp int3

int3:
;print i3
mov dx,offset i3
call output
mov dx,offset i3a
call output
mov dx,offset i3b
call output
mov dx,offset i3c
call output
mov dx,offset i3d
call output

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a3
;compare choice with character b
cmp al,62h
je b3
;compare choice with character c
cmp al,63h
je c3
;compare choice with character d
cmp al,64h
je d3

;awarding points i3
a3:
call two
jmp int4

b3:
call three
jmp int4

c3:
call one
jmp int4

d3:
call zero
jmp int4


int4:
;print i4
mov dx,offset i4
call output
mov dx,offset i4a
call output
mov dx,offset i4b
call output
mov dx,offset i4c
call output
mov dx,offset i4d
call output

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a4
;compare choice with character b
cmp al,62h
je b4
;compare choice with character c
cmp al,63h
je c4
;compare choice with character d
cmp al,64h
je d4

;awarding points i4
a4:
call two
jmp int5

b4:
call zero
jmp int5

c4:
call one
jmp int5

d4:
call three
jmp int5

int5:
;print i5
mov dx,offset i5
call output
mov dx,offset i5a
call output
mov dx,offset i5b
call output
mov dx,offset i5c
call output
mov dx,offset i5d
call output

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a5
;compare choice with character b
cmp al,62h
je b5
;compare choice with character c
cmp al,63h
je c5
;compare choice with character d
cmp al,64h
je d5

;awarding points i5
a5:
call one
jmp int6

b5:
call zero
jmp int6

c5:
call three
jmp int6

d5:
call two
jmp int6

int6:
;print i6
mov dx,offset i6
call output
mov dx,offset i6a
call output
mov dx,offset i6b
call output
mov dx,offset i6c
call output
mov dx,offset i6d
call output

;reading choice input
mov ah,1 ;move character in al
int 21h
;compare choice with character a
cmp al,61h
je a6
;compare choice with character b
cmp al,62h
je b6
;compare choice with character c
cmp al,63h
je c6
;compare choice with character d
cmp al,64h
je d6

;awarding points i6
a6:
call three
jmp awards

b6:
call two
jmp awards

c6:
call one
jmp awards

d6:
call zero
jmp awards



awards:
mov ax,bx
;comparing the obtained score with each rank
cmp ax,18d ;verify max
je pmax
cmp ax,0d ;verify min
jz pmin
cmp ax,6 ;verify bad
jle pbad
cmp ax,12 ;verify med
jle pmed
cmp ax,17 ;verify good
jle pgood


closure:
;program termination interrupt
mov ah,4ch
int 21h

pmax: ;print rank message maximum
mov dx,offset cmax
call output
jmp closure

pmin: ;print rank message minimum
mov dx,offset cmin
call output
jmp closure

pbad: ;print rank message bad
mov dx,offset cbad
call output
jmp closure

pmed: ;print rank message med
mov dx,offset cmed
call output
jmp closure

pgood: ;print rank message good
mov dx,offset cgood
call output
jmp closure

output:   ;string output procedure
mov ah,9h
int 21h
ret

zero: ;procedure that awards 0 points
mov dx,offset z
call output
ret

one: ;procedure that awards 1 point
mov dx,offset u
call output
inc bx
ret

two: ;procedure that awards 2 points
mov dx,offset d
call output
add bx,2
ret

three: ;procedure that awards 3 points
mov dx,offset t
call output
add bx,3
ret

end
