#OldCWBusinessCenters
#List of Fax Machines
#BigTimers - Embezzler
#<option value="35794">Big Timers</option> - Embezzler
#<option value="2047009814">Crimboner Town</option>
#<option value="2047009989">Dread Emporium</option>
#<option value="2047008786">Eden</option>
#<option value="2046980780">InvisiClan</option>
#<option value="2046997000">Kami's Kompadres</option>
#<option value="2047004343">Karma Chameleon</option>
#<option value="2047009834">Kulth's Side-Piece</option>
#<option value="2047002929">My dinky little sideclan</option>
#<option value="2047006921">Neo-Serenity</option>
#<option value="2047007621">Noob Runners</option>
#<option value="14909">Old CW's Germ Free Clan</option>
#<option value="2047003099">Portable Clan</option>
#<option value="2047009879">Quelzie's Super Secret Society Stash Space</option> -Clod Hopper
#<option value="2047007221">The Chalmun's Cantina</option>
#<option value="2047009848">The Great Tortoise Library</option>
#<option value="2047009795">The Kuilebarrow</option>
#<option value="2047006847">Upside-Down</option>
void switchClan(int ClanID){
	string URLBuild = "showclan.php?recruiter=1&whichclan="+ClanID+"&action=joinclan&apply=Apply+to+this+Clan&confirm=on&pwd";
	//print(URLBuild);
	buffer apply = visit_url( URLBuild );
		//this is debug text, works with Big Timers Only, Remove
	//	if( contains_text( apply , "Big Timers" ) ){
	//		print( "Successfully joined Big Timers on a whitelist!" , "green" );
	//		
	//	}
	//	else{
	//		print( "Could not join  Big Timers! You may already be a member of this clan." , "red" );
	//		print(apply);
			
		//}
}
void getTheFax(){
		print("Grabbing the fax from " + get_clan_name() +".");
		visit_url("clan_viplounge.php?preaction=receivefax&whichfloor=2");
}

monster refreshTheFaxLog(int StartingClan){
//we do this when the fax isn't in the clan log due to inactivity and we need to check to see what it is.
getTheFax();
//now we put it back so we can check what it is
		print("shoving the fax back into the machine in " + get_clan_name() +".");
		visit_url("clan_viplounge.php?preaction=sendfax&whichfloor=2");
//now we check the logs to see if this shows up	
	monster ClanFaxLogMonster = $monster[1048];
	string logs = visit_url("clan_log.php");
	string error_msg = catch {
	matcher last_fax = "(\\d{2}\/\\d{2}\/\\d{2}, \\d{2}:\\d{2}(?:AM|PM): )<a [^>]+>([^<]+)<\/a>( faxed in a (.*?))<br>".create_matcher(logs);
	boolean found = last_fax.find();
	string text = last_fax.group(1) + last_fax.group(2) + last_fax.group(3);
	ClanFaxLogMonster = last_fax.group(4).to_monster();

	print ("We are a member of Clan "+ get_clan_name());
	print ("We found a " + ClanFaxLogMonster);
	
	};
	
	if (error_msg != ""){
	print("We experienced the following error:"	);
	print(error_msg);
	if(user_confirm("The right monster /should/ be here, but we can't check. Do you want us to get it anyway and you can check yourself? (You will need to restart your script and go back to your home clan. Ask the clan operator for the permission to read the 'Clan Activity Log'. Going back to OldCWs)")){
			getTheFax();
			switchClan(StartingClan);
			abort();
		}
	
	}
	return ClanFaxLogMonster;
}

monster checkTheFax(string WantedmonsterToFax, int StartingClan){

	monster ThisClansFax = $monster[1048];
	//parse the clan log to see what the last fax was
	string logs = visit_url("clan_log.php");
	string error_msg = catch {
	matcher last_fax = "(\\d{2}\/\\d{2}\/\\d{2}, \\d{2}:\\d{2}(?:AM|PM): )<a [^>]+>([^<]+)<\/a>( faxed in a (.*?))<br>".create_matcher(logs);
	boolean found = last_fax.find();
	string text = last_fax.group(1) + last_fax.group(2) + last_fax.group(3);
	ThisClansFax = last_fax.group(4).to_monster();

	print ("We are a member of Clan "+ get_clan_name());
	print ("We are looking for a " + WantedmonsterToFax);
	print ("We found a " + ThisClansFax);
	
	};
	
	if (error_msg != ""){
	//print("We experienced the following error:"	);
	//print(error_msg);
	//if(user_confirm("The right monster /should/ be here, but we can't check. Do you want us to get it anyway and you can check yourself? (You will need to restart your script and go back to your home clan. Ask the clan operator for the permission to read the 'Clan Activity Log'. Going back to OldCWs)")){
	//	getTheFax();
	//		switchClan(StartingClan);
	//		abort();
	ThisClansFax = refreshTheFaxLog(StartingClan);
	//}
	
	}
	print("No error seen!");
	print(error_msg);
	print("The above should be blank");
	return ThisClansFax;

}




void GetClanFax (string monsterToFax){

	int StartingClan = 14909; //OldCWs -- change to starting clan
	//check to see what the current fax is and if it matches what we want
	monster currentFax = checkTheFax(MonsterToFax, StartingClan);

	//if it matches what we want, get it.
	if(monsterToFax == currentFax){
		getTheFax ();
	}
	//if it doesn't match, check and see if we have it in stock
	else{
	
		switch(monsterToFax){
		
			case "knob goblin embezzler":
				//This is obtained by using GetClanFax("Knob Goblin Embezzler");
				print("We're going to go get a KGE from the clan BigTimers");
				switchClan(35794); //BigTimers has a KGE
				break;
			
			case "swarm of fudgewasps":
				//This is obtained by using GetClanFax("swarm of fudgewasps");
				print("We're going to go get a Swarm of Fudgewasps from the clan Kulth's Side-Piece");
				switchClan(2047009834); //Kulth's Side-Piece has Fudgewasps
				break;
				
			case "clod hopper":
				print("We're going to go get a clod hopper from the clan");
				switchClan(2047009879); //Quelzie's Super Secret Society Stash Space has clod hoppers
				break;
			
			case "ungulith":
				print("We're going to go get a ungulith from the clan");
				switchClan(2047009989); //Dread Emporium has Unguliths
				break;
			
			default: //Go to OldCWs for a faxbot
				print("We need a faxbot from OldCWs");
				switchClan(14909);
				chat_private("cwbot" , "!fax");
				abort("Go get a fax from CWBot");
				//check fax and maybe change it based on norms?
		}
	}
	currentFax = checkTheFax(monsterToFax, StartingClan);
	if(monsterToFax == currentFax){
		getTheFax();
	}
	//now that we have the fax, switch back to the starting clan
	if (item_amount( $item[photocopied monster] ).to_int() > 0){
	switchClan(StartingClan);
	}
}
