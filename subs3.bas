�   �� S��$ ��UbV � q$���� XJ�� �� ` { i�p z_*[ 4c"� �                   RR  a�  Z�  readshopname�  shopnum�@
flusharray�  array� size2 value� filenum no@writeconstant�  
filehandleQ num� name�  uniquek prefix@safekill� f)@	touchfile}@romfontcharB fontd chary@standardmenu menuO vis� ptrk top� x� y) pageV edge� readitemname� index� readattackname�@writeglobalstring� s? maxlen� readglobalstring3 default getShortName� filename� getLongName�@textfatalerrorH eV@xbloadA@
fatalerror� 
scriptname� genp 	unlumpone. lumpfile� onelump� asfile* 
getmapname� m 
numbertail�@	cropafter� limit< 
flushafter� lump� bytes� promptT isuniques u� r] loadname� length9 offset�@exportnamesL gamedir� songG excludev 	exclusive� 
needaddset� checke what browseX special� fmask tmp�@	cycletile� cycle� tastuf� skipf@testanimpattern� taset� usemenu� first� last heroname4 cond
 bound� lowest5 highest� onoroffw intstr� 	lmnemonic� rotascii   o�@debug(@bitset wof]@	edgeprint co ps@	formation� generalO@	enemydataU@herodata�@
attackdata=@getnames! stat� max�@statname�@textage sublist�@maptileI	 master� small n1� n2@ large loopvar� var min� inc{ 
intgrabber� less7 more�	@
strgrabber maxl� Regtype� ax� bx\ cx� dx� bp/ si di#	 flagsJ ds� esi@setmodex�@restoremode�@copypageB
 page1- page2@	clearpageU@
setvispage@setpal� pal�@fadetoz palbuff� red� greenm blue�@	fadetopalD@
setmapdata� pas� tN bo@setmapblock�	 v� readmapblock[@drawmap�@setanim cycle1I cycle2@
setoutside�	 defaulttile)@
drawsprite|
 pic# picoffe po�@
wardsprite�@	getsprite� w� h�@	stosprite9@
loadsprite�@	bigsprite@
hugesprite� Keyseg� keyoff  keyval� getkey@setkeys�@putpixel 	readpixel�
@	rectangle�
@	fuzzyrect�@drawline4 x1�	 y1	 x25	 y2E@paintat?	 bufZ@	storepage{ fil 
 i  @loadpage+	@setdiskpages(
 l�@setwait�@dowait�@printstr�@	textcolor�@setfont|	@setbit	 readbit�	@storeset�@loadsetN
@
setpicstufp
@bitmap2pageN temp	 bmp�@	findfiles   attribW	 outfile�	@	lumpfiles�	 listfa	 patho	 buffer 
@unlump�
 ulpathb@
unlumpfile�	 isfile   
pathlength�	@	getstring   	drivelist6
 d} rpathlength
 exenamelength�
@setdrive< 	envlength�	 isdir   sDir 	isvirtual   isremovable� hasmedia   LongNameLengthi
@
setupmusic�
 mbuf)@
closemusic\
@loadsong�
@stopsong  @
resumesong�
@	fademusic   vol�
 getfmvol!@setfmvolF@copyfile"@
screenshot�
 maspal�
@loadbmp1@	getbmppal�
 mpal   bmpinfo
 dat   setmouse�@	readmouse  @	movemouse  @	mouserect   xmin   xmax� ymin   ymax readjoy� joybuf   jnum[@	array2strG arr�@	str2array�@
setupstack� file  @pushw� word   popw  @releasestack   stackpos� 
trueglobal( 
workingdir   version game   
unsafefile   timing- vpage   dpage   keyvA out   ok   j7 failed   result   fh   namelen �   �   �   �   �     D  �      D  �      D  �  "  *    D < p& 	 B  �   J  Q  X  _  d  i  q    D  D� �    D  L� �    D  x  �  �  �    D  �� �  �  �    D *  � 4   OHRRPGCE CUSTOM - Even more misc unsorted routines  � F   (C) Copyright 1997-2005 James Paige and Hamster Republic Productions  � M   Please read LICENSE.txt for GPL License details and disclaimer of liability   � K   See README.txt for code docs and apologies for crappyness of this code ;)t  �      �    "      ������  �    basic subs and functions  D  ` � p     D  {   �   �   �     D  � � �     D $ �   �   �   �   �   �     D  �       D        D    "  *    D < 2 	 B  �   J  Q  X  _  d  i  q    D  y� �    D  �� �    D  �  �  �  �    D  �� �  �  �    D  �� �    D  � �    D    $    D  )    �   $    D  3  $    D  A� �     O    D  V� c  o  z    D  �� �    D  �� �    D * �  �  �  �  �  �  �    D  �� �  �  �    D  ��       D    )  O  4    D  <� �  _    D  G� �  _    D  T  Q  b  k    D  s� }   �  �  �    D  �  �  �  Q  �    D  �  �  �    D $ �  Q  X  �  �  �     D  �� �     V     D  � �         D  *� �     D  5� �     D  ?� �    D  L� �  X    D  ]  �    D  f  �   p  �  �     D $ �  Q  X  �  �  �     D $ w  �  _  d  �  �    D  �  �  4    D  �  �    D  �  �    D  �  �    D  �  �  �    D  �  �    D  �  �  4    D  �� �   �    D  
    "  �    D  � (  .    D  4� (  .    D  =� H  O  �  V    D $ ]  �   O  �  k  s    D  {  �  �      �    �  allmodex.bi'  � &   Library header - bare QBasic version  � 9   --register type used for direct assembly language calls     ��    �       �       �       �       �       �       �       �       �       �      ��    �    Library routines  D  �     D  �     D  �        D    i    D  !  i    D  /  9    D  @  J  U  \  e    D  m  9  J    D  z  �   �  �  �    D  �  _  d  �    D  �  _  d    D  �  _  d  �  �    D  �  �  �    D  �  �    D 0       9  #  _  d  i    D 0 )      9  #  _  d  i    D 0 7      _  d  D  I  i    D $ N      _  d  i    D 0 [      _  d  D  I  i    D * i    9  �  _  d  i    D * v    9  �  _  d  i    � R   DECLARE SUB INTERRUPTX (intnum AS INTEGER,inreg AS RegTypeX, outreg AS RegTypeX)  D  �     D  �     D  �  V     D  �     D  �     D  �  _  d  �  �    D  �  _  d  �    D * �  _  d  D  I  �  �    D * �  _  d  D  I  �  �    D * �  �  �      �  �    D *   _  d  �  i    �    D     -  4  �    D  9  -  4  �    D  E    I  U    D  Z  �  �    D  e     D  o  �  _  d  �    D  {    �    D  �      D  �  �  D  �  �    D  �  �  D  �    D  �  -  4  U    D  �  -  4  U    D  �    �  �    D  �  �  �  �    D  �  �  �  	      D  	  	  �  #	  +	    D  5	  �  ?	  +	    D  I	  �  �  #	      D  W	  �     D  a	     D  o	  �    D  |	  �	    D  �	     D  �	     D  �	  �     D  �	  $    D  �	  �	    D  �	  �	    D  �	  �	    D  �	  �	    D   
  �    D  
   
    D  (
     D  6
      D  B
     D  N
     D  \
  i
    D  p
     D  |
  i
    D  �
  �  �	      D  �
    �  �
      D $ �
    _  d    �    D  �
    �
  9  X    D  �
    �
    D  �
   
    D  �
   
    D  �
  _  d    D        !  )    D  1  <  F    D  N  [  X  �    D  b  �  [  X    D  o  +	  �   }    D  �  �    D  �     D  �     D  �       �    �  cglobals.bi'  �    OHRRPGCE CUSTOM - Globals  � F   (C) Copyright 1997-2005 James Paige and Hamster Republic Productions  � M   Please read LICENSE.txt for GPL License details and disclaimer of liabilityy  � K   See README.txt for code docs and apologies for crappyness of this code ;)t  �       � ������   +	�   �  
     	  ��D���� q B  
 flusharray 8^    ������  v  {   �   �    �       4d � V ����  �  4  �    4f ����  Q 	  �� ����   ��  writeglobalstring 8�    ������  v  �  �   �  �        A    �m .stt  A� �       �-�� �e�     	V    A� d �e p V � ��  � �e�   ,V    A� d	 �e p V � ��     A� �      Q 	  �� ����   ��  readglobalstring8&   ������  X  �� �   �  �        A  �m .stt  A� �       d	V    A� d �e p V � ��  d G V m  q]   V  G     �e p 4  A/_a    �7  I ��  G �  d	S7  A� d	 �e p 7� ��  P      A� �      7 �  Q 	  �� ����   �� 	 unlumpone8Z   ������  X  V  c  o  z    d V    m unlump1.tmp"d	   �	t]   m unlump1.tmp"�   cd	 m unlump1.tmp\   +	7  5	    m unlump1.tmp\o d	   W	a    m unlump1.tmp\o d	 zd	    +	8  �
 dx V  P     m unlump1.tmp\nothing.tmp"8      m unlump1.tmp\*.*"�   m unlump1.tmp"�     Q 	  �� ����   �� 
 numbertail8�   ������  X  �� �      }��    �     �m  a    m BLANK"  I �� �dB V   V e0 c V e9 _ua    �m 2"  I �� �V  m  � V dBe0 ^V dBe9 bH �� V dB� � V V -��dw,V  V -��d]   S �� b �� �-��d%_]   m 0"� �Z �   � d  �  V  � Q+  P   P     �    Q 	  �� ����   ��  exclude8�    ������  X  <� �  _    m     4d�-��V ���� dx "  (d_-��V ���� � 4d3_ (d3]   d "  (f ����  "]   � 4d3    4f ����  <  Q 	  �� ����   �� 	 exclusive8�    ������  X  G� �  _    m     4d�-��V ���� d "  (d_-��V ���� � 4d3_ (d3]   d "  (f ����  "]   � 4d3    4f ����  G  Q 	  �� ����   ��  rotascii8�    ������  X  L� �  X       m  �     4d�-��V ���� �� 4d3de�  X  =	 �   4f ����    �L    Q 	  �� ����   ��  debug 8V    ������  v  ]  �    m c_debug.txt"d� �    d� } ��   d� �    Q 	  �� ����       getLongName8r   ������  X  � �    � +   --given a filename, returns its longname.t  � =     it will always return the filename only, without the path   � A     even though it can accept a fully qualified filename as input     � C   --has a bug that prevents it from returning files that are longer   � %     than 260 chars including pathnamee    d -  m  7  �d	    
    dxa    � !  --failed to get any name at alln dx -  I ��  dSV  V 8  o	  4V -��ddxW ���� V  4d3m \"V  4d3m :"u]   T �� V  4d3d	qa    V  4d37 7 P   4f ���� 7m  a    �   --never return a null result! dx - P   P    -a    � %  --failed, return input (minus path)  4�-��ddxW ���� � 4d3m \"� 4d3m :"u]   T �� � 4d37 7  4f ����  P   7  Q 	  �� ����&   ��