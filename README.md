# Fax2dotZero
This is a function for players of KOL to be able to gather faxes from specific side-clans they have been added to.

What does it do?
----------------
This is a function that can be added into daily automation scripts to help get the fax you need (if other faxbots are being tempermental)
The script runs best when not attempted as a stand-alone script.

The script will work with members of OldCWs that have been added to the whitelist of various fax-enabled side clans.

Here is how it works:
---------------------
At the top of your script, add the following statement:
<pre>
import <Fax2dotZero.ash>
</pre>

then to get your monster, put the name into a string in the script, either directly in the code (shown in the example below), or as a per-character preference. 
<pre>
string desiredMonster = "knob goblin embezzler";
GetClanFax(desiredMonster);
</pre>

The functions will then try to see if your monster is in the side-clan fax network (if not, it will drop you in OldCWs so you can ask for it). It will automatically try to have you join the side-clan and then confirm the fax is still correct before getting it. 

It does basic error checking, but expects people to already be on the whitelist and generally know what they're doing.

How do I get it?
----------------
First, install it by running this command in KoLmafia's graphical CLI:

<pre>
git checkout infopowerbroker/Fax2dotZero release
</pre>


To update the script itself, run this command in the graphical CLI:

<pre>
git update
</pre>
